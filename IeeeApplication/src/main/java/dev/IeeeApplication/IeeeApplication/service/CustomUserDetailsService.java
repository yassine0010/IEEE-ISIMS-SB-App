package dev.IeeeApplication.IeeeApplication.service;

import dev.IeeeApplication.IeeeApplication.Entity.UserAuthEntity;
import dev.IeeeApplication.IeeeApplication.repository.AuthedUserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class CustomUserDetailsService implements UserDetailsService {
    @Autowired
    private AuthedUserRepository authedUserRepository;

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Override
    public UserDetails loadUserByUsername(String IEEE_Email) throws UsernameNotFoundException {
        UserAuthEntity user = authedUserRepository.findByIeeeEmail(IEEE_Email);
        if (user == null) {
            throw new UsernameNotFoundException("User not found with email: " + IEEE_Email);
        }
        GrantedAuthority authority = new SimpleGrantedAuthority("ROLE_" + user.getRole().toUpperCase());

        return User.withUsername(user.getIeeeEmail())
                .password(user.getIeeePassword())
                .authorities(authority)
                .build();
    }

}
