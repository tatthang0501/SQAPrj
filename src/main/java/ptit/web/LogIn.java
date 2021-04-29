// package ptit.web;

// import java.util.ArrayList;

// import javax.servlet.http.HttpServletRequest;
// import javax.servlet.http.HttpSession;
// import org.springframework.beans.factory.annotation.Autowired;
// import org.springframework.http.HttpStatus;
// import org.springframework.http.ResponseEntity;
// import org.springframework.ui.Model;
// import org.springframework.web.bind.annotation.CrossOrigin;
// import org.springframework.web.bind.annotation.PostMapping;
// import org.springframework.web.bind.annotation.RequestBody;
// import org.springframework.web.bind.annotation.RequestMapping;
// // import org.springframework.web.bind.annotation.RequestParam;
// import org.springframework.web.bind.annotation.RestController;

// import ptit.controllers.ThanhVien;
// import ptit.controllers.UserRepository;
// import ptit.dto.LoginForm;

// @RestController
// @CrossOrigin("*")
// @RequestMapping("/login")
// public class LogIn {
//     @Autowired
//     private final UserRepository tvRepo;

//     LogIn(UserRepository tvRepo) {
//         this.tvRepo = tvRepo;
//     }

//     @PostMapping(produces = "application/json")
//     public ResponseEntity<?> checkLogin(@RequestBody LoginForm loginForm, HttpServletRequest request, Model model) {
//         ArrayList<ThanhVien> listFound = (ArrayList<ThanhVien>) tvRepo.checkLogin(loginForm.getUsername(), loginForm.getPassword());
//         System.out.println(loginForm.getUsername());
//         System.out.println(loginForm.getPassword());
//         if (listFound.size() == 1) {
//             ThanhVien tv = listFound.get(0);
//                 if (tv.getVitri().equals("giangvien")) {
//                     HttpSession session = request.getSession();
//                     session.setAttribute("giangvien", tv);
//                     String msg = "Đăng nhập thành công";
//                     model.addAttribute("msg", msg);
//                     return new ResponseEntity<>("ok", HttpStatus.OK);
//                 }
//                 else{
//                     String msg = "Không phải giảng viên";
//                     model.addAttribute("msg", msg);
//                     return new ResponseEntity<>("Không phải giảng viên", HttpStatus.NOT_ACCEPTABLE);
//                 }
//             } else {
//             String msg = "Tên đăng nhập hoặc mật khẩu không đúng";
//             model.addAttribute("msg", msg);
//             return new ResponseEntity<>("fail", HttpStatus.NOT_ACCEPTABLE);
//         }
//     }
// }
