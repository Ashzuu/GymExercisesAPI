package gymexercises.api.services.mappers;

import dtos.gym_api_data.MuscleDTO;
import dtos.gym_api_data.MuscularGroupDTO;
import gymexercises.api.models.MuscularGroup;

import java.util.List;

public class MuscularGroupMapper {
    public static MuscularGroupDTO toDto(MuscularGroup group){
        if (group == null) return null;
        
        MuscularGroupDTO dto = MuscularGroupDTO.builder()
                .nameFr(group.getNameFr())
                .nameEn(group.getNameEn())
                .media(group.getMedia())
                .build();

        if (group.getMuscles() != null) {
            List<MuscleDTO> muscles = group.getMuscles().stream().map(m -> MuscleDTO.builder()
                    .nameFr(m.getNameFr())
                    .nameEn(m.getNameEn())
                    .media(m.getMedia())
                    .description(m.getDescription())
                    .muscularGroup(dto)
                    .build()
            ).toList();
            dto.setMuscles(muscles);
        }
        
        return dto;
    }

    public static List<MuscularGroupDTO> toDto(List<MuscularGroup> groups){
        if (groups == null) return null;
        return groups.stream().map(MuscularGroupMapper::toDto).toList();
    }
}
