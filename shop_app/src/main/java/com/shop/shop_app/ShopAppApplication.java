package com.shop.shop_app;

import io.swagger.v3.oas.annotations.ExternalDocumentation;
import io.swagger.v3.oas.annotations.OpenAPIDefinition;
import io.swagger.v3.oas.annotations.info.Contact;
import io.swagger.v3.oas.annotations.info.Info;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

@SpringBootApplication
@EnableJpaAuditing(auditorAwareRef = "auditAwareImpl")
@OpenAPIDefinition(
        info = @Info(
                title = "Shop application REST API'S Documentation",
                description = "Shop application to check the product availability",
                version = "v1",
                contact = @Contact(
                        name = "Shyam",
                        email = "psyam0175@gmail.com"
                )
        ),
        externalDocs = @ExternalDocumentation(
                description = "Shop application REST API'S Documentation"
        )
)
public class ShopAppApplication {
    public static void main(String[] args) {
        SpringApplication.run(ShopAppApplication.class, args);
    }

}
