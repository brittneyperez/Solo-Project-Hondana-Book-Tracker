package com.soloproject.hondana.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
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
	public String addBook(Model model, HttpSession session) {
		// Get the current user
        Long userId = (Long) session.getAttribute("userId");
        User currentUser = this.uService.findUserById(userId);

        // Create a new Book object and set the writer attribute
         Book newBook = new Book();
        newBook.setWriter(currentUser);
        
        // Add the newBook object to the model
        model.addAttribute("newBook", newBook);
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
		
		bookService.createBook(newBook.getTitle(), newBook.getBookDetails(), currentUser);
		System.out.printf("\n# Publising book, %s,...", newBook.getTitle());
		return "redirect:/u/profile";
	}
	
	
//	* SHOW BOOK
//	@GetMapping("/show")
	@GetMapping("/show/{id}")
	public String showBookDetails(@PathVariable("id") Long id,
			Model model, HttpSession session) {
		Book thisBookItem = this.bookService.findBookById(id);
		model.addAttribute("book", thisBookItem);
		if (session.getAttribute("userId") != null) {
			Long userId = (Long) session.getAttribute("userId");
			User currentUser = this.uService.findUserById(userId);
			model.addAttribute("currentUser", currentUser);
		}
		
//		thisBookItem.getWriter().getUsername()
		
		System.out.printf("\n# Loading page for book %s, %s... \n", id, thisBookItem.getTitle());
		return "show-book.jsp";
	}
	

//	* EDIT BOOK
	@GetMapping("/show/{bookId}/edit")
	public String editBookPage( @PathVariable("bookId") Long bookId, Model model ) {
		
		model.addAttribute("bookToEdit", this.bookService.findBookById(bookId));
		return "edit-book.jsp";
	}
	
	@PutMapping("/{id}/update")
	public String editBookDetails(
			@PathVariable("id") Long bookId,
			@Valid @ModelAttribute("bookToEdit") Book originalBook,
			BindingResult result, Model model, HttpSession session
			) {
		if (result.hasErrors()) {
			return "edit-book.jsp";
		}
		
		Book editedBook = this.bookService.findBookById(bookId); // Retrieve the og book to edit.
		// Retrieve user from session:
		Long userId = (Long) session.getAttribute("userId");
		User currentUser = this.uService.findUserById(userId);
		
		// Update attributes changed by the writer:
		editedBook.setTitle(originalBook.getTitle());
		editedBook.setBookDetails(originalBook.getBookDetails());
		editedBook.setWriter(currentUser); // maintain writer attribute as current user
		this.bookService.updateBook(editedBook); // save changes
		
		System.out.printf("\n# Saving changes for book entry #%s, %s...\n", editedBook.getId(), editedBook.getTitle());
		return String.format("redirect:/book/show/%d", editedBook.getId());
	}
	
	
//	* FAVORITE BOOK
	@GetMapping("/{bookId}/favorite")
	public String favoriteThisBook( @PathVariable("bookId") Long bookIdToFavorite, HttpSession session ) {
		Long currentUserId = (Long) session.getAttribute("userId");
		if (currentUserId == null) {
			return "redirect:/login";
		}
		
		Book readersFavoriteBook = this.bookService.findBookById(bookIdToFavorite);
		this.bookService.favoriteBook(readersFavoriteBook, this.uService.findUserById(currentUserId));
		return "redirect:/u/profile";
	}
//	* UNFAVORITE BOOK
	@GetMapping("/{bookId}/unfavorite")
	public String unfavoriteThisBook( @PathVariable("bookId") Long bookIdToRemove, HttpSession session ) {
		Long currentUserId = (Long) session.getAttribute("userId");
		if (currentUserId == null) {
			return "redirect:/login";
		}
		
		Book thisBook = this.bookService.findBookById(bookIdToRemove);
		this.bookService.unfavoriteBook(thisBook, this.uService.findUserById(currentUserId));
		return "redirect:/u/profile";
	}
	
	
//	* DELETE BOOK
	@GetMapping("/{bookId}/delete")
	public String deleteThisBook(@PathVariable("bookId") Long bookId) {
		System.out.println("\n# Deleteing book... \n");;
		this.bookService.deleteBook(bookId);
		return "redirect:/u/profile";
	}
}
