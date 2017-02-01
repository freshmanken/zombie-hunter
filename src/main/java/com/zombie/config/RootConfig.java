package com.zombie.config;

import javax.sql.DataSource;

import org.apache.commons.dbcp.BasicDataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

@Configuration
@ComponentScan("com.zombie")
@EnableWebMvc
public class RootConfig {
	
	@Bean
	public DataSource dataSource() {
		/* this is used for datasource defined in tomcat context.xml */
		// final JndiDataSourceLookup jndiDataSourceLookup = new
		// JndiDataSourceLookup();
		// jndiDataSourceLookup.setResourceRef(true);
		// DataSource dataSource =
		// jndiDataSourceLookup.getDataSource("jdbc/ZombieDS");
		// return dataSource;

		BasicDataSource basicDataSource = new org.apache.commons.dbcp.BasicDataSource();
		basicDataSource.setDriverClassName("com.mysql.jdbc.Driver");
		basicDataSource.setUrl(
				"*******");
		basicDataSource.setUsername("*******");
		basicDataSource.setPassword("*******");
		return basicDataSource;

	}
}
