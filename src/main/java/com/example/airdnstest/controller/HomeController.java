package com.example.airdnstest.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HomeController {

    @GetMapping("/")
    public String goHome(){
        return "CI/CD";
    }

    @GetMapping("/api/v1")
    public String test(){
        return "test page";
    }
}
