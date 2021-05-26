package ptit.common;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Component;

import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.MalformedJwtException;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.SignatureException;
import io.jsonwebtoken.UnsupportedJwtException;
import ptit.services.UserDetailsImpl;

@Component
public class JwtUtils {
    private static final Logger logger = LoggerFactory.getLogger(JwtUtils.class);

    private static String jwtSecret = "godzuu";
    private static int jwtExpirationMs = 9000000;

    public String generateJwtToken(Authentication authentication){
        UserDetailsImpl userPrincipal = (UserDetailsImpl) authentication.getPrincipal();
        return Jwts.builder().setSubject((userPrincipal.getUsername())).setIssuedAt(new Date()).setExpiration(new Date(new Date().getTime() + jwtExpirationMs)).signWith(SignatureAlgorithm.HS512, jwtSecret).compact();

    }
    public String getUsernameFromJwtToken(String token){
        return Jwts.parser().setSigningKey(jwtSecret).parseClaimsJws(token).getBody().getSubject();
    }
    public boolean validateJwtToken(String authToken){
        try{
            Jwts.parser().setSigningKey(jwtSecret).parseClaimsJws(authToken);
            return true;
        }
        catch(SignatureException e){
            logger.error("Invalid JWT signature: {}", e.getMessage());
        }
        catch(MalformedJwtException e){
            logger.error("Invalid JWT token: {}", e.getMessage());
        }
        catch(ExpiredJwtException e){
            logger.error("JWT Token is expired", e.getMessage());
        }
        catch(UnsupportedJwtException e){
            logger.error("JWT Token is unsupported", e.getMessage());
        }
        catch(IllegalArgumentException e){
            logger.error("JWT claims string is empty", e.getMessage());
        }
        return false;
    }

    public static String createToken(int id, String username, String password, String email) {
        UserDetailsImpl userPrincipal = new UserDetailsImpl(id, username, password, email);
        return Jwts.builder().setSubject((userPrincipal.getUsername())).setIssuedAt(new Date()).setExpiration(new Date(new Date().getTime() + jwtExpirationMs)).signWith(SignatureAlgorithm.HS512, jwtSecret).compact();
    }
}
