package pl.rabowski.app.converters;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;

import pl.rabowski.app.entities.Tweet;
import pl.rabowski.app.repositories.TweetRepository;

public class TweetConverter implements Converter <String, Tweet>{
	
	@Autowired
	private TweetRepository tweetRepository;
	
	@Override
	public Tweet convert(String id) {
		return tweetRepository.findOne(Long.parseLong(id));
	}

}
