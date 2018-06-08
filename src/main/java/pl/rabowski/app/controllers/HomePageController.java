package pl.rabowski.app.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pl.rabowski.app.entities.Tweet;
import pl.rabowski.app.entities.User;
import pl.rabowski.app.entities.UserRole;
import pl.rabowski.app.repositories.TweetRepository;
import pl.rabowski.app.repositories.UserRepository;
import pl.rabowski.app.repositories.UserRoleRepository;

@Controller
public class HomePageController {

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private TweetRepository tweetRepository;
	
	@Autowired
	UserRoleRepository userRoleRepository;
	

	@GetMapping(value = { "/", "/home", "/twitter" })
	public ModelAndView homePage(@AuthenticationPrincipal UserDetails currentUser) {
		ModelAndView mav = new ModelAndView();
		if(currentUser!= null) {
			User user = userRepository.findByEmailIgnoreCase(currentUser.getUsername());
			mav.addObject("user", user);
		}
		mav.setViewName("index");
		return mav;
	}

	@GetMapping("/register-user")
	public ModelAndView addUserForm() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("user", new User());
		mav.setViewName("form/registerForm");
		return mav;
	}

	@PostMapping("/register-user")
	public ModelAndView addUser(@RequestParam String password, @RequestParam String passwordConfirmed, @Valid User user,
			BindingResult result) {
		ModelAndView mav = new ModelAndView();
		if (!(password.equals(passwordConfirmed))) {
			mav.addObject("errorMessage", "Provided passwords does not match. Please try again.");
			mav.setViewName("form/registerForm");
			return mav;
		} else if (userRepository.findByEmailIgnoreCase(user.getEmail()) != null) {
			mav.addObject("errorMessage", "Provided e-mail is aleady in use.");
			mav.setViewName("form/registerForm");
			return mav;
		} else if (userRepository.findFirstByUsername(user.getUsername()) != null) {
			mav.addObject("errorMessage", "Username is already in use.");
			mav.setViewName("form/registerForm");
			return mav;
		} else {
			if (!result.hasErrors()) {
				UserRole userRole = new UserRole();
				userRole.setUser(user);
				userRole.setRole("ROLE_USER");
				user.setEnabled(true);
				userRoleRepository.saveAndFlush(userRole);
				userRepository.saveAndFlush(user);
				mav.addObject("user", user);
				mav.setViewName("redirect:http://localhost:8080/Application_Twitter/user/my-page");
				return mav;
			} else {
				mav.setViewName("form/registerForm");
				return mav;
			}
		}
	}

	@GetMapping("/login")
	public ModelAndView loginPage() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("form/login");
		return mav;
	}

	@PostMapping("/login")
	public ModelAndView loggedUser(@RequestParam String email, @RequestParam String password) {
		ModelAndView mav = new ModelAndView();
		User user = userRepository.findByEmailIgnoreCase(email);
		if (user != null) {
			mav.addObject("user", user);
			mav.setViewName("userProfile");
			return mav;
		}
		mav.setViewName("form/login");
		return mav;

	}
	
	@PostMapping("/logout")
	public ModelAndView logoutPage() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("index");
		return mav;
	}

	// @PostMapping(value = { "/", "/home", "/twitter" })
	// public ModelAndView addTweet(@SessionAttribute(name = "user", required =
	// false) User user, @Valid Tweet tweet,
	// BindingResult result) {
	// ModelAndView mav = new ModelAndView();
	// if (user == null) {
	// mav.setViewName("redirect:http://localhost:8080/Application_Twitter/login");
	// mav.addObject("errorMessage", "You need to be logged to add tweets.");
	// return mav;
	// }
	// if (!result.hasErrors()) {
	// tweetRepository.saveAndFlush(tweet);
	// mav.addObject("tweet", tweet);
	// mav.setViewName("redirect:http://localhost:8080/Application_Twitter/home");
	// return mav;
	// } else {
	// mav.setViewName("index");
	// return mav;
	// }
	// }

	@ModelAttribute("allTweets")
	public List<Tweet> getAllTweets() {
		List<Tweet> tweets = tweetRepository.findAllByOrderByCreatedDesc();
		return tweets;
	}
}
