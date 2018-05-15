package pl.rabowski.app.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import pl.rabowski.app.entities.Tweet;
import pl.rabowski.app.entities.User;
import pl.rabowski.app.repositories.TweetRepository;
import pl.rabowski.app.repositories.UserRepository;



@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	UserRepository userRepository;
	
	@Autowired
	private TweetRepository tweetRepository;
	
	@GetMapping("/register-user")
	public ModelAndView addUserForm() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("user", new User());
		mav.setViewName("form/registerForm");
		return mav;
	}

	@PostMapping("/register-user")
	public ModelAndView addUser(@Valid User user, BindingResult result) {
		ModelAndView mav = new ModelAndView();
		if (!result.hasErrors()) {
			user.setEnabled(true);
			userRepository.saveAndFlush(user);
			mav.addObject("user", user);
			mav.setViewName("/confirmation");
			return mav;
		} else {
			mav.setViewName("form/registerForm");
			return mav;
		}
	}
	
	@GetMapping("/edit-user/{id}")
	public ModelAndView editUserForm(@PathVariable long id) {
		ModelAndView mav = new ModelAndView();
		User user = userRepository.findOne(id);
		mav.addObject("user", user);
		mav.setViewName("form/editUser");
		return mav;
	}
	
	
	@PostMapping("/edit-user/{id}")
	public ModelAndView editUser(@Valid User user, BindingResult result) {
		ModelAndView mav = new ModelAndView();
		if (!result.hasErrors()) {
			userRepository.saveAndFlush(user);
			mav.addObject("user", user);
			mav.setViewName("/confirmation");
			return mav;
		} else {
			mav.setViewName("form/editUser");
			return mav;
		}
	}
	
	@GetMapping("/detele-user/{id}")
	public ModelAndView removeUser(@PathVariable long id) {
		ModelAndView mav = new ModelAndView();
		userRepository.delete(id);
		mav.setViewName("redirect:http://localhost:8080/Application_Twitter/home");
		return mav;
	}
	
	@ModelAttribute("userTweets")
	public List<Tweet> getUserTweets() {
		List<Tweet> tweets = tweetRepository.findAll();
		return tweets;
	}
}
