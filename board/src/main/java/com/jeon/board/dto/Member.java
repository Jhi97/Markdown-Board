package com.jeon.board.dto;


import lombok.Data;

import java.util.Date;

@Data
public class Member {
    private int member_num;
    private String member_id;
    private String member_pw;
    private String member_email;
    private String member_gender;
    private Date member_joinDate;
}
