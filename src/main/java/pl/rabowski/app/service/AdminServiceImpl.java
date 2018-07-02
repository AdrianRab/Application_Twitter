package pl.rabowski.app.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pl.rabowski.app.entities.User;
import pl.rabowski.app.entities.UserRole;
import pl.rabowski.app.repositories.UserRepository;
import pl.rabowski.app.repositories.UserRoleRepository;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	UserRepository userRepository;
	
	@Autowired
	UserRoleRepository userRoleRepository;
	
	@Override
	public void addAdminRights(long id) {
		User user = userRepository.findOne(id);
		UserRole role = userRoleRepository.findOne(user.getRole().getId());
		role.setRole("ROLE_ADMIN");
		userRoleRepository.saveAndFlush(role);
		user.setRole(role);
		userRepository.saveAndFlush(user);
	}

	@Override
	public void removeAdminRights(long id) {
		User user = userRepository.findOne(id);
		UserRole role = userRoleRepository.findOne(user.getRole().getId());
		role.setRole("ROLE_USER");
		userRoleRepository.saveAndFlush(role);
		user.setRole(role);
		userRepository.saveAndFlush(user);
	}

}
