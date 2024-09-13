package dev.IeeeApplication.IeeeApplication.repository;

import dev.IeeeApplication.IeeeApplication.Entity.UserAuthEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AuthedUserRepository extends JpaRepository<UserAuthEntity, Long> {
    UserAuthEntity findByIeeeEmail(String ieeeEmail);
}
