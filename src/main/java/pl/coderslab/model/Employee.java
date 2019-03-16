package pl.coderslab.model;

import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

// Pracownik
@Entity
public class Employee {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @NotBlank
    private String firstName;

    @NotBlank
    private String lastName;

    private String email;

    private String mobile;

/*    @OneToMany(mappedBy = "employee", cascade = CascadeType.ALL)
    private List<EmpTemplate> workHrs = new ArrayList<EmpTemplate>();*/

    public Employee() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
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

/*    public List<EmpTemplate> getWorkHrs() {
        return workHrs;
    }

    public void setWorkHrs(List<EmpTemplate> workHrs) {
        this.workHrs = workHrs;
    }*/
}
