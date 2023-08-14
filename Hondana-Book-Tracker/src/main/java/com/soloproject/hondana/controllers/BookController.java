package com.soloproject.hondana.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.soloproject.hondana.models.Book;
import com.soloproject.hondana.models.User;
import com.soloproject.hondana.services.BookService;
import com.soloproject.hondana.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
@RequestMapping("/book")
public class BookController {
	
	@Autowired
	private UserService uService;
	@Autowired
	private BookService bookService;
	
//	* ADD BOOK
	@GetMapping("/add")
	public String addBook(@ModelAttribute("newBook") Book newBook) {
		return "add-book.jsp";
	}
	
	@PostMapping("/create")
	public String saveBookToDb(
			@Valid @ModelAttribute("newBook") Book newBook,
			BindingResult result, Model model, HttpSession session
			) {
		if (result.hasErrors()) {
			return "add-book.jsp";
		}
		Long userId = (Long) session.getAttribute("userId"); // preserve userId in session when creating book
		User currentUser = this.uService.findUserById(userId);
		newBook.setWriter(currentUser);
		if (newBook.getTitle() != null && !newBook.getAuthor().isEmpty() && !newBook.getBookDetails().isEmpty()) {
			bookService.createBook(newBook);
		}
		System.out.printf("\n# Adding book, %s, to library...", newBook.getTitle());
		return "redirect:/home";
	}
	
	
//	* SHOW BOOK
//	@GetMapping("/show/{id}")
//	public String showBookDetails() {
//		return null;
//	}
	

//	* EDIT BOOK
//	* DELETE BOOK
}
