package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.model.EmpTemplate;

public interface EmpTemplateRepository extends JpaRepository<EmpTemplate, Integer> {

 //   List<EmpTemplate> getEmpWorkHrssByEmployeeId(Integer id);

}
