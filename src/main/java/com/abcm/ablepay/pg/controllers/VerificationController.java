package com.abcm.ablepay.pg.controllers;

import java.util.HashMap;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import com.abcm.ablepay.pg.security.VrificationService;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.core.type.TypeReference;

@RestController
public class VerificationController {

    @Autowired
    private VrificationService vrificationService;

    @PostMapping("/generate")
    public ResponseEntity<Map<String, Object>> generateOtp(@RequestBody Map<String, String> request) {
        String adhar = request.get("adhar");
        String responseBody = vrificationService.generateOtp(adhar);
        try {
            ObjectMapper mapper = new ObjectMapper();
            Map<String, Object> responseMap = mapper.readValue(responseBody, new TypeReference<Map<String, Object>>() {});
            return ResponseEntity.ok(responseMap);
        } catch (Exception e) {
            System.out.println("Controller error (generate): " + e.getMessage());  
            Map<String, Object> errorResponse = new HashMap<>();
            errorResponse.put("statusCode", 500);
            errorResponse.put("msg", "error");
            errorResponse.put("message", "Failed to parse response: " + e.getMessage());
            return ResponseEntity.status(500).body(errorResponse);
        }
    }

    @PostMapping("/verify")
    public ResponseEntity<Map<String, Object>> verifyOtp(@RequestBody Map<String, String> request) {
        String otp = request.get("otp");
        String requestId = request.get("request_id");
        String responseBody = vrificationService.verifyAadhar(otp, requestId);
        try {
            ObjectMapper mapper = new ObjectMapper();
            Map<String, Object> responseMap = mapper.readValue(responseBody, new TypeReference<Map<String, Object>>() {});
            return ResponseEntity.ok(responseMap);
        } catch (Exception e) {
            System.out.println("Controller error (verify): " + e.getMessage());  
            Map<String, Object> errorResponse = new HashMap<>();
            errorResponse.put("statusCode", 500);
            errorResponse.put("msg", "error");
            errorResponse.put("message", "Failed to parse response: " + e.getMessage());
            return ResponseEntity.status(500).body(errorResponse);
        }
    }

    @PostMapping("/securePanVerify")
    public ResponseEntity<Map<String, Object>> securePanVerify(@RequestBody Map<String, String> request) {
        String pan = request.get("pan");
        String responseBody = vrificationService.verifyPan(pan);
        try {
            ObjectMapper mapper = new ObjectMapper();
            Map<String, Object> responseMap = mapper.readValue(responseBody, new TypeReference<Map<String, Object>>() {});
            return ResponseEntity.ok(responseMap);
        } catch (Exception e) {
            System.out.println("Controller error (securePanVerify): " + e.getMessage());  
            Map<String, Object> errorResponse = new HashMap<>();
            errorResponse.put("statusCode", 500);
            errorResponse.put("msg", "error");
            errorResponse.put("message", "Failed to parse response: " + e.getMessage());
            return ResponseEntity.status(500).body(errorResponse);
        }
    }
}