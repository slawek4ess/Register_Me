package pl.coderslab.model;

import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

// Pracownik
@Entity
@Table(name="employees")
public class Employee {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank
    private String firstName;

    @NotBlank
    private String lastName;

    private String email;

    private String mobile;

/*    @OneToMany(mappedBy = "employee", cascade = CascadeType.ALL)
    private List<EmpWorkHour> workHrs = new ArrayList<EmpWorkHour>();*/

    public Employee() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String name) {
        this.firstName = name;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobilePhone) {
        this.mobile = mobilePhone;
    }

/*    public List<EmpWorkHour> getWorkHrs() {
        return workHrs;
    }

    public void setWorkHrs(List<EmpWorkHour> workHrs) {
        this.workHrs = workHrs;
    }*/
}
