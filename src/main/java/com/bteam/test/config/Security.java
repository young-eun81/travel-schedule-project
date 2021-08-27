package com.bteam.test.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.bteam.test.config.auth.PrincipalDetailService;
import com.bteam.test.handler.AuthFailureHandler;



@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class Security extends WebSecurityConfigurerAdapter {
	
	@Autowired
	private PrincipalDetailService principalDetailService;
	
	@Autowired
	private AuthFailureHandler authFailureHandler;
	
	
	@Bean
	@Override
	public AuthenticationManager authenticationManagerBean() throws Exception {
		return super.authenticationManagerBean();
	}
	
	@Bean //IoC가 된다!
	public static PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	@Override
	public void configure(WebSecurity web) throws Exception {
		//인증을 무시하기 위한 설정
		web.ignoring().antMatchers("/css/**", "/images/**", "/category/**", "/js/**");
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.csrf().disable() // csrf 토큰 비활성화 (테스트시 걸어두는게 좋음)
				.authorizeRequests()// .antMatchers("/auth/**","/")//이쪽으로오는요청은
				.antMatchers("/auth/**","/", "/search/**","/find/**").permitAll()// 허용
				.anyRequest()// 다른 모든요청들은
				.authenticated()// 인증이 되야되
				.and()
			.formLogin() //로그인 설정
				.loginPage("/auth/loginForm") //커스텀 login 페이지 사용
				.loginProcessingUrl("/auth/loginProc")
				.defaultSuccessUrl("/") //로그인 성공시 이동할 페이지
				.failureHandler(authFailureHandler)
				.permitAll();
	}
	
	@Override
	public void configure(AuthenticationManagerBuilder auth) throws Exception {
		//로그인 처리를 하기 위한 AuthenticationManagerBuilder를 설정
		auth.userDetailsService(principalDetailService).passwordEncoder(passwordEncoder());
			
	}
}
