package com.example.complaint_tracker.controller;

import com.example.complaint_tracker.service.VisionService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api/complaints")
@CrossOrigin(origins = "*") // Allow Flutter app to connect
public class ComplaintController {

    private final VisionService visionService;

    public ComplaintController(VisionService visionService) {
        this.visionService = visionService;
    }

    @PostMapping("/upload")
    public ResponseEntity<Map<String, String>> uploadImage(@RequestParam("image") MultipartFile image) throws IOException {
        try {
            // Validate image
            if (image.isEmpty()) {
                return ResponseEntity.badRequest().body(Map.of("error", "No image provided"));
            }

            // Get label from Vision API
            String label = visionService.detectLabel(image);
            
            // Map label to category
            String complaintType = mapLabelToCategory(label);
            
            Map<String, String> response = new HashMap<>();
            response.put("detectedLabel", label);
            response.put("complaintType", complaintType);
            response.put("message", "Image analyzed successfully");
            
            return ResponseEntity.ok(response);
            
        } catch (Exception e) {
            return ResponseEntity.internalServerError()
                .body(Map.of("error", "Failed to process image: " + e.getMessage()));
        }
    }

    private String mapLabelToCategory(String label) {
        String lowerLabel = label.toLowerCase();
        
        // Electrical Issues
        if (lowerLabel.contains("switch") || lowerLabel.contains("socket") || 
            lowerLabel.contains("outlet") || lowerLabel.contains("electrical")) {
            return "Electrical";
        }
        
        // Plumbing Issues
        if (lowerLabel.contains("pipe") || lowerLabel.contains("faucet") || 
            lowerLabel.contains("tap") || lowerLabel.contains("water") || 
            lowerLabel.contains("leak")) {
            return "Plumbing";
        }
        
        // AC Issues
        if (lowerLabel.contains("air conditioner") || lowerLabel.contains("ac") || 
            lowerLabel.contains("ventilation")) {
            return "AC";
        }
        
        // Furniture/Carpentry
        if (lowerLabel.contains("chair") || lowerLabel.contains("table") || 
            lowerLabel.contains("desk") || lowerLabel.contains("furniture") ||
            lowerLabel.contains("wood")) {
            return "Carpentary";
        }
        
        // Civil Works
        if (lowerLabel.contains("wall") || lowerLabel.contains("ceiling") || 
            lowerLabel.contains("floor") || lowerLabel.contains("crack") ||
            lowerLabel.contains("paint")) {
            return "Civil works";
        }
        
        // Geyser
        if (lowerLabel.contains("geyser") || lowerLabel.contains("water heater")) {
            return "Geyser";
        }
        
        // Lift
        if (lowerLabel.contains("elevator") || lowerLabel.contains("lift")) {
            return "Lift";
        }
        
        return "General Complaint";
    }
}
