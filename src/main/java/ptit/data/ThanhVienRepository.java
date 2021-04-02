package ptit.data;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import ptit.ThanhVien;

public interface ThanhVienRepository extends CrudRepository<ThanhVien,Integer>{
    
    @Query(value="select * from thanhvien where thanhvien.username = ?1 AND thanhvien.password = ?2 ", nativeQuery = true)
    public List<ThanhVien> checkLogin(String username, String password);
}