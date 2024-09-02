package dev.IeeeApplication.IeeeApplication.service;

import dev.IeeeApplication.IeeeApplication.model.User;
import dev.IeeeApplication.IeeeApplication.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Optional;
@Service

public class UserService {
    @Autowired
    private UserRepository userRepository;
    private final BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
    public Optional<User>authenticateUser(String email, String password){
        Optional<User> user = userRepository.findByEmail(email);
        if (user.isPresent() && passwordEncoder.matches(password, user.get().getPassword())){
            return user;
        } else {
            return Optional.empty();
        }
    }
    public Optional<User> getUserById(Long id) {
        return userRepository.findById(id);
    }

}
