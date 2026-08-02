package gymexercises.api.controllers;

import com.fasterxml.jackson.annotation.JsonView;
import dtos.gym_api_data.MuscleDTO;
import dtos.gym_api_data.MuscularGroupDTO;
import dtos.gym_api_data.filters.MuscularFilter;
import gymexercises.api.services.MuscleService;
import jakarta.inject.Inject;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.Produces;

import java.util.List;

/**
 * Muscle resource to manage muscle entity.
 * Resource = Controller
 */
@Path("/muscles")
public class MuscleController {
    private final MuscleService service;

    @Inject
    public MuscleController(MuscleService service){
        this.service = service;
    }

    /**
     * Extract all muscles available in the database
     * @return All muscles
     */
    @Path("/all")
    @GET
    @JsonView(MuscularFilter.IncludeMuscularGroup.class)
    @Produces("application/json")
    public List<MuscleDTO> getAll(){
        return this.service.getAll();
    }

    @Path("/groups/all")
    @GET
    @Produces("application/json")
    @JsonView(MuscularFilter.IncludeMuscles.class)
    public List<MuscularGroupDTO> getAllMuscularGroups(){
        return this.service.getAllMuscularGroups();
    }
}
