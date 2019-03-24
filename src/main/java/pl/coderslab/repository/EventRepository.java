package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.model.Event;
import pl.coderslab.model.TimeSlot;

import java.time.LocalTime;

public interface EventRepository extends JpaRepository<Event, Integer> {

}
