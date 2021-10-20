package com.jeon.board.dto;

import lombok.Data;

@Data
public class Profile {
    private int profile_num;
    private String introduce;
    private String member_img;

    public Profile() {
    }

    public Profile(int profile_num, String introduce, String member_img) {
        this.profile_num = profile_num;
        this.introduce = introduce;
        this.member_img = member_img;
    }
}
