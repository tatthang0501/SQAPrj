package ptit.classregister.testController;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.web.servlet.MockMvc;
import static org.hamcrest.Matchers.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;

import ptit.common.JwtUtils;
import ptit.data.LichHocRepository;

//Test request tới url localhost:8080/xemtkb xem thời khóa biểu
//Nguyễn Tất Thắng

@SpringBootTest
@AutoConfigureMockMvc
public class TestGetSchedule {
    @Autowired
    MockMvc mockMvc;
    @Autowired
    LichHocRepository lhRepo;
    //Test lấy thời khóa biểu thành công, người dùng đã đăng kí ít nhất một lớp học phần
    @Test
    public void testGetScheduleSuccessful() throws Exception{
        //Sử dụng token của user có ID là 1
        String token = JwtUtils.createToken(1,"thang", "123456", "thang123@gmail.com");
        assertNotNull(token);
        mockMvc.perform(MockMvcRequestBuilders.get("/xemtkb")
        .header("Authorization", "Bearer " + token))
        .andExpect(status().isOk()).andExpect(jsonPath("$", hasSize(2)))
        //Dữ liệu trả về có số phần tử là 2
        .andExpect(jsonPath("$[0].ten", is("Nhập môn công nghệ phần mềm")));
        // Lớp học phần thứ nhất trả về có tên "Nhập môn công nghệ phần mềm"
    }

    //Test lấy thời khóa biểu khi người dùng chưa đăng ký lớp học phần nào
    @Test
    public void testGetScheduleUnsuccessful() throws Exception{
        // Xóa hết các đăng ký của tài khoản sử dụng để test
        lhRepo.xoaHetDangKy(1);
        //Sử dụng token của user có ID là 1
        String token = JwtUtils.createToken(1,"thang", "123456", "thang123@gmail.com");
        assertNotNull(token);
        mockMvc.perform(MockMvcRequestBuilders.get("/xemtkb")
        .header("Authorization", "Bearer " + token))
        .andExpect(status().isNotFound()).andExpect(content()
        .string(containsString("khÃ´ng thá» xem thá»i khÃ³a biá»u")));

        // Test thành công, font chữ lỗi: "không thể xem thời khóa biểu"
    }
}
