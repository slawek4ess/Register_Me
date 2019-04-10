package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import pl.coderslab.model.User;
import pl.coderslab.service.UserService;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
@RequestMapping(path = "/user", produces = "text/html; charset=UTF-8")
@SessionAttributes({"deleteError", "passwordChanged", "loggedUserType", "passwordError", "error", "emailError"})
public class UserController {
    @Autowired
    private UserService userService;

    //add
    //*****************************************************************************
    @GetMapping("/add")
    public String add(Model model) {
        model.addAttribute("user", new User());
        return "user/add";
    }

    @PostMapping(path = "/add")
    public String add(@Valid User user, BindingResult result, Model model) {
        if (result.hasErrors()) {
            return "user/add";
        }
        //verify whether Email already exists in DB
        model.addAttribute("emailError", false);
        if(userService.findUserByEmail(user.getEmail())!=null) {
            model.addAttribute("emailError", true);
            return "user/add";
        }
        //user.setPassword(userService.encryptPassword(user.getEmail()));
        userService.save(user);
        return "redirect:/user/all";
    }

    //edit
    //*****************************************************************************
    @GetMapping(path = "/edit/{id}")
    public String edit(Model model, @PathVariable Integer id) {
        model.addAttribute("user", userService.findOne(id));
        return "user/edit";
    }

    @PostMapping(path = "/edit/{id}")
    public String save(@Valid User user, BindingResult result, Model model) {
        if (result.hasErrors()) {
            return "user/edit";
        }
        userService.save(user);
        return "redirect:/user/all";
    }

    //editMe
    //*****************************************************************************
    @GetMapping(path = "/editme/{id}")
    public String editme(Model model, @PathVariable Integer id) {
        model.addAttribute("user", userService.findOne(id));
        return "user/editme";
    }

    @PostMapping(path = "/editme/{id}")
    public String saveMe(@Valid User user, BindingResult result, Model model) {
        if (result.hasErrors()) {
            return "user/editme";
        }
        userService.save(user);
        return "redirect:/";
    }

    //delete
    //*****************************************************************************
    @RequestMapping("/delete/{id}")
    public String delete(@PathVariable Integer id, Model model) {
        if (/*userService.noContractsWithInsuredId(id) && userService.noContractsWithBeneficiaryId(id)
                &&!userService.findOne(id).getEmail().equals("admin")
                && !userService.findOne(id).getEmail().equals("user")*/ true) {
            userService.delete(id);
            return "redirect:/user/all";
        } else {
            model.addAttribute("deleteError", true);
            model.addAttribute("users", userService.findAll());
            return "redirect:/user/all";
        }
    }

    //all
    //*****************************************************************************
    @RequestMapping("/all")
    public String all(Model model) {
        model.addAttribute("users", userService.findAll());
        return "user/all";
    }

    @RequestMapping("/logout")
    public String logOut(Model model, HttpSession session, SessionStatus status) {
        model.addAttribute("loggedUserType", "loggedOut");
        model.addAttribute("error", "3");
        status.setComplete();
        session.invalidate();
        return "redirect:/";
    }



}
