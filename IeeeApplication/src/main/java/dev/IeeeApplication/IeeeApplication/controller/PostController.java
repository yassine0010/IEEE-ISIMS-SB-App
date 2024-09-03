package dev.IeeeApplication.IeeeApplication.controller;

import dev.IeeeApplication.IeeeApplication.Entity.PostEntity;
import dev.IeeeApplication.IeeeApplication.repository.PostRepository;
import org.springframework.beans.factory.annotation.Autowired;
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

    @PostMapping("/Posting")
    public ResponseEntity<PostEntity> postMethod(@RequestBody PostEntity postEntity) {
        PostEntity savedPost = postRepository.save(postEntity);
        return ResponseEntity.ok(savedPost);

    }


}
