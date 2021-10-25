package com.jeon.board.service;

import com.jeon.board.dto.Post;
import com.jeon.board.mapper.BoardMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.*;


@Service
@Slf4j
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService{
    private static String UPLOADED_FOLDER = "./src/main/webapp/resources/upload/post/";
    private final BoardMapper boardMapper;

    @Override
    public Map<String, Object> getMain(int displayPost, int postNum, String keyword, String categoryParam, int memberNum) {
        Map<String, Object> map = new HashMap<>();
        Map mainDate = mainInfoToDataV2(displayPost, postNum, keyword, categoryParam, memberNum);
        log.info(mainDate.toString());
        map.put("post", boardMapper.getMain(mainDate));
        map.put("category", boardMapper.getCategory(keyword, memberNum));
        map.put("allCount", boardMapper.getCount(memberNum));
        if (!keyword.isEmpty() || !categoryParam.isEmpty()) {
            log.info("CountSearch run");
            map.put("searchCount", boardMapper.getCountSearch(mainDate));
        }
        return map;
    }

    // 계정 게시글 전체 갯수 조회
    @Override
    public int getCount(int memberNum) {
        return boardMapper.getCount(memberNum);
    }
    // Mapper에 전달할 main의 정보 생성
    public Map<String, Object> mainInfoToDataV2(int displayPost, int postNum, String keyword, String categoryParam, int memberNum) {
        Map<String, Object> data = new HashMap<>();
        data.put("displayPost", displayPost);
        data.put("postNum", postNum);
        data.put("keyword", keyword);
        data.put("category", categoryParam);
        data.put("memberNum", memberNum);
        return data;
    }

    @Override
    public String[] getCategory(int memberNum) {
        List<HashMap<String, Object>> categoryData = boardMapper.getCategory(new String(""), memberNum);
        int size = categoryData.size();
        String[] categoryList = new String[size];
        for (int i = 0; i < size; i++) {
            categoryList[i] = categoryData.get(i).get("name").toString();
        }
        return categoryList;
    }

    @Override
    public void postWrite(Post post, List noUsedImages, int memberNum) {
        log.info("memberNum: " + memberNum);
        noUsedImageDelete(noUsedImages, memberNum);
        boardMapper.postWrite(post, memberNum);
    }

    public void noUsedImageDelete(List noUsedImages, int memberNum) {
        for (int i = 0; i < noUsedImages.size(); i++) {
            String noUsedImageName = noUsedImages.get(i).toString();
            noUsedImageName = noUsedImageName.substring(noUsedImageName.lastIndexOf("/")+1);
            log.info("delete Name: "+ noUsedImageName);
            File file = new File(UPLOADED_FOLDER + memberNum + "/" + noUsedImageName);
            if (file.exists()) {
                if (file.delete()) {
                    log.info("미사용 이미지 삭제 성공");
                }else{
                    log.info("미사용 이미지 삭제 실패");
                }
            }
        }
    }

    @Override
    public String postImage(MultipartFile image, int memberNum) throws IOException {
        byte[] bytes = image.getBytes();
        //이미지 랜덤 이름 부여
        String fileName = setFileName(image.getOriginalFilename());
        //멤버 별 별도 폴더 생성
        setFolder(memberNum);
        String imageUrl = UPLOADED_FOLDER + memberNum + "/" + fileName;
        Path path = Paths.get(imageUrl);
        Files.write(path, bytes);
        return fileName;
    }
    //멤버 별 별도 폴더 생성기
    public void setFolder(int memberNum) {
        File Folder = new File(UPLOADED_FOLDER + memberNum);
        if (!Folder.exists()) {
            Folder.mkdir();
            log.info(memberNum+" mkdir");
        }
    }

    //파일 이름 랜덤 생성기
    public static String setFileName(String originalName) {
        UUID uuid = UUID.randomUUID();
        String ext = originalName.substring(originalName.lastIndexOf("."));
        String fileName = uuid + ext;
        return fileName;
    }

    @Override
    public Post getView(int num, int memberNum) throws IllegalAccessException {
        Post post = boardMapper.getView(num);
        if (!(post.getMember_num()==memberNum)) {
            IllegalAccessException userError = new IllegalAccessException();
            throw userError;
        }else{
            // javascript 변수 선언을 위한 개행 처리
            post.setContents(post.getContents().replace("\n", "<br>"));
            return post;
        }
    }

    @Override
    public void putModify(Post post, List noUsedImages, int memberNum) throws Exception {
        noUsedImageDelete(noUsedImages, memberNum);
        try {
            boardMapper.putModify(post, memberNum);
        } catch (Exception e) {
            IllegalAccessException modifyError = new IllegalAccessException();
            throw modifyError;
        }
    }

    @Override
    public void delete(int postNum, int memberNum) throws Exception {
        try {
            boardMapper.delete(postNum, memberNum);
        } catch (Exception e) {
            IllegalAccessException deleteError = new IllegalAccessException();
            throw deleteError;
        }
    }
}
