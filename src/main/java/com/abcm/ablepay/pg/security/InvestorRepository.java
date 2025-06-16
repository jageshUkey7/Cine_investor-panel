package com.abcm.ablepay.pg.security;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;

@Repository
public interface InvestorRepository extends JpaRepository<Investor, Long> {
    List<Investor> findByInvestmentDateBetween(LocalDate from, LocalDate to);
    Investor findByUsername(String username);
}