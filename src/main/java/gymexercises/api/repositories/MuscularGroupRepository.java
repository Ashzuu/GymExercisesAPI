package gymexercises.api.repositories;

import gymexercises.api.models.MuscularGroup;
import io.quarkus.hibernate.orm.panache.PanacheRepositoryBase;
import jakarta.enterprise.context.ApplicationScoped;

@ApplicationScoped
public class MuscularGroupRepository implements PanacheRepositoryBase<MuscularGroup, Integer> {
}
