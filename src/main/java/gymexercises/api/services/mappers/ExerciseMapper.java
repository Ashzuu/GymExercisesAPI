package gymexercises.api.services.mappers;

import dtos.gym_api_data.ExerciseDTO;
import gymexercises.api.models.Exercise;

import java.util.List;

public class ExerciseMapper {
    public static ExerciseDTO toDto(Exercise exercise){
        return ExerciseDTO.builder()
                .nameFr(exercise.getNameFr())
                .nameEn(exercise.getNameEn())
                .media(exercise.getMedia())
                .muscles(MuscleMapper.toDto(exercise.getMuscles()))
                .build();
    }

    public static List<ExerciseDTO> toDto(List<Exercise> exercises){
        return exercises.stream().map(ExerciseMapper::toDto).toList();
    }
}
