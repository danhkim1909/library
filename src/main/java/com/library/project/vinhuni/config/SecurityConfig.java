package com.library.project.vinhuni.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

import com.library.project.vinhuni.Component.FilterPage;
import com.library.project.vinhuni.Component.FilterPageDocGia;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

	@Bean
	public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
		http.authorizeHttpRequests(authorize -> authorize
				.requestMatchers("/admin/**").hasAuthority("ROLE_nhanvien")
				.requestMatchers("/yeuthich/**", "/danhsachyeuthich", "/danhgia/**", "/muonsach/**", "/sachmuon",
						"/trasach/**", "/huymuon/**")
				.hasAuthority("ROLE_docgia")
				.anyRequest().permitAll())
				.exceptionHandling(exception -> exception
						.accessDeniedHandler((request, response, accessDeniedException) -> {
							if (request.getServletPath().startsWith("/admin")) {
								new FilterPage().handle(request, response, accessDeniedException);
							} else {
								new FilterPageDocGia().handle(request, response, accessDeniedException);
							}
						})
						.authenticationEntryPoint((request, response, authException) -> {
							if (request.getServletPath().startsWith("/admin")) {
								new FilterPage().commence(request, response, authException);
							} else {
								new FilterPageDocGia().commence(request, response, authException);
							}
						}))
				.formLogin(form -> form.loginPage("/login").loginProcessingUrl("/login").defaultSuccessUrl("/", true)
						.permitAll())

				.logout(logout -> logout.logoutUrl("/logout").logoutSuccessUrl("/").permitAll())
				.oauth2Login(oauth2 -> oauth2.loginPage("/login").defaultSuccessUrl("/login/oauth2/google", true));
		return http.build();
	}
}
