package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.model.Employee;
import pl.coderslab.repository.EmployeeRepository;

import javax.validation.Valid;

@Controller
@RequestMapping("/employee")
public class EmployeeController {

    @Autowired
    private EmployeeRepository employeeRepository;


    @GetMapping("/all")
    public String allEmployees(Model model){
        model.addAttribute("employees", employeeRepository.findAll());
        return "employee/all";
    }

    @GetMapping("/add")
    public String addEmployee(Model model){
        model.addAttribute("employee", new Employee());
        return "employee/add";
    }
    @PostMapping("/add")
    public String addEmployee(@Valid Employee employee, BindingResult result){
        if (result.hasErrors()){
            return "employee/add";
        } else {
            employeeRepository.save(employee);
            return "redirect:/employee/all";
        }
    }

    @PostMapping("/edit")
    public String edit(@Valid Employee employee, BindingResult result){
        if (result.hasErrors()){
            return "employee/edit";
        } else {
            employeeRepository.save(employee);
            return "redirect:/employee/all";
        }
    }

    @RequestMapping("/edit/{id}")
    public String edit(@PathVariable long id, Model model) {
        model.addAttribute("employee", employeeRepository.findOne(id));
        return "employee/edit";
    }
    @PostMapping("/edit/{id:[0-9]+}")
    public String edit(@Valid Employee employee, BindingResult result, @PathVariable Long id) {
        if (result.hasErrors()) {
            return "/employee/edit/" + id;
        }
        employeeRepository.save(employee);
        return "redirect:/admin/employee/all";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable long id) {
        employeeRepository.delete(id);
        return "redirect:/employee/all";
    }

}
