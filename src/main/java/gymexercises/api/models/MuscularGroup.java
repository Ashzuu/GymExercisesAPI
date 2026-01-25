package gymexercises.api.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import io.quarkus.hibernate.orm.panache.PanacheEntityBase;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.LinkedHashSet;
import java.util.Set;

@Entity
@Table(name = "muscular_group", schema = "data")
@Getter
@Setter
public class MuscularGroup extends PanacheEntityBase {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "name_fr", nullable = false, length = 100)
    private String nameFr;

    @Column(name = "name_en", nullable = false, length = 100)
    private String nameEn;

    @Column(name = "media", length = 100)
    private String media;

    @JsonIgnore
    @OneToMany(mappedBy = "muscularGroup")
    private Set<Muscle> muscles = new LinkedHashSet<>();
}
