package gymexercises.api.resources;

import gymexercises.api.models.Exercise;
import gymexercises.api.services.ExerciseService;
import jakarta.inject.Inject;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.PathParam;
import jakarta.ws.rs.Produces;

/**
 * Resource class for handling Exercise-related API endpoints.
 */
@Path("/exercises")
public class ExerciseResource {
    private final ExerciseService service;

    /**
     * Constructor for ExerciseResource, injecting the ExerciseService.
     * @param service The ExerciseService to be used by this resource.
     */
    @Inject
    public ExerciseResource(ExerciseService service) {
        this.service = service;
    }

    /**
     * Get all exercises form the database, without paging.
     * @return JSON data of all exercises.
     */
    @Path("/all")
    @GET
    @Produces("application/json")
    public Exercise[] getAll(){
        return this.service.getAll();
    }

    /**
     * Get exercises by muscular group, without paging. The muscular group must be in French or in English.
     * @param muscular_group The muscular group to filter exercises by.
     * @return JSON data of exercises matching the muscular group.
     */
    @Path("/getBy/muscularGroup/{muscular_group}")
    @GET
    @Produces("application/json")
    public Exercise[] getByMuscularGroup(@PathParam("muscular_group") String muscular_group){
        return this.service.getByMuscularGroup(muscular_group);
    }
}
