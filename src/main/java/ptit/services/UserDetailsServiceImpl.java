package ptit.services;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import ptit.ThanhVien;
import ptit.data.ThanhVienRepository;

public class UserDetailsServiceImpl implements UserDetailsService{
    @Autowired
    ThanhVienRepository thanhVienRepo;

    @Override
    @Transactional
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        ThanhVien user = thanhVienRepo.findByUsername(username).orElseThrow(() -> new UsernameNotFoundException("Khong tim thay username: " + username));
        return UserDetailsImpl.build(user);
    }
    
}
