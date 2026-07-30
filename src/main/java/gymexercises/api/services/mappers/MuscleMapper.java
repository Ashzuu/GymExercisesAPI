package gymexercises.api.services.mappers;

import gymexercises.api.dtos.MuscleDTO;
import gymexercises.api.dtos.MuscularGroupDTO;
import gymexercises.api.models.Muscle;

import java.util.List;

public class MuscleMapper {
    public static MuscleDTO toDto(Muscle muscle){
        if (muscle == null) return null;
        
        MuscleDTO dto = MuscleDTO.builder()
                .nameFr(muscle.getNameFr())
                .nameEn(muscle.getNameEn())
                .media(muscle.getMedia())
                .description(muscle.getDescription())
                .build();

        if (muscle.getMuscularGroup() != null) {
            MuscularGroupDTO groupDto = MuscularGroupDTO.builder()
                    .nameFr(muscle.getMuscularGroup().getNameFr())
                    .nameEn(muscle.getMuscularGroup().getNameEn())
                    .media(muscle.getMuscularGroup().getMedia())
                    .build();
            dto.setMuscularGroup(groupDto);
        }
        
        return dto;
    }

    public static List<MuscleDTO> toDto(List<Muscle> muscles){
        if (muscles == null) return null;
        return muscles.stream().map(MuscleMapper::toDto).toList();
    }
}
