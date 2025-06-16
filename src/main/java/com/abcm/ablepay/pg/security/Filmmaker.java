package com.abcm.ablepay.pg.security;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@NoArgsConstructor
@Data  
@Table(name = "Filmmakers")

public class Filmmaker {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) // Best for MySQL
    @Column(name = "ref_id")
    private Long refId; // Changed from Integer to Long for scalability
    
    @Column(nullable = false, unique = true)
    private String username;
    
    @Column(nullable = false) // Password should not be null
    private String password; // Will be stored in encrypted format
    
    @Column(length = 1000) // Avoid using columnDefinition unless necessary
    private String phone;
    
    @Column(name = "merchant_firstname", length = 50)
    private String firstname;

    @Column(name = "merchant_lastname", length = 50)
    private String lastname;

    @Column(name = "merchant_email", length = 50)
    private String email;

    @Column(length = 50)
    private String createdOn;

    @Column(length = 50)
    private String createdBy;

    @Column(columnDefinition = "int default 0")
    private int progressId;
}
