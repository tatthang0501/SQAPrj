// package ptit.web;

// import javax.servlet.http.HttpServletRequest;
// import javax.servlet.http.HttpServletResponse;
// import javax.servlet.http.HttpSession;

// import org.springframework.http.HttpStatus;
// import org.springframework.http.ResponseEntity;
// import org.springframework.ui.Model;
// import org.springframework.web.bind.annotation.CrossOrigin;
// import org.springframework.web.bind.annotation.GetMapping;
// import org.springframework.web.bind.annotation.RequestMapping;
// import org.springframework.web.bind.annotation.RestController;

// @RestController
// @CrossOrigin("*")
// @RequestMapping("/logout")
// public class LogOut {
//     @GetMapping
//     private ResponseEntity<?> logOut(HttpServletRequest request, Model model, HttpServletResponse response) {
//         HttpSession session = request.getSession();
//         session.removeAttribute("giangvien");
//         session.removeAttribute("listDaDK");
//         return new ResponseEntity<>("OK", HttpStatus.OK);
//     }
// }
