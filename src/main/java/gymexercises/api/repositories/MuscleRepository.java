package gymexercises.api.repositories;

import gymexercises.api.models.Muscle;
import io.quarkus.hibernate.orm.panache.PanacheRepositoryBase;
import jakarta.enterprise.context.ApplicationScoped;

/**
 * Repository to access to the data, manage only Muscle entity
 */
@ApplicationScoped
public class MuscleRepository implements PanacheRepositoryBase<Muscle, Integer> {
}
