package com.jeon.board.controller;

import com.jeon.board.CustomAuthException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@RequestMapping("/error")
@Controller
public class ExceptionHandlingController {

    @ExceptionHandler(CustomAuthException.class)
    public ModelAndView LoginAuthError(HttpServletRequest request,
                                       CustomAuthException exception) {
        ModelAndView mav = new ModelAndView();
        mav.addObject("exception", exception);
        mav.addObject("url", request.getRequestURL());
        mav.setViewName("error");
        return mav;
    }
}
