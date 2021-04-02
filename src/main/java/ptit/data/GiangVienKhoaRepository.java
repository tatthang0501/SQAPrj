package ptit.data;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import ptit.GiangVienKhoa;

public interface GiangVienKhoaRepository extends CrudRepository<GiangVienKhoa, Integer>{
    // @Query(value = "SELECT * FROM giangvienkhoa WHERE giangvienid = ?1",nativeQuery = true)
    // List<GiangVienKhoa> getGVK(int gvId);
}
