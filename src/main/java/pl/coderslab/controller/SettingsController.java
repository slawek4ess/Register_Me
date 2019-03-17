package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.model.TimeSlot;
import pl.coderslab.model.Weekday;
import pl.coderslab.repository.TimeSlotRepository;
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
    private TimeSlotRepository timeSlotRepository;

/*
    @ModelAttribute("timeSlotLst")
    public List<TimeSlot> timeSlotLst(){
        return timeSlotRepository.findAll();     }   */


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

// timeSlot/dayHours[oldname] table actions

    @GetMapping("/hours")
    public String allHours(Model model){
        model.addAttribute("timeSlotLst", timeSlotRepository.findAll());
        return "settings/hours";
    }

    @GetMapping("/addhour")
    public String addHour(Model model){

        LocalTime lastEndTime = LocalTime.parse("08:00");   // get startHour from previous end

        List<TimeSlot> hoursLst = timeSlotRepository.findAll();

        if (hoursLst.size()>0) {
            lastEndTime = hoursLst.get(0).getEndTime();
            for (TimeSlot thehour : hoursLst) {
                if (thehour.getEndTime().compareTo(lastEndTime) > 0) {
                    lastEndTime = thehour.getEndTime();
                }
            }
        }
        LocalTime newEndTime = lastEndTime.plusMinutes(30);

        TimeSlot newItem = new TimeSlot();
         newItem.setStartTime(lastEndTime);
         newItem.setEndTime(newEndTime);

        model.addAttribute("timeSlot", newItem);

        return "settings/addhour";
    }
    @PostMapping("/addhour")
    public String addDayhour(@Valid TimeSlot timeSlot, BindingResult result){
        if (result.hasErrors()){
            return "settings/addhour";
        } else {
            LocalTime endTime = (LocalTime) timeSlot.getEndTime();
            timeSlot.setEndTime(endTime);
            timeSlotRepository.save(timeSlot);
            return "redirect:/settings/hours";
        }
    }

    @GetMapping("/deletehour/{id}")
    public String deleteHour(@PathVariable int id) {
        timeSlotRepository.delete(id);
        return "redirect:/settings/hours";
    }
    
}
