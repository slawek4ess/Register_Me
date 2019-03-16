package pl.coderslab.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.format.FormatterRegistry;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalEntityManagerFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.validation.beanvalidation.LocalValidatorFactoryBean;
import org.springframework.web.servlet.LocaleContextResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import pl.coderslab.converter.DayVisithourConverter;
import pl.coderslab.converter.EmployeeConverter;
import pl.coderslab.converter.UserConverter;
import pl.coderslab.converter.WeekdayConverter;

import javax.persistence.EntityManagerFactory;
import javax.validation.Validator;
import java.util.Locale;

@Configuration
@EnableWebMvc
@ComponentScan("pl.coderslab")
@EnableTransactionManagement
@EnableJpaRepositories("pl.coderslab.repository")
public class AppConfig extends WebMvcConfigurerAdapter {

    @Bean
    public Validator validator() {
        return new LocalValidatorFactoryBean();
    }

    @Bean
    public ViewResolver viewResolver() {
        InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
        viewResolver.setPrefix("/WEB-INF/views/");
        viewResolver.setSuffix(".jsp");
        return viewResolver;
    }

    @Override
    public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
        configurer.enable();
    }

    @Bean
    public LocalEntityManagerFactoryBean entityManagerFactory() {

        LocalEntityManagerFactoryBean emfb = new LocalEntityManagerFactoryBean();
        emfb.setPersistenceUnitName("regMePersistenceUnit");

        return emfb;
    }

    @Bean
    public JpaTransactionManager transactionManager(EntityManagerFactory emf) {

        JpaTransactionManager tm = new JpaTransactionManager(emf);
        return tm;
    }

    @Bean(name="localeResolver")
    public LocaleContextResolver getLocaleContextResolver() {
        SessionLocaleResolver localeResolver = new SessionLocaleResolver();
        localeResolver.setDefaultLocale(new Locale("pl","PL"));
        return localeResolver;
    }

    @Override
    public void addFormatters(FormatterRegistry registry) {
        registry.addConverter(getUserConverter());
        registry.addConverter(getEmployeeConverter());
        registry.addConverter(getWeekdayConverter());
        registry.addConverter(getDayVisithourConverter());
    }

    @Bean
    public UserConverter getUserConverter() {
        return new UserConverter();
    }

    @Bean
    public EmployeeConverter getEmployeeConverter() {
        return new EmployeeConverter();
    }

    @Bean
    public WeekdayConverter getWeekdayConverter() {
        return new WeekdayConverter();
    }

    @Bean
    public DayVisithourConverter getDayVisithourConverter() {
        return new DayVisithourConverter();
    }

}
