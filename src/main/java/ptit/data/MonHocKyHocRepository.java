package ptit.data;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import ptit.MonHocKyHoc;

public interface MonHocKyHocRepository extends CrudRepository<MonHocKyHoc, Integer>{
    @Query(value="SELECT * from monhockyhoc WHERE kyhocid = ?1", nativeQuery = true)
    List<MonHocKyHoc> getListMHKH(int kyhocID);
}
