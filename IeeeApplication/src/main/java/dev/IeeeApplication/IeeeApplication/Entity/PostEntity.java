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

    @Column(name = "PostDate")
    private Date PostDate;

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
}

