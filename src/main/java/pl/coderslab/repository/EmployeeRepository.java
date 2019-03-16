package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.model.Employee;

public interface EmployeeRepository extends JpaRepository<Employee, Integer> {

}
