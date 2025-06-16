package com.abcm.ablepay.pg.security;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Configuration  
public class SecurityConfig {
    
    private static final Logger log = LoggerFactory.getLogger(SecurityConfig.class);

    @Autowired
    private UserDetailsServiceImpl userDetailsService;   
    
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
    
    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration authConfig) throws Exception {
        return authConfig.getAuthenticationManager();
    }

    @Bean
    public DaoAuthenticationProvider authenticationProvider() {
        DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
        authProvider.setUserDetailsService(userDetailsService);  
        authProvider.setPasswordEncoder(passwordEncoder());
        return authProvider;
    }

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http.authorizeHttpRequests(auth -> auth
                .requestMatchers("/**").permitAll()
                .anyRequest().authenticated())
            .formLogin(formLogin -> formLogin
                .loginPage("/login")
                .loginProcessingUrl("/dologin")
                .defaultSuccessUrl("/dashboard")
                .failureUrl("/login?error"))
            .logout(logout -> logout
                .logoutSuccessHandler(new LogoutSuccessHandler() {
                    @Override
                    public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response,
                            Authentication authentication) throws IOException {
                        if (authentication != null) {
                            log.info("User logged out: {}", authentication.getName());
                        }
                        response.sendRedirect(request.getContextPath() + "/login");
                    }
                })
                .deleteCookies("JSESSIONID"))
            .csrf(csrf -> csrf.disable());

        return http.build();
    }
}
