package gymexercises.api.services;

import gymexercises.api.models.Muscle;
import gymexercises.api.repositories.MuscleRepository;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;

/**
 * Service to manage muscle service, linked to the repository.
 */
@ApplicationScoped
public class MuscleService {
    private final MuscleRepository repository;

    /**
     * Constructor of the MuscleService
     * @param repository The MuscleRepository to be used by this service
     */
    @Inject
    public MuscleService(MuscleRepository repository){
        this.repository = repository;
    }

    /**
     * Get all muscles in the database
     * @return All muscles in the database
     */
    public Muscle[] getAll(){
        return this.repository.findAll().list().toArray(new Muscle[0]);
    }
}
