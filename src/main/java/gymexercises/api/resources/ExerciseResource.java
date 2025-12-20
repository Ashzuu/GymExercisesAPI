package gymexercises.api.resources;

import gymexercises.api.models.Exercise;
import gymexercises.api.services.ExerciseService;
import jakarta.inject.Inject;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.PathParam;
import jakarta.ws.rs.Produces;

@Path("/exercises")
public class ExerciseResource {
    private final ExerciseService service;

    @Inject
    public ExerciseResource(ExerciseService service) {
        this.service = service;
    }

    @Path("/all")
    @GET
    @Produces("application/json")
    public Exercise[] getAll(){
        return this.service.getAll();
    }

    @Path("/getBy/muscularGroup/{muscular_group}")
    @GET
    @Produces("application/json")
    public Exercise[] getByMuscularGroup(@PathParam("muscular_group") String muscular_group){
        return this.service.getByMuscularGroup(muscular_group);
    }
}
