package com.zombie.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.orm.jpa.JpaVendorAdapter;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;

/**
 * Spring configuration for the entity manager factory. The entity manager is used for the Java Persistence API.
 */

@Configuration
@ComponentScan("com.zombie")
@EnableJpaRepositories(basePackages = "com.zombie")
public class EntityManagerFactoryConfiguration {
    @Autowired
    private DataSource dataSource;

    @Autowired
    private JpaVendorAdapter jpaVendorAdapter;

    @Bean
    public LocalContainerEntityManagerFactoryBean entityManagerFactory() {
        LocalContainerEntityManagerFactoryBean localContainerEntityManagerFactoryBean = new LocalContainerEntityManagerFactoryBean();
        localContainerEntityManagerFactoryBean.setDataSource(dataSource);
		localContainerEntityManagerFactoryBean.setPackagesToScan(new String[] { "com.zombie" });
        localContainerEntityManagerFactoryBean.setJpaVendorAdapter(jpaVendorAdapter);
        return localContainerEntityManagerFactoryBean;
    }
}