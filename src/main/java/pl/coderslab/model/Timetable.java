package pl.coderslab.model;

import javax.persistence.*;
import java.time.LocalTime;

@Entity
public class Timetable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
//    @JoinColumn(name = "employee_id")
    private Employee employee;

    @ManyToOne
//    @JoinColumn(name = "weekday_id")
    private Weekday weekday;

    @ManyToOne
    private TimeSlot TimeObj;

    private LocalTime startTime;

    private LocalTime endTime;


}
