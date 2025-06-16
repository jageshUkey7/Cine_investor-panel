package com.abcm.ablepay.pg.security;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@NoArgsConstructor
@Data  
@Table(name = "users")  
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)  
    @Column(name = "ref_id")
    private Long refId;  
    
    @Column(nullable = false, unique = true)
    private String username;
    
    @Column(nullable = false)  
    private String password;  
    
    @Column(length = 1000)  
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
