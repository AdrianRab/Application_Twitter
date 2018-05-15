package pl.rabowski.app.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import pl.rabowski.app.entities.Tweet;
import pl.rabowski.app.repositories.TweetRepository;

@Controller
@RequestMapping("/tweet")
public class TweetController {
	
	@Autowired
	private TweetRepository tweetRepository;
	
	@GetMapping("/add")
	public ModelAndView addTweetForm() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("tweet", new Tweet());
		mav.setViewName("form/tweetForm");
		return mav;
	}

	@PostMapping("/add")
	public ModelAndView addTweet(@Valid Tweet tweet, BindingResult result) {
		ModelAndView mav = new ModelAndView();
		if (!result.hasErrors()) {
			tweetRepository.saveAndFlush(tweet);
			mav.addObject("tweet", tweet);
			mav.setViewName("/confirmation");
			return mav;
		} else {
			mav.setViewName("form/tweetForm");
			return mav;
		}
	}
	
	@GetMapping("/edit/{id}")
	public ModelAndView editTweetForm(@PathVariable long id) {
		ModelAndView mav = new ModelAndView();
		Tweet tweet = tweetRepository.findOne(id);
		mav.addObject("user", tweet);
		mav.setViewName("form/tweetForm");
		return mav;
	}
	
	
	@PostMapping("/edit/{id}")
	public ModelAndView editTweet(@Valid Tweet tweet, BindingResult result) {
		ModelAndView mav = new ModelAndView();
		if (!result.hasErrors()) {
			tweetRepository.saveAndFlush(tweet);
			mav.setViewName("redirect:http://localhost:8080/Application_Twitter/confirmation"); //dodac przekazanie w sciezce id usera tweetu
			return mav;
		} else {
			mav.setViewName("form/tweetForm");
			return mav;
		}
	}
	
	@GetMapping("/detele/{id}")
	public ModelAndView removeTweet(@PathVariable long id) {
		ModelAndView mav = new ModelAndView();
		tweetRepository.delete(id);
		mav.setViewName("redirect:http://localhost:8080/Application_Twitter/confirmation"); //dodac przekazanie w sciezce id usera tweetu
		return mav;
	}
	
}
