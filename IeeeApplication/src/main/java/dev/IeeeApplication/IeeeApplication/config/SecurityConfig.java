package dev.IeeeApplication.IeeeApplication.config;

import dev.IeeeApplication.IeeeApplication.service.CustomUserDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;

import static org.springframework.security.config.Customizer.withDefaults;

@Configuration
@EnableWebSecurity
public class SecurityConfig {
    @Autowired
    CustomUserDetailsService customUserDetailsService;

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
                .csrf(csrf -> csrf.disable())
                .authorizeHttpRequests(authorizeRequests ->
                        authorizeRequests
                                .requestMatchers("/Post/Posting", "/Update/{requestedId}", "/Delete/{requestedId}").hasRole("ADMIN")
                                .requestMatchers("/Post/ReadAll", "/User/Read").hasAnyRole("USER", "ADMIN")
                                .anyRequest().authenticated()
                )
                .httpBasic(withDefaults())
                .userDetailsService(customUserDetailsService);
        return http.build();
    }
}
