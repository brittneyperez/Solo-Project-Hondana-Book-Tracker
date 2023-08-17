package com.soloproject.hondana.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.soloproject.hondana.models.Book;
import com.soloproject.hondana.models.User;

@Repository
public interface BookRepository extends CrudRepository<Book, Long> {
	List<Book> findAll(); // retrieve all books
	List<Book> findByWriterNot(User user); // find books published by other users
	
	List<Book> findByReadersContaining(User user); // find readers of a book they favroited
	List<Book> findByReadersNotContaining(User user); // find readers who didn't favorite the books
	
//	! Search feature coming soon!
	Optional<Book> findByTitle( String title);
}
