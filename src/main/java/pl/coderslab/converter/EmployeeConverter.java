package pl.coderslab.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import pl.coderslab.model.Employee;
import pl.coderslab.repository.EmployeeRepository;

public class EmployeeConverter implements Converter<String, Employee> {

    @Autowired
    private EmployeeRepository employeeRepository;

    @Override
    public Employee convert(String s) {
        return employeeRepository.findOne(Long.parseLong(s));
    }
}
