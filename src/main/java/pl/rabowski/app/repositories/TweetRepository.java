package pl.rabowski.app.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import pl.rabowski.app.entities.Tweet;
import pl.rabowski.app.entities.User;

public interface TweetRepository extends JpaRepository<Tweet, Long>{
	List<Tweet> findByUserIgnoreCase(User user);
	List<Tweet> findByUserId(long userId);
	
}
