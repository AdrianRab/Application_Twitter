package pl.rabowski.app.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import pl.rabowski.app.entities.Tweet;
import pl.rabowski.app.entities.User;

public interface TweetRepository extends JpaRepository<Tweet, Long>{
	List<Tweet> findByUser(User user);
	List<Tweet> findByUserId(long userId);
	@Query("select t from Tweet t order by t.created desc")
	List<Tweet> findAllByOrderByCreatedDesc();
}
