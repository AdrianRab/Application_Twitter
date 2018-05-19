package pl.rabowski.app.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import pl.rabowski.app.entities.Message;

public interface MessageRepository extends JpaRepository<Message, Long>{

}
