package com.pae.projecte.controllers;

import com.pae.projecte.dtos.UserDTO;
import com.pae.projecte.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/users")
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping
    public List<UserDTO> getUsers() {
        return userService.getUsers();
    }

    @GetMapping(path = "/{username}")
    public UserDTO getUser(@PathVariable("username") String username) {
        return userService.getUser(username);
    }

    @GetMapping(path = "/ranking")
    public List<UserDTO> getRanking() {
        return userService.getRanking();
    }

    @GetMapping(path = "/ranking/monthly")
    public List<UserDTO> getMonthlyRanking() {
        return userService.getMonthlyRanking();
    }
}