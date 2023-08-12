package com.soloproject.hondana.services;

import java.time.LocalDate;
import java.time.Period;
import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.soloproject.hondana.models.User;
import com.soloproject.hondana.repositories.UserRepository;
import com.soloproject.hondana.validators.LoginCredential;

@Service
public class UserService {
	
	@Autowired // Connection to Repository from Service:
	private UserRepository uRepo;
	
	// Find an existing user:
	public User findUserById( Long id ) {
		return this.uRepo.findById(id).orElse(null);
	}
	
	// Validate registering user's age before registerUser():
	private void validateAge( User newUser, BindingResult result ) {
		LocalDate currentDate = LocalDate.now();
		LocalDate usersDOB = newUser.getDateOfBirth();
		if (usersDOB != null) {
			int age = Period.between(usersDOB, currentDate).getYears();
			if (age < 13) {
				result.rejectValue("dateOfBirth", "InvalidAge", "You must be at least 13 years old to register");
			}
		}
	}
	
	// Validate credentials of registering user with an existing user's and send back errors before completing registration
	public User registerUser( User newUser, BindingResult result ) {
		// 1 Find in db if email binded to form exists, otherwise accept it:
		Optional<User> potentialUser = this.uRepo.findByEmail(newUser.getEmail());
		if (potentialUser.isPresent()) {
			result.rejectValue("email", "Matches", "Email is already registered. Please either choose another one or log in");
		}
		// 2 Find in db if username binded to form exists, otherwise accept it:
		potentialUser = this.uRepo.findByUsername(newUser.getUsername());
		if (potentialUser.isPresent()) {
			result.rejectValue("username", "Matches", "Username is already taken");
		}
		// 3 Perform password matching validation:
		if (!newUser.getPassword().equals(newUser.getConfirmPassword())) {
			result.rejectValue("confirmPassword", "Matches", "Passwords must match");
		}
		// 4 Perform age validation:
		validateAge(newUser, result);
		// 5 Return "null" if any errors present to send back to controller and display them in the front-end:
		if (result.hasErrors()) {
			return null;
		}
		// 6 If everything is valid, hash and set password to save user to db:
		String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
		newUser.setPassword(hashed);
		User completeRegistration = this.uRepo.save(newUser);
		return completeRegistration;
	}
	
	// Check credentials of potential user with existing users, send back errors if not valid, and let them in if they are valid:
	public User loginUser( LoginCredential newLoginObject, BindingResult result ) {
		// 1 Assuming loginCredential (email/username) exists in the db (binded to form), search db for potential user:
		String loginCredential = newLoginObject.getLoginCredential();
		Optional<User> potentialUser;
		// 2 Find email in db based on results binded to form and reject, otherwise accept:
		potentialUser = this.uRepo.findByEmail(loginCredential);
		if (potentialUser.isPresent()) {
			User user = potentialUser.get();
			if ( !BCrypt.checkpw(newLoginObject.getPassword(), user.getPassword()) ) {
				result.rejectValue("password", "Matches", "Invalid credentials");
			}
			return user;
		} // ...if not email...
		// 3 Find username in db based on the results binded to form and reject, otherwise accept:
		potentialUser = this.uRepo.findByUsername(loginCredential);
		if (potentialUser.isPresent()) {
			User user = potentialUser.get();
			if ( !BCrypt.checkpw(newLoginObject.getPassword(), user.getPassword()) ) {
				result.rejectValue("password", "Matches", "Invalid credentials");
			}
			return user;
		}
		// 4 Return "null" if any errors present to send back to controller and display them in the front-end:
		result.rejectValue("loginCredential", "Matches", "Invalid credentials");
		return null;
	}
	
	// Coming Soon! -- UPDATE & DELETE
}
