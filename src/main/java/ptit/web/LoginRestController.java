// package ptit.web;

// import javax.validation.Valid;

// import org.springframework.security.core.Authentication;
// import org.springframework.security.core.context.SecurityContextHolder;
// import org.springframework.beans.factory.annotation.Autowired;
// import org.springframework.security.authentication.AuthenticationManager;
// import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
// import org.springframework.web.bind.annotation.GetMapping;
// import org.springframework.web.bind.annotation.PostMapping;
// import org.springframework.web.bind.annotation.RequestBody;
// import org.springframework.web.bind.annotation.RequestMapping;
// import org.springframework.web.bind.annotation.RestController;

// import ptit.LoginForm;
// import ptit.JWT.JwtTokenProvider;
// import ptit.User.CustomUserDetails;
// import ptit.payload.LoginResponse;
// import ptit.payload.RandomStuff;

// @RestController
// @RequestMapping("/api")
// public class LoginRestController {
//     @Autowired
//     AuthenticationManager authenticationManager;
//     @Autowired
//     private JwtTokenProvider tokenProvider;

//     @PostMapping("/login")
//     public LoginResponse authenticationUser(@Valid @RequestBody LoginForm loginForm){
//         Authentication authentication = authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(loginForm.getUsername(),loginForm.getPassword()));
//         System.out.println(loginForm.getUsername());
//         System.out.println(loginForm.getPassword());
//         SecurityContextHolder.getContext().setAuthentication(authentication);
//         String jwt = tokenProvider.generateToken((CustomUserDetails) authentication.getPrincipal());

//         return new LoginResponse(jwt);
//     }

//     @GetMapping("/random")
//     public RandomStuff randomStuff(){
//         return new RandomStuff("JWT hợp lệ");
//     }
// }
