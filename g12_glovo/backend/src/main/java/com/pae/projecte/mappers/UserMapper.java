package com.pae.projecte.mappers;

import com.pae.projecte.dtos.UserDTO;
import com.pae.projecte.models.User;
import org.mapstruct.Mapper;
import org.mapstruct.ReportingPolicy;

import java.util.List;

@Mapper(componentModel = "spring", unmappedTargetPolicy = ReportingPolicy.IGNORE)
public interface UserMapper {

    UserDTO toDTO(User user);

    User toEntity(UserDTO userDTO);

    List<UserDTO> toDTO(List<User> user);

    List<User> toEntity(List<UserDTO> userDTO);
}
