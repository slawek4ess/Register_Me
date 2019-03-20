package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pl.coderslab.model.Employee;
import java.util.List;


public interface EmployeeRepository extends JpaRepository<Employee, Integer> {

    @Query("select distinct Employee.lastName from Employee Employee LEFT JOIN EmpTemplate EmpTemplate " +
            "on Employee.id = EmpTemplate.employee.id")
    List<Employee> findEmployeesByWithQuery();

}
