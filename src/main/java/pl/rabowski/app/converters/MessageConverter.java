package pl.rabowski.app.converters;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;

import pl.rabowski.app.entities.Message;
import pl.rabowski.app.repositories.MessageRepository;

public class MessageConverter implements Converter <String, Message> {

	@Autowired
	private MessageRepository messageRepository;
	
	@Override
	public Message convert(String id) {
		return messageRepository.findOne(Long.parseLong(id));
	}

}
