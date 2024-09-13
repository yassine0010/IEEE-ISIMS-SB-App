package dev.IeeeApplication.IeeeApplication.Entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name = "auth_users")

public class UserAuthEntity {
    @Id
    @Column(name = "ieee_id")
    private String IEEE_ID;

    @Column(name = "name")
    private String name;

    @Column(name = "email")
    private String email;

    @Column(name = "ieee_email")
    private String ieeeEmail;

    @Column(name = "ieee_password")
    private String ieeePassword;

    @Column(name = "phone_number")
    private String phoneNumber;

    @Column(name = "membership")
    private String membership;

    @Column(name = "fss_isims")
    private String fss_isims;

    @Column(name = "Role")
    private String Role;


    public UserAuthEntity() {
    }

}
