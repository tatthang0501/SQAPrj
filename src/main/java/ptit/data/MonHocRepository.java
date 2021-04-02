package ptit.data;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import ptit.MonHoc;

public interface MonHocRepository extends CrudRepository<MonHoc, Integer>{
    @Query(value = "SELECT * FROM monhoc WHERE bomonid = ?1",nativeQuery = true)
    List<MonHoc> getListMHByBoMonID(int bmId);
}