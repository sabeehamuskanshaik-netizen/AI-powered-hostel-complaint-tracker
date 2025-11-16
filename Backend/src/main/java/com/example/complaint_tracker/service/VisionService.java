package com.example.complaint_tracker.service;

import com.google.cloud.vision.v1.*;
import com.google.protobuf.ByteString;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Service
public class VisionService {

    public String detectLabel(MultipartFile file) throws IOException {
        ByteString imgBytes = ByteString.readFrom(file.getInputStream());

        try (ImageAnnotatorClient vision = ImageAnnotatorClient.create()) {
            Image image = Image.newBuilder().setContent(imgBytes).build();
            
            // Configure features for better detection
            Feature labelFeature = Feature.newBuilder()
                .setType(Feature.Type.LABEL_DETECTION)
                .setMaxResults(10) // Get top 10 labels for better accuracy
                .build();
                
            Feature objectFeature = Feature.newBuilder()
                .setType(Feature.Type.OBJECT_LOCALIZATION)
                .setMaxResults(5)
                .build();

            AnnotateImageRequest request = AnnotateImageRequest.newBuilder()
                    .addFeatures(labelFeature)
                    .addFeatures(objectFeature)
                    .setImage(image)
                    .build();
                    
            BatchAnnotateImagesResponse response = vision.batchAnnotateImages(List.of(request));
            
            if (response.getResponsesCount() == 0 || response.getResponses(0).hasError()) {
                return "Unknown";
            }

            AnnotateImageResponse imageResponse = response.getResponses(0);
            
            // Combine labels from both label detection and object localization
            List<String> allLabels = new ArrayList<>();
            
            // Get labels from label detection
            for (EntityAnnotation label : imageResponse.getLabelAnnotationsList()) {
                if (label.getScore() > 0.7) { // Only consider confident labels
                    allLabels.add(label.getDescription());
                }
            }
            
            // Get labels from object localization
            for (LocalizedObjectAnnotation object : imageResponse.getLocalizedObjectAnnotationsList()) {
                if (object.getScore() > 0.7) {
                    allLabels.add(object.getName());
                }
            }
            
            return allLabels.isEmpty() ? "Unknown" : String.join(", ", allLabels);
        }
    }
}

