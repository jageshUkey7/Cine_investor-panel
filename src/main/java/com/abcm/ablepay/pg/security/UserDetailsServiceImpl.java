package com.abcm.ablepay.pg.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.core.userdetails.User.UserBuilder;
import org.springframework.stereotype.Service;


@Service
public class UserDetailsServiceImpl implements UserDetailsService{

	  
     
	    @Autowired
	    private UserRepository userRepository;

	    @Override
	    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
	    	
	    	
	    	
	    	User user = userRepository.findByUsername(username);

	    	if (user == null) {
	    	    throw new UsernameNotFoundException("User not found: " + username);
	    	}
	        
	        UserBuilder builder = org.springframework.security.core.userdetails.User.withUsername(username);
	        builder.password(user.getPassword());
	        builder.roles("USER"); // Set role (customize as needed)
	        
	        return builder.build();
	    }
	    
	    public User getLoggedUser() {
    		SecurityContextHolder.getContext().getAuthentication().getDetails();
    		String name = SecurityContextHolder.getContext().getAuthentication()
    				.getName();

    		String username = (!name.equals("anonymousUser")) ? name : null;
    		User user = userRepository.findByUsername(username);
    		return user != null ? user : null;
    	}
}