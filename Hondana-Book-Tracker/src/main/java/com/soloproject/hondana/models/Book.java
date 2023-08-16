package com.soloproject.hondana.models;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
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
	
	@NotEmpty(message = "Your thoughts are required.")
	@Size(min= 2, max = 500, message = "Your thoughts must be between 2 and 500 characters.")	
	private String bookDetails;
	
	
	// * TABLE RELATIONSHIP ATTRIBUTES ----------
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "writer_id")
	private User writer;
	
	@ManyToMany(fetch=FetchType.LAZY, cascade = CascadeType.ALL)
	@JoinTable(
		name = "favoriteBooks",
		joinColumns = @JoinColumn(name = "book_id"),
		inverseJoinColumns = @JoinColumn(name = "user_id")
	)
	private List<User> readers;
	
	
	// * CONSTRUCTORS ---------------------------
	public Book() {}
	public Book( String title, String bookDetails, User writer ) {
		this.title = title;
		this.bookDetails = bookDetails;
		this.writer = writer;
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
	public List<User> getReaders() {
		return readers;
	}
	public void setReaders(List<User> readers) {
		this.readers = readers;
	}
}
