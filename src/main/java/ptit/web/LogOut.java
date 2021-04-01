package ptit.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@CrossOrigin("*")
@RequestMapping("/logout")
public class LogOut {
    @GetMapping
    private String logOut(HttpServletRequest request, Model model){
        HttpSession session = request.getSession();
        session.removeAttribute("giangvien");
        return "redirect:/";
    }
}
