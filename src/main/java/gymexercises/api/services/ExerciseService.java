package gymexercises.api.services;

import dtos.gym_api_data.ExerciseDTO;
import gymexercises.api.repositories.ExerciseRepository;
import gymexercises.api.services.mappers.ExerciseMapper;
import io.quarkus.cache.CacheResult;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;

import java.util.List;

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
    @CacheResult(cacheName = "exercises-cache")
    public List<ExerciseDTO> getAll(){
        return ExerciseMapper.toDto(this.repo.findAll().stream().toList());
    }

    /**
     * Get exercises by muscular group.
     * @param muscularGroup The muscular group to filter exercises by.
     * @return Array of Exercise objects matching the muscular group.
     */
    public List<ExerciseDTO> getByMuscularGroup(String muscularGroup){
        return ExerciseMapper.toDto(this.repo.getByMuscularGroup(muscularGroup).stream().toList());
    }
}
