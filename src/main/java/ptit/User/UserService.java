package ptit.User;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import ptit.ThanhVien;
import ptit.data.ThanhVienRepository;

@Service
public class UserService implements UserDetailsService{
    @Autowired
    private ThanhVienRepository thanhVienRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        ThanhVien thanhVien = thanhVienRepository.findByUsername(username);
        if(thanhVien==null){
            throw new UsernameNotFoundException(username);
        }
        return new CustomUserDetails(thanhVien);
    }

    @Transactional
    public UserDetails loadUserById(Long id) {
        ThanhVien thanhVien = thanhVienRepository.findById(Integer.parseInt(id.toString(id))).orElseThrow(
            () -> new UsernameNotFoundException("User not found with id : " + id)
        );

        return new CustomUserDetails(thanhVien);
    }
}
