package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.model.TimeSlot;

public interface TimeSlotRepository extends JpaRepository<TimeSlot, Integer> {
}
