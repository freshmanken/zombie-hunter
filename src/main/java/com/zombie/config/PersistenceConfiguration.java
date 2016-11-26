package com.zombie.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

/**
 * Spring configuration for the entity manager factory. The entity manager is used for the Java Persistence API.
 */

@Configuration
@ComponentScan("com.zombie")
@EnableJpaRepositories(basePackages = "com.zombie")
public class PersistenceConfiguration {
}