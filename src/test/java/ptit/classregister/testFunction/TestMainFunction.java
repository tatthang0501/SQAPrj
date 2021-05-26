package ptit.classregister.testFunction;

import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertNull;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.web.servlet.MockMvc;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.web.servlet.MockMvc;
import static org.hamcrest.Matchers.containsString;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import ptit.dto.LoginForm;
import ptit.data.ThanhVienRepository;
import ptit.models.ThanhVien;
import ptit.web.MainFunction;

//Test các chức năng của lớp MainFunction
//Nguyễn Tất Thắng
@SpringBootTest
@AutoConfigureMockMvc
public class TestMainFunction {
    
    @Autowired
    ThanhVienRepository userRepo;

    @Autowired(required = true)
    private MockMvc mockMvc;
    @Autowired
    private ObjectMapper objectMapper;
    // Test phương thức getInstanceUser
    // Test trường hợp giảng viên đã đăng nhập vào hệ thống
    @Test
    public void testLoggedIn() throws JsonProcessingException, Exception{
        LoginForm test = new LoginForm();
        test.setUsername("thang");
        test.setPassword("123456");
        mockMvc.perform(post("http://localhost:8080/login", 42L)
        .contentType("application/json")
        .content(objectMapper.writeValueAsString(test)))
        .andExpect(status().isOk()).andExpect(content().string(containsString("accessToken")));
        ThanhVien tv = MainFunction.getInstanceUser(userRepo);
        assertNotNull(tv);
    }

    // Test phương thức getInstanceUser
    // Test trường hợp giảng viên chưa đăng nhập vào hệ thống
    @Test
    public void testNotLoggedIn() throws JsonProcessingException, Exception{
        ThanhVien tv = MainFunction.getInstanceUser(userRepo);
        assertNotNull(tv);
    }
    
}
