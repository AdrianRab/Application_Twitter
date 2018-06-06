package pl.rabowski.app.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter{
	
	@Autowired
	private DataSource dataSource;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	private String usersQuery = "select email, password, enabled from users where email=?";
	private String rolesQuery = "SELECT email, role from users INNER JOIN user_roles ON users.user_id=user_roles.user_user_id WHERE email=?";
	
    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
    	
    	auth.jdbcAuthentication()
    	.dataSource(dataSource)
    	.usersByUsernameQuery(usersQuery)
    	.authoritiesByUsernameQuery(rolesQuery)
    	.passwordEncoder(bCryptPasswordEncoder);
    }
    
    
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests().antMatchers("/tweet/**", "/user/**")
				.access("hasAnyRole('ROLE_USER', 'ROLE_ADMIN')")
				.antMatchers("/admin/**")
				.access("hasRole('ROLE_ADMIN')")
				.anyRequest().permitAll()
				.and()
				.formLogin()
				.loginPage("/login")
				.usernameParameter("email")
				.passwordParameter("password")
				.and().logout()
				.logoutSuccessUrl("/home")
				.and()
				.csrf().disable(); 
	}

	@Override
	public void configure(WebSecurity web) throws Exception {
		web.ignoring().antMatchers("/resources/**", "/static/**", "/css/**", "/js/**", "/images/**");
	}
}


