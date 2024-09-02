package dev.IeeeApplication.IeeeApplication.controller;



import dev.IeeeApplication.IeeeApplication.model.User;
import dev.IeeeApplication.IeeeApplication.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Optional;

@RestController
@RequestMapping("/api/profile")
public class ProfileController {

    @Autowired
    private UserService userService;

    @GetMapping
    public ResponseEntity<User> getProfile(@RequestParam Long userId) {
        Optional<User> user = userService.getUserById(userId);
        if (user.isPresent()) {
            return ResponseEntity.ok(user.get());
        } else {
            return ResponseEntity.status(404).body(null);
        }
    }

    @GetMapping("/sign-out")
    public ResponseEntity<String> signOut() {
        // Logic for signing out the user, e.g., invalidating the session or token
        return ResponseEntity.ok("Signed out successfully");
    }
}
