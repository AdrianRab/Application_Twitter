package pl.rabowski.app.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import pl.rabowski.app.entities.Comment;
import pl.rabowski.app.entities.Tweet;

public interface CommentRepository extends JpaRepository<Comment, Long>{
	
	@Query("select c from Comment c where c.post = :post order by c.created desc")
	List<Comment> finddByPostOrderByCreatedDesc(@Param("post") Tweet post);
	
	@Query("select c from Comment c where c.post.id = :postId order by c.created desc")
	List<Comment> finddByPostIdOrderByCreatedDesc(@Param("postId") int postId);
	
}
