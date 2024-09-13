package dev.IeeeApplication.IeeeApplication.Entity;

import jakarta.persistence.*;
import lombok.Data;

import java.util.Date;

@Entity
@Data
@Table(name = "PostEntity")
public class PostEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Id")
    private Long Id;

    @Column(name = "PostOwner")
    private String PostOwner;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "PostDate")
    private Date PostDate;

    @Temporal(TemporalType.DATE)
    @Column(name = "PostDeadline")
    private Date PostDeadline;

    @Column(name = "Title")
    private String Title;

    @Column(name = "PostContent")
    private String PostContent;

    @Column(name = "FormLink")
    private String FormLink;

    @Lob
    @Column(name = "Image")
    private byte[] Image;

    @PrePersist
    protected void onCreate() {
        this.PostDate = new Date();

    }
}

