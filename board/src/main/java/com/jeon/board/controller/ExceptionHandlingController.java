package com.jeon.board.controller;

import com.jeon.board.error.CustomAuthException;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.NoHandlerFoundException;

import javax.servlet.http.HttpServletRequest;

@RequestMapping("/error")
@Controller
public class ExceptionHandlingController {
    //로그인 세션 없음
    @ExceptionHandler(CustomAuthException.class)
    public ModelAndView LoginAuthError(HttpServletRequest request,
                                       CustomAuthException exception) {
        ModelAndView mav = new ModelAndView();
        mav.addObject("exception", exception);
        mav.addObject("url", request.getRequestURL());
        mav.setViewName("error");
        return mav;
    }

    @ExceptionHandler(NoHandlerFoundException.class)
    public ModelAndView LoginAuthError(HttpServletRequest request,
                                       NoHandlerFoundException exception) {
        ModelAndView mav = new ModelAndView();
        mav.addObject("exception", exception);
        mav.addObject("code", HttpStatus.BAD_REQUEST);
        mav.addObject("url", request.getRequestURL());
        mav.addObject("message", "페이지를 찾을 수 없습니다.");
        mav.setViewName("error");
        return mav;
    }

}
