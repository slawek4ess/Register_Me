package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.model.DayVisithour;
import pl.coderslab.model.EmpTemplate;
import pl.coderslab.model.Employee;
import pl.coderslab.model.Weekday;
import pl.coderslab.repository.DayVisithourRepository;
import pl.coderslab.repository.EmpTemplateRepository;
import pl.coderslab.repository.EmployeeRepository;
import pl.coderslab.repository.WeekdayRepository;

import javax.validation.Valid;
import java.time.LocalTime;
import java.util.List;

@Controller
@RequestMapping("/workhrs")
public class EmpTemplateController {
    @Autowired
    private EmpTemplateRepository empTemplRepository;
    @Autowired
    private EmployeeRepository employeeRepository;
    @Autowired
    private WeekdayRepository weekdayRepository;
    @Autowired
    private DayVisithourRepository dayhourRepository;

    @ModelAttribute("employees")
    public List<Employee> employees(){
        return employeeRepository.findAll();     }

        @ModelAttribute("weekdays")
    public List<Weekday> weekdays(){
        return weekdayRepository.findAll();     }

    @ModelAttribute("visithours")
    public List<DayVisithour> visithours(){
        return dayhourRepository.findAll();     }


    @GetMapping("/all")
    public String all(Model model){
        model.addAttribute("workHrss", empTemplRepository.findAll());
        return "workhrs/all";
    }


    @GetMapping("/add")
    public String add(Model model){
        model.addAttribute("empTemplate", new EmpTemplate());
        return "workhrs/add";
    }

    @PostMapping("/add")
    public String add(@Valid EmpTemplate empTemplate, BindingResult result){
        if (result.hasErrors()){
            return "workhrs/add";
        } else {
            LocalTime start = empTemplate.getStartTimeObj().getStartTime();
            LocalTime end = empTemplate.getEndTimeObj().getEndTime();
            empTemplate.setStartTime(start);
            empTemplate.setEndTime(end);

            empTemplRepository.save(empTemplate);
            return "redirect:/workhrs/all";
        }
    }

    @RequestMapping("/edit/{id}")
    public String edit(@PathVariable int id, Model model) {
        model.addAttribute("empTemplate", empTemplRepository.findOne(id));
        return "workhrs/edit";
    }

    @PostMapping("/edit")
    public String edit(@Valid EmpTemplate empTemplate, BindingResult result){
        if (result.hasErrors()){
            return "workhrs/edit";
        } else {
            empTemplRepository.save(empTemplate);
            return "redirect:/workhrs/all";
        }
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable int id) {
        empTemplRepository.delete(id);
        return "redirect:/workhrs/all";
    }
}