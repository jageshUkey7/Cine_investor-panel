package com.abcm.ablepay.pg.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;
import com.abcm.ablepay.pg.security.SecurityService;
import com.abcm.ablepay.pg.security.User;

import jakarta.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/user")
public class UserController {

    @Autowired
    private SecurityService securityService;
    
    //login method
    @PostMapping("/login")
    public ResponseEntity<String> login(
            @RequestParam String username, 
            @RequestParam String password,
            HttpSession session) {
        ResponseEntity<String> response = securityService.authenticateUser(username, password);
        if (response.getStatusCode().is2xxSuccessful()) {
            session.setAttribute("username", username);
        }
        return response;
    }
    
    //signup method
    @PostMapping("/signup")
    public ResponseEntity<String> signUp(
            @RequestParam("FirstName") String firstname,
            @RequestParam("LastName") String lastname,
            @RequestParam String email,
            @RequestParam String username,
            @RequestParam String password) {
        User user = new User();
        user.setFirstname(firstname);
        user.setLastname(lastname);
        user.setEmail(email);
        user.setUsername(username);
        user.setPassword(password);
        return securityService.createUser(user);
    }
    
    @GetMapping("/getCurrentUser")
    public ResponseEntity<User> getCurrentUser(HttpSession session) {
        // Try SecurityContextHolder first
        String username = SecurityContextHolder.getContext().getAuthentication() != null ?
            SecurityContextHolder.getContext().getAuthentication().getName() : null;
        
        // Fallback to session if SecurityContextHolder is empty
        if (username == null || username.equals("anonymousUser")) {
            username = (String) session.getAttribute("username");
        }
        
        if (username == null || username.trim().isEmpty()) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(null);
        }
        
        User user = securityService.getUserByUsername(username);
        if (user == null) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
        }
        
        return ResponseEntity.ok(user);
    }
    
    @GetMapping("/getAllUsers")
    public ResponseEntity<List<User>> getAllUsers(
            @RequestParam(required = false, defaultValue = "") String search) {
        try {
            List<User> users = securityService.getAllUsers(search);
            return ResponseEntity.ok(users);
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(null);
        }
    }
    
    @PatchMapping("/update")
    public ResponseEntity<String> updateUser(@RequestBody Map<String, String> updates) {
        String username = updates.get("username");
        if (username == null || username.trim().isEmpty()) {
            return ResponseEntity.badRequest().body("Username is required");
        }
        User user = securityService.getUserByUsername(username);
        if (user == null) {
            return ResponseEntity.badRequest().body("User not found");
        }
        String result = securityService.updateUser(user, updates);
        if (result.startsWith("Error")) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(result);
        }
        return ResponseEntity.ok(result);
    }
}
 