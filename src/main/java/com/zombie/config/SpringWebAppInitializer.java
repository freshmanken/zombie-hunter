package com.zombie.config;

import javax.servlet.HttpConstraintElement;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;
import javax.servlet.ServletSecurityElement;
import javax.servlet.annotation.ServletSecurity;

import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.servlet.DispatcherServlet;

// This file takes the place of web.xml
public class SpringWebAppInitializer implements WebApplicationInitializer {

	@Override
	public void onStartup(ServletContext servletContext) throws ServletException {

		AnnotationConfigWebApplicationContext annotationConfigWebApplicationContext = new AnnotationConfigWebApplicationContext();
		annotationConfigWebApplicationContext.register(ApplicationContextConfiguration.class);
		annotationConfigWebApplicationContext.setDisplayName("Zombies");
	    annotationConfigWebApplicationContext.setServletContext(servletContext);
		annotationConfigWebApplicationContext.scan("com.zombie");
	    servletContext.addListener(new ContextLoaderListener(annotationConfigWebApplicationContext));
	    
		ServletRegistration.Dynamic dispatcher = servletContext.addServlet("SpringDispatcher",
				new DispatcherServlet(annotationConfigWebApplicationContext));
		dispatcher.setLoadOnStartup(1);
		dispatcher.addMapping("/");
		
		// to redirect to https from http
		HttpConstraintElement forceHttpsConstraint = new HttpConstraintElement(ServletSecurity.TransportGuarantee.CONFIDENTIAL, new String[0]);
		@SuppressWarnings("unused")
        ServletSecurityElement securityElement = new ServletSecurityElement(forceHttpsConstraint);
		// dispatcher.setServletSecurity(securityElement);
	}
}