package pl.rabowski.app.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import pl.rabowski.app.entities.Message;

public interface MessageRepository extends JpaRepository<Message, Long>{
	@Query(value = "SELECT id, content, isRead, timeSent, title, receiver_user_id, sender_user_id from twitter.users INNER JOIN twitter.messages ON twitter.users.user_id=twitter.messages.sender_user_id WHERE user_id=?1",
			nativeQuery = true)
	List<Message> findSendMessagesByUserId(Long id);
	
	@Query(value = "SELECT id, content, isRead, timeSent, title, receiver_user_id, sender_user_id from twitter.users INNER JOIN twitter.messages ON twitter.users.user_id=twitter.messages.receiver_user_id WHERE user_id=?1",
			nativeQuery = true)
	List<Message> findReceivedMessagesByUserId(Long id);
}
