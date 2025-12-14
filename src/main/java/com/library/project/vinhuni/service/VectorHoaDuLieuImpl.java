package com.library.project.vinhuni.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import tools.jackson.databind.JsonNode;

@Service
public class VectorHoaDuLieuImpl implements VectorHoaDuLieuService {
    @Autowired
    private RestTemplate restTemplate;

    @Value("${COHERE_API_KEY}")
    private String COHERE_API_KEY;

    class BodyRequest {
        String model = "embed-v4.0";
        List<String> texts;
        String input_type = "search_query";

        public String getModel() {
            return model;
        }

        public List<String> getTexts() {
            return texts;
        }

        public void setTexts(List<String> texts) {
            this.texts = texts;
        }

        public String getInput_type() {
            return input_type;
        }
    }

    @Override
    public List<Double> vectorHoaDuLieu(String duLieu) {
        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", "bearer " + COHERE_API_KEY);
        headers.set("Content-Type", "application/json");
        BodyRequest bodyRequest = new BodyRequest();
        bodyRequest.setTexts(List.of(duLieu));
        HttpEntity<BodyRequest> request = new HttpEntity<>(bodyRequest, headers);
        try {
            JsonNode response = restTemplate.postForObject("https://api.cohere.com/v2/embed", request, JsonNode.class);
            if (response.has("embeddings")) {
                List<Double> vector = new ArrayList<>();
                for (JsonNode node : response.get("embeddings").get("float").get(0))
                    vector.add(node.asDouble());
                return vector;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
