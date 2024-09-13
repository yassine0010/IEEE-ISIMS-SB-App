package dev.IeeeApplication.IeeeApplication.controller;

import dev.IeeeApplication.IeeeApplication.Entity.UserAuthEntity;
import dev.IeeeApplication.IeeeApplication.repository.AuthedUserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.security.Principal;

@RestController
@RequestMapping("/User")
public class AuthedUserController {
    @Autowired
    AuthedUserRepository authedUserRepository;

    @GetMapping("/Read")
    public ResponseEntity<UserAuthEntity> ReadAuthedUser(Principal principal) {
        UserAuthEntity userAuthEntity = authedUserRepository.findByIeeeEmail(principal.getName());
        if (userAuthEntity == null) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(userAuthEntity);


    }


}
