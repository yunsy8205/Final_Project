package com.cloud.pt.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.web.SecurityFilterChain;

// WebSecurity 설정 클래스 생성
@Configuration // springBoot 실행 시, 가장 먼저 읽히는 파일 -> **-context.xml 파일 역할
@EnableWebSecurity // security 활성화
public class SecutrityConfig {
	
	@Bean // API이 객체생성
	WebSecurityCustomizer webSecurityCustomizer() {
		// Security에서 무시해야하는 URL 패턴 등록
		
		return web -> web
				.ignoring()
				.antMatchers("/css/**");
	}
	
	
	// Security Filter 설정
	@Bean
	SecurityFilterChain securityFilteChain(HttpSecurity httpSecurity)throws Exception{
		
		httpSecurity
			.cors()
			.and()
			.csrf()
			.disable()
			.authorizeHttpRequests()
				.antMatchers("/").permitAll()
				.and()
				
			// login form
			.formLogin()
				.permitAll()
				.and()
				
			// logout
			.logout()
				.permitAll()
				.and()
				;
		
		return httpSecurity.build();
	}
}
