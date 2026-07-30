package gymexercises.api.services;

import gymexercises.api.dtos.MuscleDTO;
import gymexercises.api.dtos.MuscularGroupDTO;
import gymexercises.api.repositories.MuscleRepository;
import gymexercises.api.repositories.MuscularGroupRepository;
import gymexercises.api.services.mappers.MuscleMapper;
import gymexercises.api.services.mappers.MuscularGroupMapper;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;

import java.util.List;

/**
 * Service to manage muscle service, linked to the repository.
 */
@ApplicationScoped
public class MuscleService {
    private final MuscleRepository muscleRepo;
    private final MuscularGroupRepository muscularGroupRepo;

    /**
     * Constructor of the MuscleService
     * @param muscleRepo The MuscleRepository to be used by this service
     */
    @Inject
    public MuscleService(MuscleRepository muscleRepo, MuscularGroupRepository muscularRepo){
        this.muscleRepo = muscleRepo;
        this.muscularGroupRepo = muscularRepo;
    }

    /**
     * Get all muscles in the database
     * @return All muscles in the database
     */
    public List<MuscleDTO> getAll(){
        return MuscleMapper.toDto(this.muscleRepo.findAll().list());
    }

    /**
     * Get all muscular group in the database
     * @return All Muscular groups in the database
     */
    public List<MuscularGroupDTO> getAllMuscularGroups(){
        return MuscularGroupMapper.toDto(this.muscularGroupRepo.findAll().list());
    }
}
