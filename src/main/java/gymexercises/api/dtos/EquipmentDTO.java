package gymexercises.api.dtos;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class EquipmentDTO {
    @JsonProperty()
    private String nameFr;

    @JsonProperty()
    private String nameEn;

    @JsonProperty()
    private String description;
}
