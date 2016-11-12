package com.zombie.controller;

import java.util.HashMap;

import javax.persistence.EntityManagerFactory;
import javax.sql.DataSource;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaDialect;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;

import com.sun.javafx.collections.Map;

@Configuration
@EnableJpaRepositories(basePackages = "com.zombie.controller")
public class RootConfig {
 
  @Bean
  public BasicDataSource dataSource() {
    // org.apache.commons.dbcp.BasicDataSource
    BasicDataSource basicDataSource = new BasicDataSource();
    basicDataSource.setDriverClassName("com.mysql.jdbc.Driver");
    basicDataSource.setUrl("zrds1.chectpppt5lt.us-west-2.rds.amazonaws.com");
    basicDataSource.setUsername("zdev");
    basicDataSource.setPassword("nn1\\MS2x;45K");
    return basicDataSource;
  }
 
  @Bean
  public LocalContainerEntityManagerFactoryBean entityManagerFactory(DataSource dataSource) {
    LocalContainerEntityManagerFactoryBean entityManagerFactory = new LocalContainerEntityManagerFactoryBean();
//    entityManagerFactory.setPersistenceUnitName("hibernate-persistence");
    entityManagerFactory.setDataSource(dataSource);
    entityManagerFactory.setJpaVendorAdapter(new HibernateJpaVendorAdapter());
    entityManagerFactory.setJpaDialect(new HibernateJpaDialect());
    entityManagerFactory.setPackagesToScan("com.shengwang.demo.model");
     
    entityManagerFactory.setJpaPropertyMap(HibernateJpaProperties());
    return entityManagerFactory;
  }
 
  private Map<String, ?> hibernateJpaProperties() {
    HashMap<String, String> properties = new HashMap<>();
    properties.put("hibernate.hbm2ddl.auto", "create");
    properties.put("hibernate.show_sql", "false");
    properties.put("hibernate.format_sql", "false");
    properties.put("hibernate.hbm2ddl.import_files", "insert-data.sql");
    properties.put("hibernate.ejb.naming_strategy", "org.hibernate.cfg.ImprovedNamingStrategy");
     
    properties.put("hibernate.c3p0.min_size", "2");
    properties.put("hibernate.c3p0.max_size", "5");
    properties.put("hibernate.c3p0.timeout", "300"); // 5mins
     
    return properties;
  }
 
  @Bean
  public JpaTransactionManager transactionManager(EntityManagerFactory emf) {
    //org.springframework.orm.jpa.JpaTransactionManager
    JpaTransactionManager jpaTransactionManager = new JpaTransactionManager();
    jpaTransactionManager.setEntityManagerFactory(emf);
    return jpaTransactionManager;
  }
 
}
