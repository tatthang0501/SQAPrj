package ptit.data;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import ptit.models.LopHocPhan;

public interface LopHocPhanRepository extends CrudRepository<LopHocPhan, Integer>{
    @Query(value="SELECT * FROM lophocphan WHERE monhockyhocid=?1 ",nativeQuery = true)
    List<LopHocPhan> getLHPByMHKHId(int id);
}
