package repositories;

import entity.BossAbility;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BossRepo  extends CrudRepository<BossAbility,Long> {
}