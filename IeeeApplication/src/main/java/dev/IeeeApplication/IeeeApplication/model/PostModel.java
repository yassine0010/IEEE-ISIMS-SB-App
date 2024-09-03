package dev.IeeeApplication.IeeeApplication.model;

import lombok.Data;

import java.util.Date;

@Data
public class PostModel {
    private Long Id;
    private String PostOwner;
    private Date PostDate;
    private Date PostDeadline;
    private String Title;
    private String PostContent;
    private String FormLink;
    private byte[] Image;
}
