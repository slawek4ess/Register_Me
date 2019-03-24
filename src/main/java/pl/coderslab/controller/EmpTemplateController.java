package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.model.EmpTemplate;
import pl.coderslab.model.Employee;
import pl.coderslab.model.TimeSlot;
import pl.coderslab.model.Weekday;
import pl.coderslab.repository.EmpTemplateRepository;
import pl.coderslab.repository.EmployeeRepository;
import pl.coderslab.repository.TimeSlotRepository;
import pl.coderslab.repository.WeekdayRepository;

import javax.validation.Valid;
import java.time.LocalTime;
import java.util.List;

@Controller
@RequestMapping("/workhrs")
public class EmpTemplateController {
    @Autowired
    private EmpTemplateRepository templateRepository;
    @Autowired
    private EmployeeRepository employeeRepository;
    @Autowired
    private WeekdayRepository weekdayRepository;
    @Autowired
    private TimeSlotRepository timeSlotRepository;

    @ModelAttribute("employees")
    public List<Employee> employees(){  //all items
        List<Employee> allEmployee = employeeRepository.findAll();
        return allEmployee;     }

    @ModelAttribute("employeesToAdd")
    public List<Employee> employeesToAdd(){  //have to check if empl is to fill up
        List<Employee> restEmployee = employeeRepository.findEmployeesByWithQuery();
        return restEmployee;     }

    @ModelAttribute("weekdays")
    public List<Weekday> weekdays(){
        return weekdayRepository.findAll();     }

    @ModelAttribute("timeSlotLst")
    public List<TimeSlot> visithours(){
        return timeSlotRepository.findAll();     }

//-----------
    @GetMapping("/all")
    public String all(Model model){
        model.addAttribute("workHrss", templateRepository.findAll());
        return "workhrs/all";
    }

//-----------
    @GetMapping("/add")
    public String addOne(Model model){
        model.addAttribute("empTemplate", new EmpTemplate());
        return "workhrs/add";
    }

    @PostMapping("/add")
    public String addOne(@Valid EmpTemplate empTemplate, BindingResult result){
        if (result.hasErrors()){
            return "workhrs/add";
        } else {
            fillLocalTime(empTemplate);
            templateRepository.save(empTemplate);
            return "redirect:/workhrs/all";
        }
    }
//-----------
    @GetMapping("/addweek")
    public String add(Model model){
        model.addAttribute("empTemplate", new EmpTemplate());
        return "workhrs/addweek";
    }

    @PostMapping("/addweek")
    public String add(@Valid EmpTemplate empTemplate, BindingResult result){
        if (result.hasErrors()){
            return "workhrs/addweek";
        } else {
            saveWholeWeek(empTemplate);
            return "redirect:/workhrs/all";
        }
    }

    private void saveWholeWeek(@Valid EmpTemplate empTemplate) {
          Employee employee = empTemplate.getEmployee();
          TimeSlot startSlot = empTemplate.getStartTimeObj();
          TimeSlot endSlot = empTemplate.getEndTimeObj();

          LocalTime start = empTemplate.getStartTimeObj().getStartTime();
          LocalTime end = empTemplate.getEndTimeObj().getEndTime();
        for (Weekday day: weekdays()
             ) {empTemplate.setWeekday(day);
            empTemplate.setEmployee(employee);
            empTemplate.setStartTimeObj(startSlot);
            empTemplate.setEndTimeObj(endSlot);
            empTemplate.setStartTime(start);
            empTemplate.setEndTime(end);
            templateRepository.save(empTemplate);

            empTemplate = new EmpTemplate();
        }
    }

//-----------
    @RequestMapping("/edit/{id}")
    public String edit(@PathVariable int id, Model model) {
        model.addAttribute("empTemplate", templateRepository.findOne(id));
        return "workhrs/edit";
    }

    @PostMapping("/edit")
    public String edit(@Valid EmpTemplate empTemplate, BindingResult result){
        if (result.hasErrors()){
            return "workhrs/edit";
        } else {
            fillLocalTime(empTemplate);
            templateRepository.save(empTemplate);
            return "redirect:/workhrs/all";
        }
    }

    private void fillLocalTime(@Valid EmpTemplate empTemplate) {
        LocalTime start = empTemplate.getStartTimeObj().getStartTime();
        empTemplate.setStartTime(start);
        LocalTime end = empTemplate.getEndTimeObj().getEndTime();
        empTemplate.setEndTime(end);
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable int id) {
        templateRepository.delete(id);
        return "redirect:/workhrs/all";
    }

    /*        Employee emp = templateRepository.findOne(id).getEmployee();
        List<Weekday> weekdaysToAdd = weekdayRepository.findWeekdayByEmployeeWithQuery(emp);
        model.addAttribute("weekdaysToAdd", weekdaysToAdd);*/
}