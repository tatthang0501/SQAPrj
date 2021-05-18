package ptit.classregister.testController;

import com.fasterxml.jackson.databind.ObjectMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.web.servlet.MockMvc;

//Test request tới URL localhost:8080/updatedangky lưu danh sách đăng ký
@SpringBootTest
@AutoConfigureMockMvc
public class TestUpdateCourse {
    
    @Autowired(required = true)
    private MockMvc mockMvc;
    @Autowired
    private ObjectMapper objectMapper;
    

}
