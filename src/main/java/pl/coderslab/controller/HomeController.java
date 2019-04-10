package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.model.User;
import pl.coderslab.service.UserService;
import pl.coderslab.util.BCrypt;

import javax.validation.Valid;


@Controller
@RequestMapping(path = "/", produces = "text/html; charset=UTF-8")
@SessionAttributes({"loggedUserType", "error", "userId", "forcePasswordChange"})
public class HomeController {
    @Autowired
    private UserService userService;

    @GetMapping("/")
    public String getPass() {
        return "home";
    }

    @PostMapping("/")
    public String checkPass(@RequestParam String email, @RequestParam String password, Model model) {
        model.addAttribute("error", "0");

        User userToBeChecked = userService.findUserByEmail(email);
        if(userToBeChecked==null) {
            model.addAttribute("error", "1");
            return "home";
        }

        if (BCrypt.checkpw(password, userToBeChecked.getPassword()) && userToBeChecked.isAdmin()) {

            model.addAttribute("loggedUserType", "admin");
            model.addAttribute("userId", userToBeChecked.getId());
            return "redirect:/admin/home";
        }
                //  User *********************************************
        if (BCrypt.checkpw(password, userToBeChecked.getPassword())) {

            if((BCrypt.checkpw(email, userToBeChecked.getPassword())
/*                    && !(email.equals("user")) && !(email.equals("admin"))*/)) {
//                model.addAttribute("forcePasswordChange", true);
                model.addAttribute("loggedUserType", "user");
                model.addAttribute("userId", userToBeChecked.getId());
                return "redirect:/user/editme/{userId}";
            }

            model.addAttribute("loggedUserType", "user");
            model.addAttribute("userId", userToBeChecked.getId());
            return "redirect:/";

        }
        model.addAttribute("error", "1");
        return "home";
    }

    // newuser ********************************************************************
    @GetMapping("/user/newuser")
    public String addNewUser(Model model) {
        model.addAttribute("user", new User());
        return "user/newuser";
    }

    @PostMapping(path = "/user/newuser")
    public String addNewUser(@Valid User user, BindingResult result, Model model) {
        if (result.hasErrors()) {
            return "user/newuser";
        }
        //verify whether Email already exists in DB
        model.addAttribute("emailError", false);
        if(userService.findUserByEmail(user.getEmail())!=null) {
            model.addAttribute("emailError", true);
            return "user/newuser";
        }
        //user.setPassword(userService.encryptPassword(user.getEmail()));
        //******** uruchomienie
        user.setAdmin(true);
        userService.save(user);
        return "redirect:/";
    }
}