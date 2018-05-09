package pl.rabowski.app.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import pl.rabowski.app.entities.User;
import pl.rabowski.app.repositories.UserRepository;



@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	UserRepository userRepository;
	
	@GetMapping("/add-user")
	public ModelAndView addUserForm() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("user", new User());
		mav.setViewName("form/userForm");
		return mav;
	}

	@PostMapping("/add-user")
	public ModelAndView addUser(@Valid User user, BindingResult result) {
		ModelAndView mav = new ModelAndView();
		if (!result.hasErrors()) {
			user.setEnabled(true);
			userRepository.save(user);
			mav.setViewName("redirect:http://localhost:8080/Application_Twitter/home");
			return mav;
		} else {
			mav.setViewName("form/userForm");
			return mav;
		}
	}
}
