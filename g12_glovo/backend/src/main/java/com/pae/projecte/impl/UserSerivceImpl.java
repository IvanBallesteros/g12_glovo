package com.pae.projecte.impl;

import com.pae.projecte.dtos.AchievementDTO;
import com.pae.projecte.dtos.UserDTO;
import com.pae.projecte.mappers.UserMapper;
import com.pae.projecte.models.User;
import com.pae.projecte.repository.UserRepository;
import com.pae.projecte.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Comparator;
import java.util.List;

@Service
public class UserSerivceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private UserMapper userMapper;

    @Override
    public List<UserDTO> getUsers() {
        return userMapper.toDTO(userRepository.findAll());
    }

    @Override
    public UserDTO getUser(String username) {
        return userMapper.toDTO(userRepository.findByUsername(username));
    }

    @Override
    public List<UserDTO> getRanking() {
        return userMapper.toDTO(
            userRepository.findAll().stream()
                .sorted(Comparator.comparingLong(User::getAll_time).reversed())
                .toList()
        );
    }

    @Override
    public List<UserDTO> getMonthlyRanking() {
        return userMapper.toDTO(
            userRepository.findAll().stream()
                .sorted(Comparator.comparingLong(User::getMonthly).reversed())
                .toList()
        );
    }
}
