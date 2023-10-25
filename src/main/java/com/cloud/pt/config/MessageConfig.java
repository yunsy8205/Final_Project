package com.cloud.pt.config;

import java.util.Locale;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

@Configuration // springBoot 실행 시, 가장 먼저 읽히는 파일 -> **-context.xml 파일 역할
public class MessageConfig implements WebMvcConfigurer {
	
	// 메서드 = localeResolver 사용!
	@Bean // Message 설정 객체
	public LocaleResolver localeResolver() {
		// session 이용해서 Message Default 설정 (한국어)
		SessionLocaleResolver resolver = new SessionLocaleResolver();
		resolver.setDefaultLocale(Locale.KOREAN);
		
		return resolver;
	}
	
	
	@Bean // Message 사용할 때, interceptor 처리
	public LocaleChangeInterceptor changeInterceptor() {
		LocaleChangeInterceptor interceptor = new LocaleChangeInterceptor();
		
		// 파라미터 언어받기
		interceptor.setParamName("lang");
		
		return interceptor;
	}
}
