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
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import pl.rabowski.app.entities.Comment;
import pl.rabowski.app.entities.Tweet;
import pl.rabowski.app.entities.User;
import pl.rabowski.app.repositories.CommentRepository;
import pl.rabowski.app.repositories.TweetRepository;
import pl.rabowski.app.repositories.UserRepository;

@Controller
@RequestMapping("/tweet")
public class TweetController {

	@Autowired
	private TweetRepository tweetRepository;
	
	@Autowired
	private CommentRepository commentRepository;
	
	@Autowired
	UserRepository userRepository;

	@GetMapping("/add")
	public ModelAndView addTweetForm(@AuthenticationPrincipal UserDetails currentUser) {
		ModelAndView mav = new ModelAndView();
		User user = userRepository.findByEmailIgnoreCase(currentUser.getUsername());
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
	public ModelAndView addTweet(@AuthenticationPrincipal UserDetails currentUser, @Valid Tweet tweet,
			BindingResult result) {
		ModelAndView mav = new ModelAndView();
		User user = userRepository.findByEmailIgnoreCase(currentUser.getUsername());
		if (!result.hasErrors()) {
			tweetRepository.saveAndFlush(tweet);
			mav.addObject("tweet", tweet);
			mav.addObject("user", user);
			mav.setViewName("redirect:http://localhost:8080/Application_Twitter/user/my-profile");
			return mav;
		} else {
			mav.setViewName("form/tweetForm");
			return mav;
		}
	}

	@GetMapping("/edit/{id}")
	public ModelAndView editTweetForm(@PathVariable long id,
			@AuthenticationPrincipal UserDetails currentUser) {
		ModelAndView mav = new ModelAndView();
		User user = userRepository.findByEmailIgnoreCase(currentUser.getUsername());
		Tweet tweet = tweetRepository.findOne(id);
		mav.addObject("user", user);
		mav.addObject("user", tweet);
		mav.setViewName("form/tweetForm");
		return mav;
	}

	@PostMapping("/edit/{id}")
	public ModelAndView editTweet(@AuthenticationPrincipal UserDetails currentUser, @Valid Tweet tweet,
			BindingResult result) {
		ModelAndView mav = new ModelAndView();
		User user = userRepository.findByEmailIgnoreCase(currentUser.getUsername());
		mav.addObject("user", user);
		if (!result.hasErrors()) {
			tweetRepository.saveAndFlush(tweet);
			mav.setViewName("redirect:http://localhost:8080/Application_Twitter/user/my-profile");
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
		mav.setViewName("redirect:http://localhost:8080/Application_Twitter/user/my-profile");
		return mav;
	}
	
	@GetMapping("/details/{id}")
	public ModelAndView getDetails(@AuthenticationPrincipal UserDetails currentUser, @PathVariable long id) {
		ModelAndView mav = new ModelAndView();
		User user = userRepository.findByEmailIgnoreCase(currentUser.getUsername());
		mav.addObject("user", user);
		Tweet tweet = tweetRepository.findOne(id);
		List<Comment> comments = commentRepository.finddByPostOrderByCreatedDesc(tweet);
		mav.addObject("comments", comments);
		mav.addObject("tweet", tweet);
		mav.setViewName("/tweetDetails");
		return mav;
	}
	
	//formularz do komentarzy dodac nie w osobnej stronie, ale na stronie ze szczegółami tweetu.
	
	@GetMapping("/add-comment/{id}")
	public ModelAndView addComment(@AuthenticationPrincipal UserDetails currentUser, @PathVariable long id) {
		ModelAndView mav = new ModelAndView();
		Tweet tweet = tweetRepository.findOne(id);
		User user = userRepository.findByEmailIgnoreCase(currentUser.getUsername());
		if(user == null) {
			mav.setViewName("redirect:http://localhost:8080/Application_Twitter/login");
			mav.addObject("errorMessage", "You need to be logged to add comments.");
			return mav;
		}
			mav.addObject("user", user);
			mav.addObject("tweet", tweet);
			Comment comment = new Comment();
			comment.setUser(user);
			comment.setPost(tweet);
			mav.addObject("comment", comment);
			mav.setViewName("form/commentForm");
		return mav;
	}
	
	@PostMapping("/add-comment/{id}")
	public ModelAndView saveComment(@Valid Comment comment,BindingResult result) {
		ModelAndView mav = new ModelAndView();
		if (!result.hasErrors()) {
			commentRepository.saveAndFlush(comment);
			mav.addObject("tweet", comment);
			mav.setViewName("redirect:http://localhost:8080/Application_Twitter/home");
			return mav;
		} else {
			mav.setViewName("form/tweetForm");
			return mav;
		}
		
	}
	
	@GetMapping("/delete-comment/{id}")
	public ModelAndView deleteComment(@PathVariable long id) {
		ModelAndView mav = new ModelAndView();
			commentRepository.delete(id);
			mav.setViewName("redirect:http://localhost:8080/Application_Twitter/user/my-profile");
		return mav;
	}
	
}
