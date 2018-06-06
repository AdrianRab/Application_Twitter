package pl.rabowski.app.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import pl.rabowski.app.entities.UserRole;

public interface UserRoleRepository  extends JpaRepository<UserRole, Long>{
}
