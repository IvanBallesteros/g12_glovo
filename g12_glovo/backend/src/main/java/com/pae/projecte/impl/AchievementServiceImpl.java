package com.pae.projecte.impl;

import com.pae.projecte.dtos.AchievementDTO;
import com.pae.projecte.mappers.AchievementMapper;
import com.pae.projecte.repository.AchievementRepository;
import com.pae.projecte.services.AchivementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AchievementServiceImpl implements AchivementService {

    @Autowired
    private AchievementRepository achievementRepository;

    @Autowired
    private AchievementMapper achievementMapper;

    @Override
    public List<AchievementDTO> getAchievements() {
        return achievementMapper.toDTO(achievementRepository.findAll());
    }

    @Override
    public List<AchievementDTO> getAchievement(String title) {
        return achievementMapper.toDTO(achievementRepository.findByTitle(title));
    }
}
