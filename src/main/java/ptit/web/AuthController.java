package ptit.web;

import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import ptit.ThanhVien;
import ptit.common.JwtUtils;
import ptit.data.UserRepository;
import ptit.dto.JwtResponse;
import ptit.dto.LoginForm;
import ptit.dto.MessageResponse;
import ptit.dto.SignupRequest;
import ptit.services.UserDetailsImpl;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/login")
public class AuthController {
	@Autowired
	AuthenticationManager authenticationManager;

	@Autowired
	UserRepository userRepository;

	@Autowired
	PasswordEncoder encoder;

	@Autowired
	JwtUtils jwtUtils;

	@PostMapping()
	public ResponseEntity<?> authenticateUser(@Valid @RequestBody LoginForm loginRequest, HttpServletRequest request) {

		Authentication authentication = authenticationManager.authenticate(
				new UsernamePasswordAuthenticationToken(loginRequest.getUsername(), loginRequest.getPassword()));

		SecurityContextHolder.getContext().setAuthentication(authentication);
		String jwt = jwtUtils.generateJwtToken(authentication);
		
		UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();
		
		JwtResponse jwtResponse = new JwtResponse(jwt, userDetails.getId(), userDetails.getUsername(), userDetails.getEmail());
		HttpSession session = request.getSession();
		session.setAttribute("user", jwtResponse);
		System.out.println("Da dang nhap");
		return ResponseEntity.ok(jwtResponse);
	}
	
	@PostMapping("/signup")
	public ResponseEntity<?> registerUser(@Valid @RequestBody SignupRequest signUpRequest) {
		if (userRepository.existsByUsername(signUpRequest.getUsername())) {
			return ResponseEntity.badRequest().body(new MessageResponse("Error: Username is already taken!"));
		}

		if (userRepository.existsByEmail(signUpRequest.getEmail())) {
			return ResponseEntity.badRequest().body(new MessageResponse("Error: Email is already in use!"));
		}

		// Create new user's account
		ThanhVien user = new ThanhVien(signUpRequest.getUsername(), signUpRequest.getEmail(),
				encoder.encode(signUpRequest.getPassword()));
		user.setDem("thang");
		user.setDt("0337971060");
		user.setHo("thang");
		user.setTen("thang");
		user.setNgaySinh("19990501");
		user.setGhichu("ghichu");
		user.setVitri("giangvien");
		user.setDiaChi(null);

		// Set<String> strRoles = signUpRequest.getRole();
		// Set<Role> roles = new HashSet<>();

		// if (strRoles == null) {
		// Role userRole = roleRepository.findByName(ERole.ROLE_USER)
		// .orElseThrow(() -> new RuntimeException("Error: Role is not found."));
		// roles.add(userRole);
		// } else {
		// strRoles.forEach(role -> {
		// switch (role) {
		// case "admin":
		// Role adminRole = roleRepository.findByName(ERole.ROLE_ADMIN)
		// .orElseThrow(() -> new RuntimeException("Error: Role is not found."));
		// roles.add(adminRole);

		// break;
		// case "mod":
		// Role modRole = roleRepository.findByName(ERole.ROLE_MODERATOR)
		// .orElseThrow(() -> new RuntimeException("Error: Role is not found."));
		// roles.add(modRole);

		// break;
		// default:
		// Role userRole = roleRepository.findByName(ERole.ROLE_USER)
		// .orElseThrow(() -> new RuntimeException("Error: Role is not found."));
		// roles.add(userRole);
		// }
		// });
		// }

		// user.setRoles(roles);
		userRepository.save(user);

		return ResponseEntity.ok(new MessageResponse("User registered successfully!"));
	}
}
