package gymexercises.api.services.mappers;

import gymexercises.api.dtos.ExerciseDTO;
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
