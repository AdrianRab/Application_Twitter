package pl.rabowski.app.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import pl.rabowski.app.entities.Tweet;
import pl.rabowski.app.entities.User;
import pl.rabowski.app.repositories.TweetRepository;
import pl.rabowski.app.repositories.UserRepository;

@Controller
public class HomePageController {

	@Autowired
	UserRepository userRepository;

	@Autowired
	private TweetRepository tweetRepository;

	@GetMapping(value = { "/", "/home", "/twitter" })
	public ModelAndView homePage() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("index");
		return mav;
	}

	@GetMapping("/login")
	public ModelAndView loginPage() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("form/login");
		return mav;
	}

	@PostMapping("/login")
	public ModelAndView loggedUser(@RequestParam String email, @RequestParam String password, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		User user = userRepository.findByEmailIgnoreCase(email);
		if (user != null) {
			if (BCrypt.checkpw(password, user.getPassword())) {
				System.out.println("correct password");
				user.setEnabled(true);
				session.setAttribute("loggedUser", user);
				mav.addObject("user", user);
				mav.setViewName("userProfile");
				return mav;
			} else {
				System.out.println("incorrect password");
				mav.addObject("errorMessage", "Invalid password");
				mav.setViewName("form/login");
				return mav;
			}
		} else {
			System.out.println("user searched by email is null");
			mav.addObject("errorMessage", "Invalid username");
			mav.setViewName("form/login");
			return mav;
		}

	}
	
	@GetMapping("/logout")
	public ModelAndView logout(@SessionAttribute(name = "user", required = false) User user,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		user.setEnabled(false);
		session.removeAttribute("loggedUser");
		session.invalidate();
		mav.setViewName("/home");
		return mav;
	}

//	@PostMapping(value = { "/", "/home", "/twitter" })
//	public ModelAndView addTweet(@SessionAttribute(name = "user", required = false) User user, @Valid Tweet tweet,
//			BindingResult result) {
//		ModelAndView mav = new ModelAndView();
//		if (user == null) {
//			mav.setViewName("redirect:http://localhost:8080/Application_Twitter/login");
//			mav.addObject("errorMessage", "You need to be logged to add tweets.");
//			return mav;
//		}
//			if (!result.hasErrors()) {
//				tweetRepository.saveAndFlush(tweet);
//				mav.addObject("tweet", tweet);
//				mav.setViewName("redirect:http://localhost:8080/Application_Twitter/home");
//				return mav;
//			} else {
//				mav.setViewName("index");
//				return mav;
//			}
//		}


	@ModelAttribute("allTweets")
	public List<Tweet> getAllTweets() {
		List<Tweet> tweets = tweetRepository.findAll();
		return tweets;
	}
}
