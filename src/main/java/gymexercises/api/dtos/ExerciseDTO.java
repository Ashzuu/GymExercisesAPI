package gymexercises.api.dtos;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Builder;
import lombok.Data;

import java.util.List;

@Data
@Builder
public class ExerciseDTO {
    @JsonProperty()
    private String nameFr;

    @JsonProperty()
    private String nameEn;

    @JsonProperty()
    private String media;

    @JsonProperty()
    @JsonInclude(JsonInclude.Include.NON_EMPTY)
    private List<MuscleDTO> muscles;
}
