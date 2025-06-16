package com.abcm.ablepay.pg.security;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class SecurityService {

    @Autowired
    private InvestorRepository investorRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private UserDetailsServiceImpl userDetailsServiceImpl;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private AuthenticationManager authenticationManager;



    public ResponseEntity<String> authenticateUser(String username, String password) {
        try {
            Authentication authentication = authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(username, password)
            );
            return ResponseEntity.ok("Login successful!");
        } catch (Exception e) {
            return ResponseEntity.badRequest().body("Invalid username or password");
        }
    }

    public ResponseEntity<String> createUser(User user) {
        if (userRepository.findByUsername(user.getUsername()) != null) {
            return ResponseEntity.badRequest().body("User already exists");
        }
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setCreatedOn(LocalDateTime.now().toString());
        user.setCreatedBy("signup_form");
        userRepository.save(user);
        return ResponseEntity.ok("User registered successfully");
    }


    
    private User getUserById(Long refId) {
        return userRepository.findById(refId).orElse(null);
    }

    public List<User> getAllUsers(String search) {
        List<User> allUsers = userRepository.findAll();
        if (search == null || search.trim().isEmpty()) {
            return allUsers;
        }
        String searchLower = search.toLowerCase();
        return allUsers.stream()
                .filter(user ->
                    user.getUsername().toLowerCase().contains(searchLower) ||
                    user.getFirstname().toLowerCase().contains(searchLower) ||
                    user.getLastname().toLowerCase().contains(searchLower) ||
                    user.getEmail().toLowerCase().contains(searchLower)
                )
                .collect(Collectors.toList());
    }

    public User getUserByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    public String updateUser(User user, Map<String, String> updates) {
        try {
            if (updates.containsKey("firstname")) {
                user.setFirstname(updates.get("firstname"));
            }
            if (updates.containsKey("lastname")) {
                user.setLastname(updates.get("lastname"));
            }
            if (updates.containsKey("email")) {
                user.setEmail(updates.get("email"));
            }
            if (updates.containsKey("password") && !updates.get("password").isEmpty()) {
                String encodedPassword = passwordEncoder.encode(updates.get("password"));
                user.setPassword(encodedPassword);
            }
            userRepository.save(user);
            return "User updated successfully";
        } catch (Exception e) {
            return "Error updating user: " + e.getMessage();
        }
    }

    public String registerKYC(
        String username,
        LocalDate dob,
        String phonenumber,
        String email,
        String aadhaarNumber,
        String address1,
        String address2,
        String city,
        String state,
        String zip,
        String country,
        String panNumber,
        String bankName,
        String bankAccountNumber,
        String occupation,
        String ifsc,
        Double income,
        String panStatus,
        String companyname,
        String gstnumber,
        String aadhaarStatus,
        Boolean kycStatus
) {
    try {
        if (username == null || username.trim().isEmpty()) {
            throw new IllegalArgumentException("Username cannot be empty");
        }
        Investor investor = investorRepository.findByUsername(username);
        if (investor == null) {
            investor = new Investor();
            investor.setUsername(username);
        }
        String[] addressParts = {address1, address2, city, state, zip, country};
        String address = String.join(", ", java.util.Arrays.stream(addressParts)
                .filter(s -> s != null && !s.trim().isEmpty())
                .toArray(String[]::new));
        if (address.trim().isEmpty()) {
            throw new IllegalArgumentException("At least one address field must be provided");
        }
        investor.setDateOfBirth(dob);
        investor.setPhone(phonenumber);
        investor.setEmail(email);
        investor.setAadhaarNumber(aadhaarNumber);
        investor.setAddress(address);
        investor.setPanCardNumber(panNumber);
        investor.setBankName(bankName);
        investor.setBankAccountNumber(bankAccountNumber);
        investor.setIfscCode(ifsc);
        investor.setOccupation(occupation != null ? occupation.trim() : null);
        investor.setAnnualIncome(income);
        investor.setCompanyName(companyname != null ? companyname.trim() : null);
        investor.setGstNumber(gstnumber != null ? gstnumber.trim() : null);
        investor.setKycStatus(kycStatus);
        investor.setPanStatus(panStatus);
        investor.setAadhaarStatus(aadhaarStatus);
        investor.setBankStatus("pending"); 
        investorRepository.save(investor);
        return "KYC submitted successfully";
    } catch (Exception e) {
        throw new RuntimeException("Failed to save KYC data: " + e.getMessage(), e);
    }
}
}