package com.jeon.board.dto;

import lombok.Data;

import java.util.Date;

@Data
public class Post {
    private int post_num;
    private int member_num;
    private String title;
    private String category;
    private String contents;
    private Date createDate;
}
