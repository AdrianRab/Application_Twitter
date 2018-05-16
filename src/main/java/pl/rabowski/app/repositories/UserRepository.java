package pl.rabowski.app.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import pl.rabowski.app.entities.User;



public interface UserRepository extends JpaRepository<User, Long>{
	User findByEmailIgnoreCase(String email);
	User findFirstByUsername(String username);
	
}
