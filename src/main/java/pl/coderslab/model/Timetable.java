package pl.coderslab.model;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.time.LocalDate;
import java.time.LocalTime;

@Entity
public class Timetable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @NotNull
    private LocalDate date;

    //    @JoinColumn(name = "weekday_id")
        @ManyToOne(cascade = CascadeType.ALL)
    private Weekday weekday;

    //    @JoinColumn(name = "employee_id")
        @ManyToOne(cascade = CascadeType.ALL, fetch=FetchType.EAGER)
    private Employee employee;

    //    @JoinColumn(name = "startTime_id")
    @ManyToOne(cascade = CascadeType.ALL, fetch=FetchType.EAGER)
    private TimeSlot startTime;

    //    @JoinColumn(name = "event_id")
    @ManyToOne(cascade = CascadeType.ALL, fetch=FetchType.LAZY)
    private Event event;

    //------------------------------------------------------------------

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public Weekday getWeekday() {
        return weekday;
    }

    public void setWeekday(Weekday weekday) {
        this.weekday = weekday;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public TimeSlot getStartTime() {
        return startTime;
    }

    public void setStartTime(TimeSlot startTime) {
        this.startTime = startTime;
    }

    public Event getEvent() {
        return event;
    }

    public void setEvent(Event event) {
        this.event = event;
    }
}
