package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pl.coderslab.model.Category;
import pl.coderslab.model.Employee;
import pl.coderslab.model.Weekday;

import java.util.List;

public interface CategoryRepository extends JpaRepository<Category, Integer> {

}
