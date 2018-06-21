package pl.rabowski.app.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import pl.rabowski.app.entities.Tweet;
import pl.rabowski.app.entities.User;
import pl.rabowski.app.repositories.MessageRepository;
import pl.rabowski.app.repositories.TweetRepository;
import pl.rabowski.app.repositories.UserRepository;
import pl.rabowski.app.repositories.UserRoleRepository;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	UserRepository userRepository;
	
	@Autowired
	UserRoleRepository userRoleRepository;

	@Autowired
	MessageRepository messageRepository;
	
	@Autowired
	private TweetRepository tweetRepository;
	

	@GetMapping("/edit-user")
	public ModelAndView editUserForm(@AuthenticationPrincipal UserDetails currentUser) {
		ModelAndView mav = new ModelAndView();
		User user = userRepository.findByEmailIgnoreCase(currentUser.getUsername());
		mav.addObject("user", user);
		mav.setViewName("form/editUser");
		return mav;
	}

	@PostMapping("/edit-user")
	public ModelAndView editUser(@Valid User user, BindingResult result) {
		ModelAndView mav = new ModelAndView();
		if (!result.hasErrors()) {
			userRepository.saveAndFlush(user);
			mav.addObject("user", user);
			mav.setViewName("/userProfile");
			return mav;
		} else {
			mav.setViewName("form/editUser");
			return mav;
		}
	}

	@GetMapping("/delete-user/{id}")
	public ModelAndView removeUser(@PathVariable long id) {
		ModelAndView mav = new ModelAndView();
		userRepository.delete(id);
		mav.setViewName("redirect:http://localhost:8080/Application_Twitter/home");
		return mav;
	}
	
	@GetMapping("/my-page")
	public ModelAndView userProfile(@AuthenticationPrincipal UserDetails currentUser) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("user", userRepository.findByEmailIgnoreCase(currentUser.getUsername()));
		mav.setViewName("/userProfile");
		return mav;
	}
	
	@GetMapping("/my-tweets")
	public ModelAndView myTweets(@AuthenticationPrincipal UserDetails currentUser) {
		ModelAndView mav = new ModelAndView();
		User user = userRepository.findByEmailIgnoreCase(currentUser.getUsername());
		List<Tweet> myTweets = tweetRepository.findByUser(user);
		mav.addObject("user", user);
		mav.addObject("myTweets", myTweets);
		mav.setViewName("/myTweets");
		return mav;
	}
	
}
