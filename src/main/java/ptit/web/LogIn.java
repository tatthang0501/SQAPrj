package ptit.web;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import ptit.ThanhVien;
import ptit.data.ThanhVienRepository;

@RestController
@CrossOrigin("*")
@RequestMapping("/login")
public class LogIn {
    @Autowired
    private final ThanhVienRepository tvRepo;

    LogIn(ThanhVienRepository tvRepo) {
        this.tvRepo = tvRepo;
    }

    @PostMapping(produces = "application/json")
    public ResponseEntity<?> checkLogin(@RequestParam String username, @RequestParam String password,
            HttpServletRequest request, Model model) {
        ArrayList<ThanhVien> listFound = (ArrayList<ThanhVien>) tvRepo.checkLogin(username, password);
        if (listFound.size() == 1) {
            ThanhVien tv = listFound.get(0);
                if (tv.getVitri().equals("giangvien")) {
                    HttpSession session = request.getSession();
                    session.setAttribute("giangvien", tv);
                    String msg = "Đăng nhập thành công";
                    model.addAttribute("msg", msg);
                    System.out.println(tv.getUsername());
                    System.out.println(tv.getPassword());
                    System.out.println("ok");
                    return new ResponseEntity<>("ok", HttpStatus.OK);
                }
                else{
                    String msg = "Không phải giảng viên";
                    model.addAttribute("msg", msg);
                    return new ResponseEntity<>("ok", HttpStatus.NOT_ACCEPTABLE);
                }
            } else {
            String msg = "Tên đăng nhập hoặc mật khẩu không đúng";
            model.addAttribute("msg", msg);
            return new ResponseEntity<>("fail", HttpStatus.NOT_ACCEPTABLE);
        }
    }
}