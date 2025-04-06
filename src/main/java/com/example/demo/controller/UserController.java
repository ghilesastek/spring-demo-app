package com.example.demo.controller;

import com.example.demo.entity.User;
import com.example.demo.repository.UserRepository;
import jakarta.validation.Valid;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;


import java.util.List;

@RestController
@RequestMapping("/users")
public class UserController {

    private final UserRepository repo;

    public UserController(UserRepository repo) {
        this.repo = repo;
    }

    @GetMapping
    public List<User> all() {
    	
        return repo.findAll();
    }

    @PostMapping
    public ResponseEntity<User> create(@Valid @RequestBody User user) {
    	User saved = repo.save(user);
        return ResponseEntity.status(HttpStatus.CREATED).body(saved);
    }
}
