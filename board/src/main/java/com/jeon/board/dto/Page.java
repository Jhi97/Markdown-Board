package com.jeon.board.dto;

import lombok.Getter;

@Getter
public class Page {

    public Page(int num, int count) {
        this.num = num;
        this.count = count;
        pagingCalc();
    }
    // 현재 페이지 번호
    private int num;

    // 게시물 총 갯수
    private int count;

    // 한 페이지에 출력될 게시물의 개수
    private int postNum = 10;

    // 하단 페이징 번호
    private int pageNum;

    // 출력할 게시물
    private int displayPost;

    // 한번에 표시할 페이징 번호의 갯수
    private int pageNumCnt = 10;

    // 표시되는 페이지 번호 중 마지막 번호
    private int endPageNum;

    // 표시되는 페이지 번호 중 첫번째 번호
    private int startPageNum;

    // 다음/이전 표시 여부
    private boolean prev;
    private boolean next;

    public void setNum(int num) {
        this.num = num;
    }

    public void setCount(int count) {
        this.count = count;
        pagingCalc();
    }

    private void pagingCalc() {

        // 마지막 번호
        endPageNum = (int)(Math.ceil((double)num / (double)pageNumCnt) * pageNumCnt);

        // 시작 번호
        startPageNum = endPageNum - (pageNumCnt - 1);

        // 마지막 번호 재계산
        int tempEndPage = (int)(Math.ceil((double)count / (double)pageNumCnt));

        if(endPageNum > tempEndPage) {
            endPageNum = tempEndPage;
        }

        prev = startPageNum == 1 ? false : true;
        next = endPageNum * pageNumCnt >= count ? false : true;

        displayPost = (num - 1) * postNum;

    }
}
