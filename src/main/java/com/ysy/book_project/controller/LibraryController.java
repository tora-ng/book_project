package com.ysy.book_project.controller;


import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@Slf4j
@RequiredArgsConstructor
public class LibraryController {

    @GetMapping("/library")
    public String home() {
        return "/library";
    }

    @GetMapping("/addBook")
    public String addBook() {
        return "/addBook";
    }
}
