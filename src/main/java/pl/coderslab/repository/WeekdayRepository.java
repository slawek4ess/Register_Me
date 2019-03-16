package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.model.Weekday;

public interface WeekdayRepository extends JpaRepository<Weekday, Integer> {

}
