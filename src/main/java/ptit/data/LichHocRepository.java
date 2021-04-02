package ptit.data;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import ptit.LichHoc;

public interface LichHocRepository extends CrudRepository<LichHoc, Integer> {
    @Query(value = "SELECT * FROM lichhoc WHERE lhpid = ?1", nativeQuery = true)
    List<LichHoc> findLichLHP(int khpId);

    @Modifying
    @Transactional
    @Query(value = "UPDATE lichhoc SET giangvienid = ?1 WHERE id = ?2", nativeQuery = true)
    boolean updateDangKy(int gvId, int id);
}
