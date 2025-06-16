package com.abcm.ablepay.pg.controller;

import com.abcm.ablepay.pg.security.Investor;
import com.abcm.ablepay.pg.security.InvestorRepository;
import com.abcm.ablepay.pg.security.SecurityService;
import com.abcm.ablepay.pg.security.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.Map;

 

import org.springframework.web.bind.annotation.PostMapping;
 


@RestController
@RequestMapping("/api/dashboard")
public class InvestorsController {

    @Autowired
    private InvestorRepository investorRepository;

     @Autowired
    private SecurityService securityService;

    @GetMapping("/investments")
    public ResponseEntity<Map<String, Double>> getInvestmentData(
            @RequestParam(value = "username", required = false) String paramUsername) {
        String username = paramUsername != null ? paramUsername : 
            SecurityContextHolder.getContext().getAuthentication().getName();
        System.out.println("Username: " + username);
        if (username == null || username.equals("anonymousUser")) {
            System.out.println("No valid username, returning zeros");
            return ResponseEntity.ok(Map.of("yourInvestment", 0.0, "totalInvestment", 0.0));
        }
        Investor investor = investorRepository.findByUsername(username);
        System.out.println("Investor: " + (investor != null ? investor.getUsername() + ", Amount: " + investor.getInvestmentAmount() : "null"));
        Double yourInvestment = investor != null && investor.getInvestmentAmount() != null 
            ? investor.getInvestmentAmount() : 0.0;
        Double totalInvestment = investorRepository.findAll().stream()
            .map(Investor::getInvestmentAmount)
            .filter(amount -> amount != null)
            .mapToDouble(Double::doubleValue)
            .sum();
        System.out.println("Your Investment: " + yourInvestment + ", Total Investment: " + totalInvestment);
        Map<String, Double> result = new HashMap<>();
        result.put("yourInvestment", yourInvestment);
        result.put("totalInvestment", totalInvestment);
        return ResponseEntity.ok(result);
    }

    @PostMapping("/registerkyc")
    public ResponseEntity<String> registerKYC(
            @RequestParam String username,
            @RequestParam String phonenumber,
            @RequestParam String occupation,
            @RequestParam String companyname,
            @RequestParam String gstnumber,
            @RequestParam String dob,
            @RequestParam String email,
            @RequestParam String aadhaarNumber,
            @RequestParam String address1,
            @RequestParam(required = false) String address2,
            @RequestParam String city,
            @RequestParam String state,
            @RequestParam String zip,
            @RequestParam String country,
            @RequestParam String panNumber,
            @RequestParam String bankName,
            @RequestParam String accountNumber,
            @RequestParam String ifsc,
            @RequestParam String income,
            @RequestParam(required = false) String panStatus,
            @RequestParam(required = false) String aadhaarStatus,
            @RequestParam(required = false) String kycStatus  
    ) {
        try {
            if (username == null || username.trim().isEmpty()) {
                return ResponseEntity.badRequest().body("Username is required");
            }
            User user = securityService.getUserByUsername(username);
            if (user == null) {
                return ResponseEntity.badRequest().body("User not found");
            }
           
            LocalDate parsedDob;
            try {
                parsedDob = LocalDate.parse(dob);
            } catch (Exception e) {
                return ResponseEntity.badRequest().body("Invalid date of birth format: " + e.getMessage());
            }
            Double parsedIncome;
            try {
                parsedIncome = income != null && !income.trim().isEmpty() ? Double.parseDouble(income) : null;
            } catch (NumberFormatException e) {
                return ResponseEntity.badRequest().body("Invalid income format: " + e.getMessage());
            }
            Boolean parsedKycStatus;
            try {
                parsedKycStatus = kycStatus != null ? Boolean.parseBoolean(kycStatus) : false; // Parse as boolean, default to false if not provided
            } catch (Exception e) {
                return ResponseEntity.badRequest().body("Invalid kycStatus format: " + e.getMessage());
            }
            String result = securityService.registerKYC(
                    username, parsedDob, phonenumber, email,
                    aadhaarNumber, address1, address2, city, state, zip, country,
                    panNumber, bankName, accountNumber, occupation, ifsc, parsedIncome,
                    panStatus, companyname, gstnumber, aadhaarStatus, parsedKycStatus
            );
            return ResponseEntity.ok(result);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Failed to process KYC: " + e.getMessage());
        }
    }
}