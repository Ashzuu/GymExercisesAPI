package gymexercises.api.models;

import io.quarkus.hibernate.orm.panache.PanacheEntityBase;
import jakarta.persistence.*;

import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "exercises", schema = "data")
public class Exercise extends PanacheEntityBase {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "name_fr", nullable = false, length = 100)
    private String nameFr;

    @Column(name = "name_en", nullable = false, length = 100)
    private String nameEn;

    @Column(name = "media", nullable = false, length = 100)
    private String media;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
            name="association_exercises_muscles",
            schema = "data",
            joinColumns = @JoinColumn(name="id_exercise", table = "exercises"),
            inverseJoinColumns = @JoinColumn(name = "id_muscle", table = "muscles")
    )
    public Set<Muscle> muscles = new HashSet<>();

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
