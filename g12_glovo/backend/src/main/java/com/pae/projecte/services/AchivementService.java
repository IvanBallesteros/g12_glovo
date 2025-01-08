package com.pae.projecte.services;

import com.pae.projecte.dtos.AchievementDTO;

import java.util.List;

public interface AchivementService {

    List<AchievementDTO> getAchievements();

    List<AchievementDTO> getAchievement(String title);
}
