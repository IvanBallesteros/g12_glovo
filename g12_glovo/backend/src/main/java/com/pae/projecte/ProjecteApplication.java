package com.pae.projecte;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import java.io.IOException;
import java.sql.SQLException;

@SpringBootApplication
public class ProjecteApplication  {

	public static void main(String[] args) throws IOException, SQLException {

		SpringApplication.run(ProjecteApplication.class, args);
	}
}