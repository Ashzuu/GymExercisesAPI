package gymexercises.api.services;

import gymexercises.api.repositories.ExerciseRepository;
import gymexercises.api.models.Exercise;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;

/**
 * Service class for handling Exercise-related business logic.
 */
@ApplicationScoped
public class ExerciseService {
    private final ExerciseRepository repo;

    /**
     * Constructor for ExerciseService, injecting the ExerciseRepository.
     * @param repo The ExerciseRepository to be used by this service.
     */
    @Inject
    public ExerciseService(ExerciseRepository repo) {
        this.repo = repo;
    }

    /**
     * Get all exercises from the database.
     * @return Array of all Exercise objects.
     */
    public Exercise[] getAll(){
        return this.repo.findAll().list().toArray(new Exercise[0]);
    }

    /**
     * Get exercises by muscular group.
     * @param muscularGroup The muscular group to filter exercises by.
     * @return Array of Exercise objects matching the muscular group.
     */
    public Exercise[] getByMuscularGroup(String muscularGroup){
        return this.repo.getByMuscularGroup(muscularGroup).toArray(new Exercise[0]);
    }
}
