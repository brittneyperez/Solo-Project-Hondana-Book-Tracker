package com.soloproject.hondana.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soloproject.hondana.models.Book;
import com.soloproject.hondana.repositories.BookRepository;

@Service
public class BookService {
	
	@Autowired
	private BookRepository bookRepo;
	
//	* CREATE
	public Book createBook(Book newBook) {
		return bookRepo.save(newBook);
	}
	
	
//	* READ
	public List<Book> findAllBooks() {
		return this.bookRepo.findAll();
	}
	
	public Book findBookById(Long id) {
		return this.bookRepo.findById(id).orElse(null);
	}
	
	
//	* UPDATE
	public Book updateBook(Book existingBook) {
		return this.bookRepo.save(existingBook);
	}
	
	
//	* DELETE
	public void deleteBook(Long id ) {
		this.bookRepo.deleteById(id);
	}
}
