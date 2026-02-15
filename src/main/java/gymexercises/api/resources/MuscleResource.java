package gymexercises.api.resources;

import gymexercises.api.models.Muscle;
import gymexercises.api.services.MuscleService;
import jakarta.inject.Inject;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.Produces;

/**
 * Muscle resource to manage muscle entity.
 * Resource = Controller
 */
@Path("/muscles")
public class MuscleResource {
    private final MuscleService service;

    @Inject
    public MuscleResource(MuscleService service){
        this.service = service;
    }

    /**
     * Extract all muscles available in the database
     * @return All muscles
     */
    @Path("/all")
    @GET
    @Produces("application/json")
    public Muscle[] getAll(){
        return this.service.getAll();
    }
}
