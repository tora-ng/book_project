package com.ysy.book_project.mapper;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface HomeMapper {
    List<String> getList();
}
