package pl.hatex.hatex.app;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import pl.hatex.hatex.repository.UserRepository;
import pl.hatex.hatex.services.SpringDataUserDetailsService;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(securedEnabled = true)
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()
                .antMatchers("/about").hasRole("ADMIN")
                .antMatchers("/user/**").hasAnyRole("USER","ADMIN")
                .antMatchers("/customer/**").hasAnyRole("USER","ADMIN")
                .antMatchers("/desktop/**").hasAnyRole("USER","ADMIN")
                .antMatchers("/order/**").hasAnyRole("USER","ADMIN")
                .antMatchers("/mosquitoNet/**").hasAnyRole("USER","ADMIN")
                .antMatchers("/communicator/**").hasAnyRole("USER","ADMIN","PRODUCTION")
                .and().formLogin().loginPage("/login")
                .defaultSuccessUrl("/redirect")
                .and().logout().logoutSuccessUrl("/login")
                .permitAll()
                .and().exceptionHandling().accessDeniedPage("/403");
    }
    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
    @Bean
    public SpringDataUserDetailsService customUserDetailsService() {
        return new SpringDataUserDetailsService();
    }

}
