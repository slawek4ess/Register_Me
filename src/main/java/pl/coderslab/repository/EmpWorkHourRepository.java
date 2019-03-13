package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.model.EmpWorkHour;

public interface EmpWorkHourRepository extends JpaRepository<EmpWorkHour, Long> {

 //   List<EmpWorkHour> getEmpWorkHrssByEmployeeId(long id);

}
