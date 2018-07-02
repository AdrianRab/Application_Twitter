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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pl.rabowski.app.entities.User;
import pl.rabowski.app.entities.UserRole;
import pl.rabowski.app.repositories.UserRepository;
import pl.rabowski.app.repositories.UserRoleRepository;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	UserRepository userRepository;
	
	@Autowired
	UserRoleRepository userRoleRepository;
	
	@GetMapping("/add")
	private ModelAndView addAdmin() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("user", new User());
		mav.setViewName("form/addAdmin");
		return mav;
	}
	
	@PostMapping("/add")
	private ModelAndView saveAdmin(@RequestParam String password, @RequestParam String passwordConfirmed,  @Valid User user, BindingResult result) {
		ModelAndView mav = new ModelAndView();
		if (!(password.equals(passwordConfirmed))) {
			mav.addObject("errorMessage", "Provided passwords does not match. Please try again.");
			mav.setViewName("form/addAdmin");
			return mav;
		} else if (userRepository.findByEmailIgnoreCase(user.getEmail()) != null) {
			mav.addObject("errorMessage", "Provided e-mail is aleady in use.");
			mav.setViewName("form/addAdmin");
			return mav;
		} else if (userRepository.findFirstByUsername(user.getUsername()) != null) {
			mav.addObject("errorMessage", "Username is already in use.");
			mav.setViewName("form/addAdmin");
			return mav;
		} else {
			if (!result.hasErrors()) {
				UserRole userRole = new UserRole();
				user.setEnabled(true);
				userRole.setUser(user);
				userRole.setRole("ROLE_ADMIN");
				userRoleRepository.saveAndFlush(userRole);
				userRepository.saveAndFlush(user);
				mav.addObject("user", user);
				mav.setViewName("adminPanel");
				return mav;
			} else {
				mav.setViewName("form/addAdmin");
				return mav;
			}
		}
	}
	
	@GetMapping("/panel")
	private ModelAndView addPanel() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("adminPanel");
		return mav;
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
	
	
	@GetMapping("/delete-user/{id}")
	public ModelAndView removeUser(@PathVariable long id) {
		ModelAndView mav = new ModelAndView();
		userRepository.delete(id);
		mav.setViewName("redirect:http://localhost:8080/Application_Twitter/admin/panel");
		return mav;
	}
	
	
	@GetMapping("/rights/{id}")
	private ModelAndView addAdminRights(@PathVariable long id) {
		ModelAndView mav = new ModelAndView();
		User user = userRepository.findOne(id);
		UserRole role = userRoleRepository.findOne(user.getRole().getId());
		role.setRole("ROLE_ADMIN");
		userRoleRepository.saveAndFlush(role);
		user.setRole(role);
		userRepository.saveAndFlush(user);
		mav.setViewName("redirect:http://localhost:8080/Application_Twitter/admin/panel");
		return mav;
	}
	
	@GetMapping("/remove-rights/{id}")
	private ModelAndView removeAdminRights(@PathVariable long id) {
		ModelAndView mav = new ModelAndView();
		User user = userRepository.findOne(id);
		UserRole role = userRoleRepository.findOne(user.getRole().getId());
		role.setRole("ROLE_USER");
		userRoleRepository.saveAndFlush(role);
		user.setRole(role);
		userRepository.saveAndFlush(user);
		mav.setViewName("redirect:http://localhost:8080/Application_Twitter/admin/panel");
		return mav;
	}
	
	
	@ModelAttribute("allUsers")
	public List<User> getAllTweets() {
		List<User> users = userRepository.findAll();
		return users;
	}
	
}
