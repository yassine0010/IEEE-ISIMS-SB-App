package dev.IeeeApplication.IeeeApplication.repository;

import dev.IeeeApplication.IeeeApplication.Entity.PostEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PostRepository extends JpaRepository<PostEntity, Long> {
}
