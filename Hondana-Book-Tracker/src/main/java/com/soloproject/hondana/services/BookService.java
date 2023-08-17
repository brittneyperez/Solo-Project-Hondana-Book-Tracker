package com.soloproject.hondana.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soloproject.hondana.models.Book;
import com.soloproject.hondana.models.User;
import com.soloproject.hondana.repositories.BookRepository;

@Service
public class BookService {
	
	@Autowired
	private BookRepository bookRepo;
	
//	* CREATE
	public Book createBook(String title, String bookDetails, User writer) {
		Book newBook = new Book(title, bookDetails, writer);
		return bookRepo.save(newBook);
	}
	
	
//	* READ
	public List<Book> findAllBooks() {
		return this.bookRepo.findAll();
	}
	
	public Book findBookById(Long id) {
		return this.bookRepo.findById(id).orElse(null);
	}
	// Find books published by other users:
	public List<Book> findBooksPublishedByOtherUsers(User currentUser) {
		return this.bookRepo.findByWriterNot(currentUser);
	}
	
	
//	* UPDATE
	public Book updateBook(Book existingBook) {
		return this.bookRepo.save(existingBook);
	}
	
	
//	* DELETE
	public void deleteBook(Long id ) {
		this.bookRepo.deleteById(id);
	}
	
	
//	* FAVORITE BOOK
	public Book favoriteBook( Book book, User reader ) {
		book.getReaders().add(reader);
		return this.bookRepo.save(book);
	}
	
//	* UNFAVORITE THIS BOOK
	public void unfavoriteBook( Book book, User user ) {
		book.getReaders().remove(user);
		this.bookRepo.save(book);
	}
	
//	* FILTER BOOKS NOT FAVORITED BY CURRENT USER
	public List<Book> findUnfavoritedBooksForThisUser(User reader) {
		return this.bookRepo.findByReadersNotContaining(reader);
	}
}
