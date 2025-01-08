package com.pae.projecte.controllers;

import com.pae.projecte.dtos.AchievementDTO;
import com.pae.projecte.services.AchivementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/achievements")
public class AchievementController {

    @Autowired
    private AchivementService achivementService;

    @GetMapping
    public List<AchievementDTO> getAchievements() {
       return achivementService.getAchievements();
    }

    @GetMapping(path = "/{title}")
    public List<AchievementDTO> getAchievements(@PathVariable("title") String title) {
        return achivementService.getAchievement(title);
    }
}