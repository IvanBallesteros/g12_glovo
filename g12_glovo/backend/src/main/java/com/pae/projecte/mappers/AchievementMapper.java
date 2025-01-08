package com.pae.projecte.mappers;

import com.pae.projecte.dtos.AchievementDTO;
import com.pae.projecte.models.Achievement;
import org.mapstruct.Mapper;
import org.mapstruct.ReportingPolicy;

import java.util.List;

@Mapper(componentModel = "spring", unmappedTargetPolicy = ReportingPolicy.IGNORE)
public interface AchievementMapper {

    AchievementDTO toDTO(Achievement achievement);

    Achievement toEntity(AchievementDTO achievementDTO);

    List<AchievementDTO> toDTO(List<Achievement> achievement);

    List<Achievement> toEntity(List<AchievementDTO> achievementDTO);
}
