package com.course.business.controller.admin;

import com.course.server.dto.ChapterDto;
import com.course.server.dto.PageDto;
import com.course.server.service.ChapterService;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

@RestController
@RequestMapping("/admin/chapter")
public class ChapterController {
    @Resource
    private ChapterService chapterService;
    @RequestMapping("/list")
    public PageDto chapter(@RequestBody PageDto pageDto){
        chapterService.list(pageDto);
        return pageDto;
    }
    @RequestMapping("/save")
    public ChapterDto save(@RequestBody ChapterDto chapterDto){
        chapterService.save(chapterDto);
        return chapterDto;
    }
}
