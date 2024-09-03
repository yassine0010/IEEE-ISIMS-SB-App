package dev.IeeeApplication.IeeeApplication.controller;


import dev.IeeeApplication.IeeeApplication.model.User;
import dev.IeeeApplication.IeeeApplication.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@RestController
@RequestMapping("/api/auth")


public class AuthController {
    @Autowired
    private UserService userService;

    @PostMapping("/Login")
    public ResponseEntity<String> Login(@RequestBody String email, @RequestBody String password) {
        Optional<User> user = userService.authenticateUser(email, password);
        if (user.isPresent()) {
            return ResponseEntity.ok("Login successful");
        } else {
            return ResponseEntity.status(401).body("Invalid email or password");
        }
    }

    @GetMapping("/visitor")
    public ResponseEntity<String> visitorLogin() {
        return ResponseEntity.ok("Logged in as visitor");
    }

}
