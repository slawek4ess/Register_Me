package pl.coderslab.model;

import javax.persistence.*;
import java.time.LocalTime;

//Godziny pracy w tygodniu dla pracownika ("grafik")
@Entity
public class EmpTemplate {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne(cascade = CascadeType.ALL, fetch=FetchType.EAGER)
//    @JoinColumn(name = "employee_id")
    private Employee employee;

    @ManyToOne(cascade = CascadeType.ALL, fetch=FetchType.EAGER)
//    @JoinColumn(name = "weekday_id")
    private Weekday weekday;


    @ManyToOne(cascade = CascadeType.ALL, fetch=FetchType.EAGER)
    private TimeSlot startTimeObj;

    private LocalTime startTime;

    @ManyToOne(cascade = CascadeType.ALL, fetch=FetchType.EAGER)
    private TimeSlot endTimeObj;

    private LocalTime endTime;


//---------------------------------------------------------------

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }


    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public Weekday getWeekday() {
        return weekday;
    }

    public void setWeekday(Weekday weekday) {
        this.weekday = weekday;
    }


    public TimeSlot getStartTimeObj() {
        return startTimeObj;
    }

    public void setStartTimeObj(TimeSlot startTimeId) {
        this.startTimeObj = startTimeId;
    }

    public TimeSlot getEndTimeObj() {
        return endTimeObj;
    }

    public void setEndTimeObj(TimeSlot endTimeId) {
        this.endTimeObj = endTimeId;
    }

    public LocalTime getStartTime() {
        return startTime;
    }

    public void setStartTime(LocalTime startTime) {
        this.startTime = startTime;
    }

    public LocalTime getEndTime() {
        return endTime;
    }

    public void setEndTime(LocalTime endTime) {
        this.endTime = endTime;
    }
}
