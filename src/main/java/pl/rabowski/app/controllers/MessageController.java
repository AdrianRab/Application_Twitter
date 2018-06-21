package pl.rabowski.app.controllers;

import java.util.ArrayList;
import java.util.List;
import java.util.ListIterator;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import pl.rabowski.app.entities.Message;
import pl.rabowski.app.entities.User;
import pl.rabowski.app.repositories.MessageRepository;
import pl.rabowski.app.repositories.UserRepository;

@Controller
@RequestMapping("/user")
public class MessageController {

	@Autowired
	UserRepository userRepository;

	@Autowired
	MessageRepository messageRepository;
	
	@GetMapping("/messages")
	public ModelAndView userMessages(@AuthenticationPrincipal UserDetails currentUser) {
		ModelAndView mav = new ModelAndView();
		User user = userRepository.findByEmailIgnoreCase(currentUser.getUsername());
		List<Message>receivedMessages = messageRepository.findReceivedMessagesByUserId(user.getId());
		List<Message>sentMessages = messageRepository.findSendMessagesByUserId(user.getId());
		mav.addObject("user", user);
		mav.addObject("receivedMessages", receivedMessages );
		mav.addObject("sentMessages", sentMessages);
		mav.setViewName("/messages");
		return mav;
	}
	
	@GetMapping("/delete-message/{id}")
	public ModelAndView deleteMessage(@AuthenticationPrincipal UserDetails currentUser, @PathVariable long id) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("user", userRepository.findByEmailIgnoreCase(currentUser.getUsername()));
		messageRepository.delete(id);
		mav.setViewName("redirect:http://localhost:8080/Application_Twitter/user/messages");
		return mav;
	}
	
	@GetMapping("/send-message")
	public ModelAndView sendMessageForm(@AuthenticationPrincipal UserDetails currentUser) {
		ModelAndView mav = new ModelAndView();
		User user = userRepository.findByEmailIgnoreCase(currentUser.getUsername());
		mav.addObject("user", user);
		mav.addObject("message", new Message());
		mav.setViewName("form/sendMessage");
		return mav;
	}
	
	@PostMapping("/send-message")
	public ModelAndView sendMessage(@AuthenticationPrincipal UserDetails currentUser, @Valid Message message, BindingResult result) {
		ModelAndView mav = new ModelAndView();
		if (!result.hasErrors()) {	
			mav.addObject("user", userRepository.findByEmailIgnoreCase(currentUser.getUsername()));
			messageRepository.saveAndFlush(message);
			mav.addObject("message", message);
			mav.setViewName("redirect:http://localhost:8080/Application_Twitter/user/messages");
			return mav;
		} else {
			mav.setViewName("form/registerForm");
			return mav;
		}
	}
	
	@ModelAttribute("allUsers")
	public List<User> getAllTweets(@AuthenticationPrincipal UserDetails currentUser) {
		List<User> users = userRepository.findAll();
		User user = userRepository.findByEmailIgnoreCase(currentUser.getUsername());
		ListIterator<User> iter = users.listIterator();
		List<User> usersWithoutLoogedUser = new ArrayList<>();
		while(iter.hasNext()) {
			if(!user.equals(iter.next())) {
				usersWithoutLoogedUser.add(iter.next());
			}
		}
		return usersWithoutLoogedUser;
	}
}
