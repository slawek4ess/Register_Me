package pl.coderslab.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.coderslab.model.User;
import pl.coderslab.repository.UserRepository;
import pl.coderslab.util.BCrypt;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class UserService {
    @Autowired
    private UserRepository userRepository;


    public void save(User user) {
        userRepository.save(user);
    }

    public void delete(Integer id) {
        userRepository.delete(id);
    }

    public User findOne(Integer id) {
        return userRepository.findOne(id);
    }

    public User findUserByEmail(String email) {
        return userRepository.findUserByEmail(email);
    }
    
    public List<User> findAll() {

        return userRepository.findAll();
    }

    public List<User> findAllAdmins() {
        return userRepository.findUserByAdminIsTrue();
    }

    public String encryptPassword(String password) {
        return BCrypt.hashpw(password, BCrypt.gensalt());
    }

}
