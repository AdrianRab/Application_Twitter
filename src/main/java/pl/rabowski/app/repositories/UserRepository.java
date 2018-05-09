package pl.rabowski.app.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import pl.rabowski.app.entities.User;



public interface UserRepository extends JpaRepository<User, Long>{
	List<User> findByEmailIgnoreCase(String email);
}
