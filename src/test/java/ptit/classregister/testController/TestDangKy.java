package ptit.classregister.testController;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import ptit.common.JwtUtils;

@SpringBootTest
@AutoConfigureMockMvc
public class TestDangKy {
    
    @Autowired(required = true)
    private MockMvc mockMvc;
    // @Autowired
    // private ObjectMapper objectMapper;

    @Test
    public void shouldGenerateAuthToken() throws Exception {
        String token = JwtUtils.createToken("test");
        System.out.print(token);
        assertNotNull(token);
        mockMvc.perform(MockMvcRequestBuilders.get("/dangky").header("Authorization", "Bearer " + token)).andExpect(status().isOk());
    }
}
