package com.zombie.config;

import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.lookup.JndiDataSourceLookup;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

@Configuration
@ComponentScan("com.zombie")
@EnableWebMvc
public class RootConfig {
	
	@Bean
	public DataSource dataSource() {
		final JndiDataSourceLookup jndiDataSourceLookup = new JndiDataSourceLookup();
		jndiDataSourceLookup.setResourceRef(true);
		DataSource dataSource = jndiDataSourceLookup.getDataSource("jdbc/ZombieDS");
		return dataSource;
	}
}
