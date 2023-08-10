package com.soloproject.hondana;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@SpringBootApplication
public class HondanaBookTrackerApplication {

	public static void main(String[] args) {
		SpringApplication.run(HondanaBookTrackerApplication.class, args);
	}
	
	@RequestMapping("/")
	public String index() {
		return "redirect:/register";
	}
}
