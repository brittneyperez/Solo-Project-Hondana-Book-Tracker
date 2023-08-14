package com.soloproject.hondana.models;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "books")
public class Book {
	
	// * BASIC CLASS OBJECT ATTRIBUTES ----------
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(updatable = false)
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date createdAt;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date updatedAt;
	
	@PrePersist
	protected void onCreate() {
		this.createdAt = new Date();
	}
	@PreUpdate
	protected void onUpdate() {
		this.updatedAt = new Date();
	}
	
	
	// * OBJECT-SPECIFIC ATTRIBUTES -------------
	@NotEmpty(message = "Title is required.")
	@Size(min = 2, message = "Must be at least 2 characters")
	private String title;
	
	@NotEmpty(message = "Author must not be blank.")
	@Size(min = 2, message = "Author's name must be at least 2 characters.")
	private String author;
	
	@NotEmpty(message = "Your thoughts are required.")
	@Size(min= 2, max = 500, message = "Your thoughts must be between 2 and 500 characters.")	
	private String bookDetails;
	
	
	// * TABLE RELATIONSHIP ATTRIBUTES ----------
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "writer_id")
	private User writer;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "reader_id")
	private User reader;
	
	
	// * CONSTRUCTORS ---------------------------
	public Book() {}
	public Book( String title, String author, String bookDetails ) {
		this.title = title;
		this.author = author;
		this.bookDetails = bookDetails;
	}
	
	
	// * GETTERS & SETTERS ----------------------
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getBookDetails() {
		return bookDetails;
	}
	public void setBookDetails(String bookDetails) {
		this.bookDetails = bookDetails;
	}
	public User getWriter() {
		return writer;
	}
	public void setWriter(User writer) {
		this.writer = writer;
	}
	public User getReader() {
		return reader;
	}
	public void setReader(User reader) {
		this.reader = reader;
	}
}
