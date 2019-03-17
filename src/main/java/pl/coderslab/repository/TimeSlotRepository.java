package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.model.TimeSlot;

import java.time.LocalTime;

public interface TimeSlotRepository extends JpaRepository<TimeSlot, Integer> {

    TimeSlot getTimeSlotByStartTime(LocalTime startTime);

    TimeSlot getTimeSlotByEndTime(LocalTime endTime);

}
