package ptit.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import ptit.dto.JwtResponse;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/api/test")
public class TestController {
	@Autowired
	AuthenticationManager authenticationManager;
	@GetMapping("/all")
	public String allAccess() {
		return "Public Content.";
	}
	
	@GetMapping("/user")
	public String userAccess() {
		return "User Content.";
	}

	@GetMapping("/mod")
	public String moderatorAccess() {
		return "Moderator Board.";
	}

	@GetMapping("/admin")
	public String adminAccess() {
		return "Admin Board.";
	}
	@GetMapping("/getuser")
	public ResponseEntity<?> getUserID(HttpServletRequest request){
		HttpSession session = request.getSession();
		JwtResponse jwtResponse = (JwtResponse) session.getAttribute("user");
		return new ResponseEntity<>(jwtResponse,HttpStatus.OK);
	}
}