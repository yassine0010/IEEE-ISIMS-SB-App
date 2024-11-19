package dev.IeeeApplication.IeeeApplication.Entity;

import jakarta.persistence.*;
import lombok.Data;

import java.util.Date;

@Entity
@Data
@Table(name = "ContactUs")
public class ContactUsEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Id")
    private Long Id;

    @Column(name = "COwner")
    private String COwner;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "CDate")
    private Date CDate;

    @Column(name = "ctitle")
    private String ctitle;

    @Lob
    @Column(name = "ccontent", columnDefinition = "MEDIUMTEXT")
    private String ccontent;


    @PrePersist
    protected void onCreate() {
        this.CDate = new Date();

    }
}
