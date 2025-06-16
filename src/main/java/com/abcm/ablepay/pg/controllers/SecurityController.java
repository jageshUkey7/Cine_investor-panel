package com.abcm.ablepay.pg.controllers;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
 
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


import jakarta.servlet.http.HttpSession;

@Controller
public class SecurityController {

	Logger log =LoggerFactory.getLogger(getClass());



	@GetMapping("/login")
	public String login() {
		log.info("inside login ");
		return "login";
	}

	@GetMapping("/signup")
    public String signup() {
        log.info("inside signup - Rendering signup.jsp");
        return "signup"; // Maps to signup.jsp
    }

	@GetMapping("/dashboard")
	public String dashboard(Model model,HttpSession session) {
					log.info("inside dashboard ");
		return "dashboard";
	}


}
