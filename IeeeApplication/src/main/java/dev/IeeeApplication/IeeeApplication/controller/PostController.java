package dev.IeeeApplication.IeeeApplication.controller;

import dev.IeeeApplication.IeeeApplication.Entity.PostEntity;
import dev.IeeeApplication.IeeeApplication.repository.PostRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/Post")
public class PostController {
    @Autowired
    private PostRepository postRepository;

    @PostMapping
    public ResponseEntity<PostEntity> postMethod(@RequestBody PostEntity postEntity) {
        try {
            PostEntity savedPost = postRepository.save(postEntity);
            return ResponseEntity.ok(savedPost);
        } catch (Exception exception) {
            // Log the exception or handle it appropriately
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }


}
