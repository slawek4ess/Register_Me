package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.model.Weekday;

import java.util.List;

public interface WeekdayRepository extends JpaRepository<Weekday, Long> {

}
