package gymexercises.api.repositories;

import gymexercises.api.models.Exercise;
import io.quarkus.hibernate.orm.panache.PanacheRepositoryBase;
import jakarta.enterprise.context.ApplicationScoped;

import java.util.List;

@ApplicationScoped
public class ExerciseRepository implements PanacheRepositoryBase<Exercise, Integer> {
    public List<Exercise> getByMuscularGroup(String muscularGroup){
        String query =  "SELECT e FROM Exercise e " +
                        "JOIN e.muscles m " +
                        "JOIN m.muscularGroup mG " +
                        "WHERE mG.nameFr = ?1 OR mG.nameEn = ?1";
        return list(
            query,muscularGroup.toUpperCase()
        );
    }
}
