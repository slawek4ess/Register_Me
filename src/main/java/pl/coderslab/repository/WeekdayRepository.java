package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pl.coderslab.model.Weekday;
import pl.coderslab.model.Weekday;

import java.util.List;

public interface WeekdayRepository extends JpaRepository<Weekday, Integer> {

    @Query("select distinct Weekday from Weekday Weekday LEFT JOIN EmpTemplate EmpTemplate " +
            "on Weekday.id = EmpTemplate.weekday.id where EmpTemplate.weekday.id is null")
    List<Weekday> findWeekdayByWithQuery();
}
