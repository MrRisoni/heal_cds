package entity;



import lombok.Data;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Data
@Entity
@Table(name = "boss_abilities")
public class BossAbility implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column
    private Long id;

    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 55)
    @Column(name = "short_title")
    private String shortTitle;


    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 55)
    @Column(name = "short_title")
    private String fullName;

    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 55)
    @Column(name = "enemy_spell_id")
    private String enemySpellId;
    
    
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 55)
    @Column(name = "enemy_color")
    private String enemyColor;

    public BossAbility() {
    }

    
}