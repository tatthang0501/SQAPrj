package ptit.web;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import ptit.data.ThanhVienRepository;
import ptit.models.ThanhVien;

public class MainFunction {

    public static ThanhVien getInstanceUser(ThanhVienRepository userRepository) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String currentPrincipalName = authentication.getName();
        if (currentPrincipalName != null) {
            ThanhVien tv = userRepository.findByUsername(currentPrincipalName).get();
            return tv;
        }
        return null;
    }
}
