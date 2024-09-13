/*package dev.IeeeApplication.IeeeApplication.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;

@Component
public class PasswordHashingRunner { h

    @Autowired
    private PasswordHasingService passwordHasingService;

    @Bean
    public ApplicationRunner hashPasswords() {
        return args -> {
            passwordHasingService.hashAllPasswords();
        };
    }
}
*/