package gymexercises.api.models;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "equipment", schema = "data")
@Getter
@Setter
public class Equipment {
    @Column(name = "description", length = Integer.MAX_VALUE)
    private String description;
    @Column(name = "name_en", length = 100)
    private String nameEn;
    @Column(name = "name_fr", length = 100)
    private String nameFr;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;
}
