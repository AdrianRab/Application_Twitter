package pl.rabowski.app.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pl.rabowski.app.entities.User;
import pl.rabowski.app.repositories.UserRepository;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	UserRepository userRepository;



	
	@GetMapping("/register-user")
	public ModelAndView addUserForm() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("user", new User());
		mav.setViewName("form/registerForm");
		return mav;
	}

	@PostMapping("/register-user")
	public ModelAndView addUser(@RequestParam String password, @RequestParam String passwordConfirmed,  @Valid User user, BindingResult result) {
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
				user.setEnabled(true);
				userRepository.saveAndFlush(user);
				mav.addObject("user", user);
				mav.setViewName("/userProfile");
				return mav;
			} else {
				mav.setViewName("form/registerForm");
				return mav;
			}
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
			mav.setViewName("/userProfile");
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
	
	@GetMapping("/my-page/{id}")
	public ModelAndView userProfile(@PathVariable long id) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("user", userRepository.findOne(id));
		mav.setViewName("/userProfile");
		return mav;
	}
}
