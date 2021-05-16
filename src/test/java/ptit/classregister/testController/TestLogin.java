package ptit.classregister.testController;

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

//Test request đăng nhập 
//Nguyễn Tất Thắng

@SpringBootTest()
@AutoConfigureMockMvc
public class TestLogin {

    @Autowired(required = true)
    private MockMvc mockMvc;
    @Autowired
    private ObjectMapper objectMapper;

    //Test trường hợp đăng nhập thành công
    @Test
    public void testLoginSuccessful() throws JsonProcessingException, Exception {
        LoginForm test = new LoginForm();
        test.setUsername("thang");
        test.setPassword("123456");
        mockMvc.perform(post("http://localhost:8080/login", 42L)
        .contentType("application/json")
        .content(objectMapper.writeValueAsString(test)))
        .andExpect(status().isOk()).andExpect(content().string(containsString("accessToken")));
    }

    //Test trường hợp đăng nhập không thành công
    @Test
    public void testLoginUnsuccessful() throws JsonProcessingException, Exception{
        LoginForm test = new LoginForm();
        test.setUsername("thang");
        test.setPassword("1234567");
        mockMvc.perform(post("http://localhost:8080/login", 42L)
        .contentType("application/json")
        .content(objectMapper.writeValueAsString(test)))
        .andExpect(status().isUnauthorized());
    }
}
