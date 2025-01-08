package com.pae.projecte.dtos;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AchievementDTO {

    private Long id;

    private String title;

    private String description;

    private Long requisite;

    private Boolean completed;
}