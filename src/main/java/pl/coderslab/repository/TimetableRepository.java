package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.model.Event;
import pl.coderslab.model.Timetable;

public interface TimetableRepository extends JpaRepository<Timetable, Integer> {

}
