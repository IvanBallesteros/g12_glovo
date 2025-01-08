package com.pae.projecte.repository;

import com.pae.projecte.models.Achievement;
import com.pae.projecte.models.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

    @Query("SELECT a FROM User a WHERE a.username like %:username%")
    User findByUsername(@Param("username") String username);
}
