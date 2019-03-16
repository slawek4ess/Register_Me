package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.model.DayVisithour;
import pl.coderslab.model.Weekday;
import pl.coderslab.repository.DayVisithourRepository;
import pl.coderslab.repository.WeekdayRepository;

import javax.validation.Valid;
import java.time.LocalTime;
import java.util.List;

@Controller
@RequestMapping("/settings")
public class SettingsController {

    @Autowired
    private WeekdayRepository weekdayRepository;

    @Autowired
    private DayVisithourRepository dayhourRepository;

/*
    @ModelAttribute("visithours")
    public List<DayVisithour> visithours(){
        return dayhourRepository.findAll();     }
*/


    //----------------------------------------------------------
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


    @GetMapping("/hours")
    public String allDayhours(Model model){
        model.addAttribute("dayhours", dayhourRepository.findAll());
        return "settings/hours";
    }

    @GetMapping("/addhour")
    public String addDayhour(Model model){

        List<DayVisithour> hoursLst = dayhourRepository.findAll();

        LocalTime lastEndTime = hoursLst.get(0).getEndTime();
        for (DayVisithour thehour: hoursLst
             ) { if (thehour.getEndTime().compareTo(lastEndTime)>0) {
                    lastEndTime = thehour.getEndTime();
                 }
        }

        DayVisithour newItem = new DayVisithour();
        newItem.setStartTime(lastEndTime);

        model.addAttribute("dayhour", newItem);
        return "settings/addhour";
    }
    @PostMapping("/addhour")
    public String addDayhour(@Valid DayVisithour dayhour, BindingResult result){
        if (result.hasErrors()){
            return "settings/add";
        } else {
            dayhourRepository.save(dayhour);
            return "redirect:/settings/hours";
        }
    }

    @GetMapping("/deletehour/{id}")
    public String deleteHour(@PathVariable int id) {
        dayhourRepository.delete(id);
        return "redirect:/settings/hours";
    }
    
}
