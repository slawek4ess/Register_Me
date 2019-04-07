package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.model.User;
import pl.coderslab.service.UserService;
import pl.coderslab.util.BCrypt;


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
            return "redirect:/admin/adminHome";

        }

        if (BCrypt.checkpw(password, userToBeChecked.getPassword())) {

            //if password=email (userService) then force password change

            if((BCrypt.checkpw(email, userToBeChecked.getPassword())
                    && !(email.equals("user")) && !(email.equals("admin")))) {
                model.addAttribute("forcePasswordChange", true);
                model.addAttribute("loggedUserType", "user");
                model.addAttribute("userId", userToBeChecked.getId());
                return "redirect:/password/change";
            }

            model.addAttribute("loggedUserType", "user");
            model.addAttribute("userId", userToBeChecked.getId());
            return "redirect:/employee/view";

        }

        model.addAttribute("error", "1");
        return "home";
    }

}


