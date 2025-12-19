package gymexercises.api.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import io.quarkus.hibernate.orm.panache.PanacheEntityBase;
import jakarta.persistence.*;

import java.util.LinkedHashSet;
import java.util.Set;

@Entity
@Table(name = "muscular_group", schema = "data")
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

    public Set<Muscle> getMuscles() {
        return muscles;
    }

    public void setMuscles(Set<Muscle> muscles) {
        this.muscles = muscles;
    }

    public String getMedia() {
        return media;
    }

    public void setMedia(String media) {
        this.media = media;
    }

    public String getNameEn() {
        return nameEn;
    }

    public void setNameEn(String nameEn) {
        this.nameEn = nameEn;
    }

    public String getNameFr() {
        return nameFr;
    }

    public void setNameFr(String nameFr) {
        this.nameFr = nameFr;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
}
