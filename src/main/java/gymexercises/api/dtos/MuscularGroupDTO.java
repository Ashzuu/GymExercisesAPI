package gymexercises.api.dtos;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonView;
import gymexercises.api.dtos.filters.MuscularFilter;
import lombok.Builder;
import lombok.Data;

import java.util.List;

@Data
@Builder
public class MuscularGroupDTO {
    @JsonProperty()
    private String nameFr;

    @JsonProperty()
    private String nameEn;

    @JsonProperty()
    private String media;

    @JsonProperty()
    @JsonView(MuscularFilter.IncludeMuscles.class)
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private List<MuscleDTO> muscles;
}
