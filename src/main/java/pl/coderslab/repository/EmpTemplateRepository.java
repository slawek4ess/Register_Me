package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.model.EmpTemplate;
import pl.coderslab.model.Employee;

import java.util.List;

public interface EmpTemplateRepository extends JpaRepository<EmpTemplate, Integer> {

    List<EmpTemplate> getEmpTemplateByEmployee(Employee employee);


}
