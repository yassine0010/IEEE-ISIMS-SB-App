package dev.IeeeApplication.IeeeApplication.controller;

import dev.IeeeApplication.IeeeApplication.Entity.ContactUsEntity;
import dev.IeeeApplication.IeeeApplication.Entity.UserAuthEntity;
import dev.IeeeApplication.IeeeApplication.repository.AuthedUserRepository;
import dev.IeeeApplication.IeeeApplication.repository.ContactUsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.security.Principal;

@RestController
@RequestMapping("/ContactUs")
public class ContactUsController {

    @Autowired
    private ContactUsRepository contactUsRepository;
    @Autowired
    private AuthedUserRepository authedUserRepository;

    @PostMapping("/Posting")
    public ResponseEntity contactUsMethod(@RequestBody ContactUsEntity contactUsEntity, Principal principal) {
        System.out.println(principal);
        String ieeeEmail = principal.getName();
        UserAuthEntity userAuthEntity = authedUserRepository.findByIeeeEmail(ieeeEmail);
        contactUsEntity.setCOwner(userAuthEntity.getName());

        return ResponseEntity.ok(contactUsRepository.save(contactUsEntity));
    }
}
