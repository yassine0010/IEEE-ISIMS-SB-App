package dev.IeeeApplication.IeeeApplication.Entity;

import jakarta.persistence.*;
import lombok.Data;

import java.util.Date;

@Entity
@Data
@Table(name = "ContactUs")
public class ContactUsEntity {
    @jakarta.persistence.Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Id")
    private Long Id;

    @Column(name = "C_Owner")
    private String PostOwner;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "C_Date")
    private Date PostDate;

    @Column(name = "C_Title")
    private String Title;

    @Lob
    @Column(name = "C_Content", columnDefinition = "MEDIUMTEXT")
    private String PostContent;


    @PrePersist
    protected void onCreate() {
        this.PostDate = new Date();

    }
}
