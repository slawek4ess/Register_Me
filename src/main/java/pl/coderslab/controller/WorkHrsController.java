package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.model.EmpWorkHour;
import pl.coderslab.model.Employee;
import pl.coderslab.model.Weekday;
import pl.coderslab.repository.EmpWorkHourRepository;
import pl.coderslab.repository.EmployeeRepository;
import pl.coderslab.repository.WeekdayRepository;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/workhrs")
public class WorkHrsController {
    @Autowired
    private EmpWorkHourRepository workHourRepository;
    @Autowired
    private EmployeeRepository employeeRepository;
    @Autowired
    private WeekdayRepository weekdayRepository;

    @ModelAttribute("employees")
    public List<Employee> employees(){
        return employeeRepository.findAll();     }
    @ModelAttribute("weekdays")
    public List<Weekday> weekdays(){
        return weekdayRepository.findAll();     }


    @GetMapping("/all")
    public String all(Model model){
        model.addAttribute("workHrss", workHourRepository.findAll());
        return "workhrs/all";
    }


    @GetMapping("/add")
    public String add(Model model){
        model.addAttribute("workHour", new EmpWorkHour());
        return "workhrs/add";
    }

    @PostMapping("/add")
    public String add(@Valid EmpWorkHour workHour, BindingResult result){
        if (result.hasErrors()){
            return "workhrs/add";
        } else {
            workHourRepository.save(workHour);
            return "redirect:/workhrs/all";
        }
    }


    @RequestMapping("/edit/{id}")
    public String edit(@PathVariable Long id, Model model) {
        model.addAttribute("workHour", workHourRepository.findOne(id));
        return "workhrs/edit";
    }

    @PostMapping("/edit")
    public String edit(@Valid EmpWorkHour empWorkHrs, BindingResult result){
        if (result.hasErrors()){
            return "workhrs/edit";
        } else {
            workHourRepository.save(empWorkHrs);
            return "redirect:/workhrs/all";
        }
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable long id) {
        workHourRepository.delete(id);
        return "redirect:/workhrs/all";
    }
}
