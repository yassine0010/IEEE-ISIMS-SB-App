package dev.IeeeApplication.IeeeApplication.controller;

import dev.IeeeApplication.IeeeApplication.Entity.PostEntity;
import dev.IeeeApplication.IeeeApplication.repository.PostRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

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

    @GetMapping("/ReadAll")
    public ResponseEntity<List<PostEntity>> readAllMethod() {
        List<PostEntity> posts = postRepository.findAll();
        return ResponseEntity.ok(posts);
    }
    /*@PutMapping("/update/{id}")
    private ResponseEntity updateMethod(@RequestBody PostEntity postEntity @PathVariable long id) {

    }*/


}
