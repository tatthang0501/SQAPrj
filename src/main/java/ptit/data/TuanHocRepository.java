package ptit.data;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import ptit.TuanHoc;

public interface TuanHocRepository extends CrudRepository<TuanHoc, Integer>{
    @Query(value="SELECT * FROM kiphoc WHERE lichhocid = ?1", nativeQuery = true)
    List<TuanHoc> findByLichHocId(int lhId);
}
