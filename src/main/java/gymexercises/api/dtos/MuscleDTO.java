package gymexercises.api.dtos;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonView;
import gymexercises.api.dtos.filters.MuscularFilter;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class MuscleDTO {
    @JsonProperty()
    private String nameFr;

    @JsonProperty()
    private String nameEn;

    @JsonProperty()
    private String media;

    @JsonProperty()
    private String description;

    @JsonProperty()
    @JsonView(MuscularFilter.IncludeMuscularGroup.class)
    private MuscularGroupDTO muscularGroup;
}
