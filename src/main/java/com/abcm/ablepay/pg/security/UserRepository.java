package com.abcm.ablepay.pg.security;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import jakarta.transaction.Transactional;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {  
    User findByUsername(String username);
    
    @Modifying
    @Transactional
    @Query(value = "UPDATE users SET progress_id = ?2 WHERE ref_id = ?1", nativeQuery = true) 
    void updateProgressId(Long refId, int progressId);
}
