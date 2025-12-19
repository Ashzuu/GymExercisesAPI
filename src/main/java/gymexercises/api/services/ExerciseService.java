package gymexercises.api.services;

import gymexercises.api.interfaces.ExerciseRepository;
import gymexercises.api.models.Exercise;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;

@ApplicationScoped
public class ExerciseService {
    private final ExerciseRepository repo;

    @Inject
    public ExerciseService(ExerciseRepository repo) {
        this.repo = repo;
    }

    public Exercise[] getAll(){
        return this.repo.findAll().list().toArray(new Exercise[0]);
    }

    public Exercise[] getByMuscularGroup(String muscularGroup){
        return this.repo.getByMuscularGroup(muscularGroup).toArray(new Exercise[0]);
    }
}
