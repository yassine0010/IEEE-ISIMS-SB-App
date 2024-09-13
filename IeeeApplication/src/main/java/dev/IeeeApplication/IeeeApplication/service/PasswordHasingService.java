package dev.IeeeApplication.IeeeApplication.service;

import dev.IeeeApplication.IeeeApplication.Entity.UserAuthEntity;
import dev.IeeeApplication.IeeeApplication.repository.AuthedUserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PasswordHasingService {
    private final PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
    @Autowired
    private AuthedUserRepository authedUserRepository;

    public void hashAllPasswords() {
        List<UserAuthEntity> users = authedUserRepository.findAll();

        for (UserAuthEntity user : users) {
            String plainPassword = user.getIeeePassword();
            String hashedPassword = passwordEncoder.encode(plainPassword);
            user.setIeeePassword(hashedPassword);
            authedUserRepository.save(user);
        }
    }
}
