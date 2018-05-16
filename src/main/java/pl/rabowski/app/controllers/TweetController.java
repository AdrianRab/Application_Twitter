package pl.rabowski.app.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import pl.rabowski.app.entities.Tweet;
import pl.rabowski.app.entities.User;
import pl.rabowski.app.repositories.TweetRepository;

@Controller
@RequestMapping("/tweet")
public class TweetController {

	@Autowired
	private TweetRepository tweetRepository;

	@GetMapping("/add")
	public ModelAndView addTweetForm(@SessionAttribute(name = "user", required = false) User user) {
		ModelAndView mav = new ModelAndView();
		if(user == null) {
			mav.setViewName("redirect:http://localhost:8080/Application_Twitter/login");
			mav.addObject("errorMessage", "You need to be logged to add tweets.");
			return mav;
		}
			mav.addObject("user", user);
			mav.addObject("tweet", new Tweet());
			mav.setViewName("form/tweetForm");
		return mav;
	}

	@PostMapping("/add")
	public ModelAndView addTweet(@SessionAttribute(name = "user", required = false) User user, @Valid Tweet tweet,
			BindingResult result) {
		ModelAndView mav = new ModelAndView();
		if (!result.hasErrors()) {
			tweetRepository.saveAndFlush(tweet);
			mav.addObject("tweet", tweet);
			mav.setViewName("redirect:http://localhost:8080/Application_Twitter/user/my-profile/" + user.getId());
			return mav;
		} else {
			mav.setViewName("form/tweetForm");
			return mav;
		}
	}

	@GetMapping("/edit/{id}")
	public ModelAndView editTweetForm(@PathVariable long id,
			@SessionAttribute(name = "user", required = false) User user) {
		ModelAndView mav = new ModelAndView();
		Tweet tweet = tweetRepository.findOne(id);
		mav.addObject("user", user);
		mav.addObject("user", tweet);
		mav.setViewName("form/tweetForm");
		return mav;
	}

	@PostMapping("/edit/{id}")
	public ModelAndView editTweet(@SessionAttribute(name = "user", required = false) User user, @Valid Tweet tweet,
			BindingResult result) {
		ModelAndView mav = new ModelAndView();
		if (!result.hasErrors()) {
			tweetRepository.saveAndFlush(tweet);
			mav.setViewName("redirect:http://localhost:8080/Application_Twitter/user/my-profile/" + user.getId());
			return mav;
		} else {
			mav.setViewName("form/tweetForm");
			return mav;
		}
	}

	@GetMapping("/detele/{id}")
	public ModelAndView removeTweet(@SessionAttribute(name = "user", required = false) User user,
			@PathVariable long id) {
		ModelAndView mav = new ModelAndView();
		tweetRepository.delete(id);
		mav.setViewName("redirect:http://localhost:8080/Application_Twitter/user/my-profile/" + user.getId());
		return mav;
	}
	
	@GetMapping("/details/{id}")
	public ModelAndView getDetails(@SessionAttribute(name = "user", required = false) User user, @PathVariable long id) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("user", user);
		mav.addObject("tweet", tweetRepository.findOne(id));
		mav.setViewName("/tweetDetails");
		return mav;
	}

}
