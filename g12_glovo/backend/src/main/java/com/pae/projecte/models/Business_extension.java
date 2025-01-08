package com.pae.projecte.models;

import jakarta.persistence.*;
import lombok.*;

import java.util.List;

@Entity
@Table(name = "business_extension")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Business_extension {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String name;
}