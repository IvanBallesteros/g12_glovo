package com.pae.projecte.services;

import com.pae.projecte.dtos.UserDTO;

import java.util.List;

public interface UserService {

    List<UserDTO> getRanking();

    List<UserDTO> getMonthlyRanking();

    List<UserDTO> getUsers();

    UserDTO getUser(String username);
}
