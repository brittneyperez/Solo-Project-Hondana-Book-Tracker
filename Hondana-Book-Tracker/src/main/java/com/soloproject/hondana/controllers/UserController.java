package com.soloproject.hondana.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.soloproject.hondana.models.User;
import com.soloproject.hondana.services.BookService;
import com.soloproject.hondana.services.UserService;
import com.soloproject.hondana.validators.LoginCredential;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class UserController {
	
	@Autowired
	private UserService uService;
	@Autowired
	private BookService bService;
	
//	* REGISTER ----------------------------------
	@GetMapping("/register")
	public String index( @ModelAttribute("newUser") User newUser ) {
		return "index.jsp";
	}
	
	@PostMapping("/register-user")
	public String register(
			@Valid @ModelAttribute("newUser") User registeringUser,
			BindingResult result, Model model, HttpSession session
			) {
		User thisUser = this.uService.registerUser(registeringUser, result);
		if (result.hasErrors()) { // Validation errors exist, return to the registration page with errors
			return "index.jsp";
		} 
		// If BindingResult is valid, continue with successful registration
		session.setAttribute("userId", thisUser.getId());
		System.out.printf("\n$ Welcome user, @user%s...\n", thisUser.getId());
		return "redirect:/home";
	}
	
	
//	* LOGIN -------------------------------------
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
	
//	* HOME --------------------------------------
	@GetMapping("/home")
	public String homepage( Model model, HttpSession session ) {
		if (session.getAttribute("userId") == null) {
			return "redirect:/login";
		}
		
		Long userId = (long) session.getAttribute("userId");
		User currentUser = this.uService.findUserById(userId);
		model.addAttribute("currentUser", currentUser);
//		! Todo: Implement a list of books not writte by the user to favorite/unfavorite
//		model.addAttribute("books", this.bService.findAllBooks());
		model.addAttribute("myBooks", currentUser.getMyBooks());
		// add book model attribute
		return "home.jsp";
	}
	
//	* USER DASHBOARDS ---------------------------
	@GetMapping("/u/profile")
	public String profilePage( Model model, HttpSession session ) {
		if (session.getAttribute("userId") == null) {
			return "redirect:/login";
		}
		
		Long userId = (long) session.getAttribute("userId");
		User currentUser = this.uService.findUserById(userId);
		model.addAttribute("currentUser", currentUser);
//		add book model attribute where it shows books favorited by the user, giving the option to unfavorite from their
		return "profile-page.jsp";
	}
	
	@GetMapping("/u/show")
	public String anotherUserPage( Model model, HttpSession session ) {
		if (session.getAttribute("userId") == null) {
			return "redirect:/login";
		}
		
		Long userId = (long) session.getAttribute("userId");
		User currentUser = this.uService.findUserById(userId);
		model.addAttribute("currentUser", currentUser);
		// add book model attribute
		return "other-user-page.jsp";
	}
	
	
//	* LOGOUT ------------------------------------
	@GetMapping("/logout")
	public String logout( HttpSession session ) {
		session.invalidate();
		System.out.println("\n$ See you soon!\n");
		return "redirect:/";
	}
}
