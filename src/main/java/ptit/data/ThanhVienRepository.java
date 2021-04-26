package ptit.data;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import ptit.ThanhVien;

public interface ThanhVienRepository extends JpaRepository<ThanhVien,Integer>{
    
    @Query(value="select * from thanhvien where thanhvien.username = ?1 AND thanhvien.password = ?2 ", nativeQuery = true)
    public List<ThanhVien> checkLogin(String username, String password);

    Optional <ThanhVien> findByUsername(String username);
    
    Boolean existsByUsername(String username);

    Boolean existsByEmail(String email);
}
