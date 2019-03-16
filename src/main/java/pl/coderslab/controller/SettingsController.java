package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.model.Weekday;
import pl.coderslab.repository.WeekdayRepository;

import javax.validation.Valid;

@Controller
@RequestMapping("/settings")
public class SettingsController {

    @Autowired
    private WeekdayRepository weekdayRepository;


    @GetMapping("/all")
    public String allWeekdays(Model model){
        model.addAttribute("weekdays", weekdayRepository.findAll());
        return "settings/all";
    }

    @GetMapping("/add")
    public String addWeekday(Model model){
        model.addAttribute("weekday", new Weekday());
        return "settings/add";
    }
    @PostMapping("/add")
    public String addWeekday(@Valid Weekday weekday, BindingResult result){
        if (result.hasErrors()){
            return "settings/add";
        } else {
            weekdayRepository.save(weekday);
            return "redirect:/settings/all";
        }
    }

    @PostMapping("/edit")
    public String edit(@Valid Weekday weekday, BindingResult result){
        if (result.hasErrors()){
            return "settings/edit";
        } else {
            weekdayRepository.save(weekday);
            return "redirect:/settings/all";
        }
    }

    @RequestMapping("/edit/{id}")
    public String edit(@PathVariable int id, Model model) {
        model.addAttribute("weekday", weekdayRepository.findOne(id));
        return "settings/edit";
    }
    @PostMapping("/edit/{id:[0-9]+}")
    public String edit(@Valid Weekday weekday, BindingResult result, @PathVariable int id) {
        if (result.hasErrors()) {
            return "/settings/edit/" + id;
        }
        weekdayRepository.save(weekday);
        return "redirect:/admin/settings/all";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable int id) {
        weekdayRepository.delete(id);
        return "redirect:/settings/all";
    }

}
