package com.abcm.ablepay.pg.security;

import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class VrificationService {

    public String generateOtp(String adhar) {
        ObjectMapper mapper = new ObjectMapper();
        try {
            String url = "http://localhost:8090/verification/generateOtp";
            RestTemplate restTemplate = new RestTemplate();
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);
            Map<String, String> requestBody = new HashMap<>();
            requestBody.put("adhar", adhar);
            HttpEntity<Map<String, String>> requestEntity = new HttpEntity<>(requestBody, headers);
            ResponseEntity<String> response = restTemplate.postForEntity(url, requestEntity, String.class);
            System.out.println("Main API response: " + response.getBody());

            // Parse main API response
            Map<String, Object> mainApiResponse = mapper.readValue(response.getBody(), Map.class);
            Map<String, Object> proxyResponse = new HashMap<>();
            
            // Check if main API returned a valid requestId
            if (response.getStatusCode().is2xxSuccessful() && mainApiResponse.get("data") != null) {
                proxyResponse.put("statusCode", 200);
                proxyResponse.put("msg", "success");
                proxyResponse.put("data", mainApiResponse.get("data"));
            } else {
                proxyResponse.put("statusCode", 500);
                proxyResponse.put("msg", "error");
                proxyResponse.put("message", "Invalid response from main API: " + response.getBody());
            }
            
            return mapper.writeValueAsString(proxyResponse);
        } catch (Exception e) {
            System.out.println("Proxy error: " + e.getMessage());
            try {
                Map<String, Object> errorResponse = new HashMap<>();
                errorResponse.put("statusCode", 500);
                errorResponse.put("msg", "error");
                errorResponse.put("message", "Error generating OTP: " + e.getMessage());
                return mapper.writeValueAsString(errorResponse);
            } catch (Exception jsonException) {
                return "{\"statusCode\":500,\"msg\":\"error\",\"message\":\"Failed to serialize error response\"}";
            }
        }
    }

    public String verifyAadhar(String otp, String requestId) {
        ObjectMapper mapper = new ObjectMapper();
        try {
            String url = "http://localhost:8090/verification/adharVerify";
            RestTemplate restTemplate = new RestTemplate();
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);
            Map<String, String> requestBody = new HashMap<>();
            requestBody.put("otp", otp);
            requestBody.put("request_id", requestId);
            HttpEntity<Map<String, String>> requestEntity = new HttpEntity<>(requestBody, headers);
            ResponseEntity<String> response = restTemplate.postForEntity(url, requestEntity, String.class);
            System.out.println("Main API response (verify): " + response.getBody());
    
            Map<String, Object> mainApiResponse = mapper.readValue(response.getBody(), Map.class);
            Map<String, Object> proxyResponse = new HashMap<>();
    
            // Parse the nested 'data' field
            String dataString = (String) mainApiResponse.get("data");
            Map<String, Object> dataMap = mapper.readValue(dataString, Map.class);
            System.out.println("Parsed dataMap: " + dataMap); // Add logging for verification
    
            if (response.getStatusCode().is2xxSuccessful() && 
                mainApiResponse.get("statusCode") != null && 
                mainApiResponse.get("statusCode").equals(200) && 
                dataMap.get("status") != null && 
                dataMap.get("status").equals("success")) {
                proxyResponse.put("statusCode", dataMap.get("status_code"));
                proxyResponse.put("status", dataMap.get("status"));
                proxyResponse.put("data", dataString);
            } else {
                proxyResponse.put("statusCode", 400);
                proxyResponse.put("status", "error");
                proxyResponse.put("message", "Invalid OTP or request ID: " + response.getBody());
            }
    
            return mapper.writeValueAsString(proxyResponse);
        } catch (Exception e) {
            System.out.println("Proxy error (verify): " + e.getMessage());
            try {
                Map<String, Object> errorResponse = new HashMap<>();
                errorResponse.put("statusCode", 500);
                errorResponse.put("status", "error");
                errorResponse.put("message", "Error verifying Aadhaar: " + e.getMessage());
                return mapper.writeValueAsString(errorResponse);
            } catch (Exception jsonException) {
                return "{\"statusCode\":500,\"status\":\"error\",\"message\":\"Failed to serialize error response\"}";
            }
        }
    }

    public String verifyPan(String pan) {
        ObjectMapper mapper = new ObjectMapper();
        try {
            String url = "http://localhost:8090/verification/panVerify";
            RestTemplate restTemplate = new RestTemplate();
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);
            Map<String, String> requestBody = new HashMap<>();
            requestBody.put("pan", pan);
            HttpEntity<Map<String, String>> requestEntity = new HttpEntity<>(requestBody, headers);
            ResponseEntity<String> response = restTemplate.postForEntity(url, requestEntity, String.class);
            System.out.println("Main API response (PAN): " + response.getBody());
    
            Map<String, Object> mainApiResponse;
            try {
                mainApiResponse = mapper.readValue(response.getBody(), Map.class);
            } catch (Exception parseException) {
                System.out.println("Failed to parse main API response: " + response.getBody());
                throw new Exception("Invalid response format from main API: " + response.getBody());
            }
    
            Map<String, Object> proxyResponse = new HashMap<>();
    
            Object statusCodeObj = mainApiResponse.get("statusCode");
            boolean isStatusCodeValid = (statusCodeObj instanceof Integer && (Integer) statusCodeObj == 200) ||
                                       (statusCodeObj instanceof String && "200".equals(statusCodeObj));
    
            // Only check statusCode and msg
            if (isStatusCodeValid && 
                mainApiResponse.get("msg") != null && 
                "success".equals(mainApiResponse.get("msg"))) {
                proxyResponse.put("statusCode", mainApiResponse.get("statusCode"));
                proxyResponse.put("msg", mainApiResponse.get("msg"));
                proxyResponse.put("data", mainApiResponse.get("data"));
            } else {
                proxyResponse.put("statusCode", 400);
                proxyResponse.put("msg", "error");
                proxyResponse.put("message", "Invalid PAN or response: " + response.getBody());
            }
    
            String finalResponse = mapper.writeValueAsString(proxyResponse);
            System.out.println("Proxy API response to frontend: " + finalResponse);
            return finalResponse;
        } catch (Exception e) {
            System.out.println("Proxy error (PAN): " + e.getMessage());
            try {
                Map<String, Object> errorResponse = new HashMap<>();
                errorResponse.put("statusCode", 500);
                errorResponse.put("msg", "error");
                errorResponse.put("message", "Error verifying PAN: " + e.getMessage());
                return mapper.writeValueAsString(errorResponse);
            } catch (Exception jsonException) {
                return "{\"statusCode\":500,\"msg\":\"error\",\"message\":\"Failed to serialize error response\"}";
            }
        }
    }
}