package com.soloproject.hondana.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class User {
	
	@GetMapping("/register")
	public String index() {
		return "index.jsp";
	}
}
