package ptit.JWT;

import java.util.Date;

import org.springframework.stereotype.Component;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.MalformedJwtException;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.UnsupportedJwtException;
import lombok.extern.slf4j.Slf4j;
import ptit.User.CustomUserDetails;

@Component
@Slf4j
public class JwtTokenProvider {
    private final String JTW_SECRET = "GODZUU";
    private final long JWT_EXPIRATION = 604800000L;

    public String generateToken(CustomUserDetails userDetails){
        Date now = new Date();
        Date expiryDate = new Date(now.getTime() + JWT_EXPIRATION);
        return Jwts.builder().setSubject(Long.toString(userDetails.getThanhVien().getId())).setIssuedAt(now).setExpiration(expiryDate).signWith(SignatureAlgorithm.HS512, JTW_SECRET).compact();
    }

    public Long getUserIdFromJWT(String token){
        Claims claims = Jwts.parser().setSigningKey(JTW_SECRET).parseClaimsJwt(token).getBody();
        return Long.parseLong(claims.getSubject());
    }

    public boolean validateToken(String authToken){
        try{
            Jwts.parser().setSigningKey(JTW_SECRET).parseClaimsJwt(authToken);
            return true;
        } catch(MalformedJwtException ex){
            log.error("Invalid JWT token",ex);
        }catch(ExpiredJwtException ex){
            log.error("Expired JWT Token",ex);
        }catch(UnsupportedJwtException ex){
            log.error("Unsupported JWT Token",ex);
        }catch(IllegalArgumentException ex){
            log.error("JWT claims string is empty",ex);
        }
        return false;
    }
}
