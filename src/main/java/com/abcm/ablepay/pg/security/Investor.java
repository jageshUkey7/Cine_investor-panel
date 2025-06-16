package com.abcm.ablepay.pg.security;

import lombok.Data;
import lombok.NoArgsConstructor;
import jakarta.persistence.*;
import java.time.LocalDate;
import java.time.LocalDateTime;

@NoArgsConstructor
@Data 
@Entity
@Table(name = "investors")
public class Investor {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String email;

    @Column(name = "Phone_number")
    private String phone;
    
    private String address;

    @Column(nullable = false, unique = true)
    private String username;
    
    @Column(name = "pan_card_number")
    private String panCardNumber;

    @Column(name = "aadhaar_number")
    private String aadhaarNumber;

    @Column(name = "bank_account_number")
    private String bankAccountNumber;

    @Column(name = "gst_number")
    private String gstNumber;

    @Column(name = "kyc_status")
    private Boolean kycStatus;

    @Column(name = "aadhaar_status")
    private String aadhaarStatus;

    @Column(name = "bank_status")
    private String bankStatus;

    @Column(name = "pan_status")
    private String panStatus;
    
    @Column(name = "date_of_birth")
    private LocalDate dateOfBirth;

    @Column(name = "bank_name")
    private String bankName;

    @Column(name = "ifsc_code")
    private String ifscCode;

    @Column(name = "annual_income")
    private Double annualIncome;

    @Column(name = "occupation")
    private String occupation;

    private Double investmentAmount;
    private LocalDate investmentDate;
    
    private String companyName;
    private Boolean isVerified;
   
    @Column(name = "created_at", updatable = false)
    private LocalDateTime createdAt;

    @PrePersist
    protected void onCreate() {
        this.createdAt = LocalDateTime.now();
    }
}

