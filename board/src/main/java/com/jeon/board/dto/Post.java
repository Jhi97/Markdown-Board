package com.jeon.board.dto;

import lombok.Data;

import java.util.Date;

@Data
public class Post {
    int num;
    String title;
    String category;
    String contents;
    Date createDate;
}
