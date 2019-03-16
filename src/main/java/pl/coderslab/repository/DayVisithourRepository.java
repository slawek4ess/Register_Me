package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.model.DayVisithour;

public interface DayVisithourRepository extends JpaRepository<DayVisithour, Integer> {
}
