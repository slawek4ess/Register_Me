package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.model.User;
import pl.coderslab.repository.UserRepository;

import javax.validation.Valid;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserRepository userRepository;

    @GetMapping("/add")
    public String addUser(Model model){
        model.addAttribute("user", new User());
        return "user/add";
    }

    @PostMapping("/add")
    public String addUser(@Valid User user, BindingResult result){
        if (result.hasErrors()){
            return "user/add";
        } else {
            userRepository.save(user);
            return "redirect:/user/all";
        }
    }

    @GetMapping("/all")
    public String allUsers(Model model){
        model.addAttribute("users", userRepository.findAll());
        return "user/all";
    }

    @RequestMapping("/edit/{id}")
    public String edit(@PathVariable int id, Model model) {
        model.addAttribute("user", userRepository.findOne(id));
        return "user/edit";
    }

    @PostMapping("/edit")
    public String edit(@Valid User user, BindingResult result){
        if (result.hasErrors()){
            return "user/edit";
        } else {
            userRepository.save(user);
            return "redirect:/user/all";
        }
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable int id) {
        userRepository.delete(id);
        return "redirect:/user/all";
    }

/*
    @GetMapping("/{id}/tweets")
    public String allTweetsByUser(@PathVariable long id, Model model){
        model.addAttribute("tweets", tweetRepository.getTweetsByUserId(id));
        return "tweet/all";
    }

    @GetMapping("/search-tweets")
    public String searchTweets(Model model){
        model.addAttribute("tweets", tweetRepository.getTweetsByTitleStartingWith("blab"));
        return "tweet/all";
    }                           */
}
