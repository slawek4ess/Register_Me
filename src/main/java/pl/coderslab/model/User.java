package pl.coderslab.model;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;
import pl.coderslab.util.BCrypt;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.Pattern;

@Entity
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @NotBlank(message = " Podaj imię! ")
    private String firstName;

    @NotBlank(message = " Podaj nazwisko! ")
    private String lastName;

    @NotBlank(message = "Pole nie może być puste")
    @Pattern(message = " Podaj nr telefonu złożony z 9 cyfr! ", regexp = "^\\d{9}$")
    private String phone;

    @NotBlank(message = "Pole nie może być puste")
//    @Email(message = " Podaj poprawny adres email ! ")
    private String email;

    @NotBlank(message = "Pole nie może być puste")
    @Pattern(message = " Wpisz co najmniej 4 znaki! ", regexp = "^\\S{4,}")
    private String password;

    private boolean admin;

//----------------------------------------------------------------------
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getFullName() {
        return lastName+" "+firstName; }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public boolean isAdmin() {
        return admin;
    }

    public void setAdmin(boolean admin) {
        this.admin = admin;
    }


    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {

        this.password = encryptPassword(password);
    }

    public String encryptPassword(String password) {
        return BCrypt.hashpw(password, BCrypt.gensalt());
    }

    @Override
    public String toString() {
        return firstName + " " + lastName;
    }
}
