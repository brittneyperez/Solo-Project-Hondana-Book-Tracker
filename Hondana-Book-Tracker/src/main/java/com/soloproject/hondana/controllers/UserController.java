package com.soloproject.hondana.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.soloproject.hondana.models.User;
import com.soloproject.hondana.services.UserService;
import com.soloproject.hondana.validators.LoginCredential;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class UserController {
	
	@Autowired
	private UserService uService;
	
	// * REGISTER -------------------------------
	@GetMapping("/register")
	public String index( @ModelAttribute("newUser") User newUser ) {
		return "index.jsp";
	}
	
	@PostMapping("/register-user")
	public String register(
			@Valid @ModelAttribute("newUser") User registeringUser,
			BindingResult result, Model model, HttpSession session
			) {
		// 1 Call uService.registerUser() method to perfrom extra validations when creating a user:
		User thisUser = this.uService.registerUser(registeringUser, result);
		// 2 If/when "null" is returned from uService.registerUser(), then return the form with errors:
		if (result.hasErrors()) {
			return "index.jsp";
		}
		// 3 If BindingResult is valid, then save thisUser to db and store id in session to log them in:
		session.setAttribute("userId", thisUser.getId());
		System.out.printf("\n$ Welcome user, @user%s...\n", thisUser.getId());
		return "redirect:/home";
	}
	
	
	// * LOGIN ----------------------------------
	@GetMapping("/login")
	public String loginPage( @ModelAttribute("loginUser") LoginCredential newLoginObject ) {
		return "login-page.jsp";
	}
	
	@PostMapping("/login-user")
	public String login(
			@Valid @ModelAttribute("loginUser") LoginCredential newloginObject,
			BindingResult result, Model model, HttpSession session
			) {
		User thisUser = this.uService.loginUser(newloginObject, result);
		if (result.hasErrors()) {
			return "login-page.jsp";
		}
		session .setAttribute("userId", thisUser.getId());
		System.out.printf("\n$ Welcome back, @user%s...\n", thisUser.getId());
		return "redirect:/home";
	}
	
	// * HOME -----------------------------------
	@GetMapping("/home")
	public String homepage( Model model, HttpSession session ) {
//		if (session.getAttribute("userId") == null) {
//			return "redirect:/register";
//		}
		
//		Long userId = (long) session.getAttribute("userId");
//		User currentUser = this.uService.findUserById(userId);
//		model.addAttribute("currentUser", currentUser);
		// add book model attribute
		return "home.jsp";
	}
	
}
