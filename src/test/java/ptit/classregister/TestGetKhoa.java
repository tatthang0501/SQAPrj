package ptit.classregister;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import ptit.data.KhoaRepository;

@SpringBootTest
public class TestGetKhoa {
    @Autowired
    KhoaRepository kRepo;

    @Test
    public void testGetAllKhoa(){
        
    }
}
