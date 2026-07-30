package gymexercises.api.services.mappers;

import gymexercises.api.dtos.EquipmentDTO;
import gymexercises.api.models.Equipment;

public class EquipmentMapper {
    public static EquipmentDTO toDto(Equipment equipment){
        return EquipmentDTO.builder()
                .nameFr(equipment.getNameFr())
                .nameEn(equipment.getNameEn())
                .description(equipment.getDescription())
                .build();
    }
}
