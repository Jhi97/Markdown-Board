package com.jeon.board.dto;

import lombok.Data;

@Data
public class Post {
    int post_num;
    String title;
    String category;
    String contents;
}
