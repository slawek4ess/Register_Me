package pl.coderslab.model;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.time.LocalDate;
import java.time.LocalTime;

@Entity
public class Event {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @NotNull
    private LocalDate date;

    @NotNull
    private LocalTime time;

    @ManyToOne(cascade = CascadeType.ALL, fetch=FetchType.EAGER)
    private TimeSlot startTimeObj;

    @NotNull
    LocalTime duration;

    @NotNull
    private LocalTime endTime;

    //    @JoinColumn(name = "employee_id")
    @ManyToOne(cascade = CascadeType.ALL, fetch=FetchType.EAGER)
    private Employee employee;

    //    @JoinColumn(name = "employee_id")
    @ManyToOne(cascade = CascadeType.ALL, fetch=FetchType.EAGER)
    private User user;

    //    @JoinColumn(name = "employee_id")
    @ManyToOne(cascade = CascadeType.ALL, fetch=FetchType.EAGER)
    private Category category;

    private String note;

    //--------------------------------------------------------------------


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

    public LocalTime getTime() {
        return time;
    }

    public void setTime(LocalTime time) {
        this.time = time;
    }

    public TimeSlot getStartTimeObj() {
        return startTimeObj;
    }

    public void setStartTimeObj(TimeSlot startTimeObj) {
        this.startTimeObj = startTimeObj;
    }

    public LocalTime getDuration() {
        return duration;
    }

    public void setDuration(LocalTime duration) {
        this.duration = duration;
    }

    public LocalTime getEndTime() {
        return endTime;
    }

    public void setEndTime(LocalTime endTime) {
        this.endTime = endTime;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }
}
