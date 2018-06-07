package pl.rabowski.app.converters;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;

import pl.rabowski.app.entities.User;
import pl.rabowski.app.repositories.UserRepository;


public class UserConverter implements Converter <String, User>{
	
	@Autowired
	private UserRepository userRepository;
	
	@Override
	public User convert(String userId) {
		return userRepository.findOne(Long.parseLong(userId));
	}
	
}
