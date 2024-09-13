package dev.IeeeApplication.IeeeApplication;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;

@SpringBootApplication
@EnableWebSecurity
public class IeeeApplication {

    public static void main(String[] args) {
        SpringApplication.run(IeeeApplication.class, args);
    }

}
