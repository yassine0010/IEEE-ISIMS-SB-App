package dev.IeeeApplication.IeeeApplication.controller;

import dev.IeeeApplication.IeeeApplication.Entity.PostEntity;
import dev.IeeeApplication.IeeeApplication.Entity.UserAuthEntity;
import dev.IeeeApplication.IeeeApplication.repository.AuthedUserRepository;
import dev.IeeeApplication.IeeeApplication.repository.PostRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/Post")
public class PostController {
    @Autowired
    private PostRepository postRepository;
    @Autowired
    private AuthedUserRepository authedUserRepository;

    @PostMapping("/Posting")
    public ResponseEntity<PostEntity> postMethod(@RequestBody PostEntity postEntity, Principal principal) {
        String ieeeEmail = principal.getName();
        UserAuthEntity userAuthEntity = authedUserRepository.findByIeeeEmail(ieeeEmail);
        postEntity.setPostOwner(userAuthEntity.getName());
        PostEntity savedPost = postRepository.save(postEntity);
        return ResponseEntity.ok(savedPost);

    }

    @GetMapping("/ReadAll")
    public ResponseEntity<List<PostEntity>> readAllMethod() {
        List<PostEntity> posts = postRepository.findAll();
        return ResponseEntity.ok(posts);
    }

    @PutMapping("/Update/{requestedId}")
    public ResponseEntity<PostEntity> updateMethod(@PathVariable Long requestedId, @RequestBody PostEntity postEntity, Principal principal) {
        Optional<PostEntity> OptionalExistingPost = postRepository.findById(requestedId);
        if (OptionalExistingPost.isPresent()) {
            PostEntity ExistingPost = OptionalExistingPost.get();
            String ieeeEmail = principal.getName();
            UserAuthEntity userAuthEntity = authedUserRepository.findByIeeeEmail(ieeeEmail);

            if (ExistingPost.getPostOwner().equals(userAuthEntity.getName())) {
                if (postEntity.getPostContent() != null) {
                    ExistingPost.setPostContent(postEntity.getPostContent());
                }
                if (postEntity.getFormLink() != null) {
                    ExistingPost.setFormLink(postEntity.getFormLink());
                }
                if (postEntity.getImage() != null) {
                    ExistingPost.setImage(postEntity.getImage());
                }
                if (postEntity.getTitle() != null) {
                    ExistingPost.setTitle(postEntity.getTitle());
                }
                postRepository.save(ExistingPost);
                return ResponseEntity.ok(ExistingPost);
            }
        }

        return ResponseEntity.notFound().build();

    }

    @DeleteMapping("/Delete/{requestedId}")
    public ResponseEntity<PostEntity> deleteMethod(@PathVariable Long requestedId, Principal principal) {
        Optional<PostEntity> OptionalExistingPost = postRepository.findById(requestedId);
        if (OptionalExistingPost.isPresent()) {
            PostEntity ExistingPost = OptionalExistingPost.get();
            String ieeeEmail = principal.getName();
            UserAuthEntity userAuthEntity = authedUserRepository.findByIeeeEmail(ieeeEmail);

            if (ExistingPost.getPostOwner().equals(userAuthEntity.getName())) {
                postRepository.delete(ExistingPost);

                return ResponseEntity.ok(ExistingPost);
            }

        }
        return ResponseEntity.notFound().build();

    }
}
