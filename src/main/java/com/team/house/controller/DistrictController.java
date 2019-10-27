package com.team.house.controller;

import com.github.pagehelper.PageInfo;
import com.team.house.entity.District;
import com.team.house.service.DistrictService;
import com.team.house.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

/**
 * @Author: zzw
 * @Date： 2019/10/15
 * @Description：
 * @Version: 1.0
 */
@Controller
@RequestMapping("/admin/")
public class DistrictController {
    @Autowired
    private DistrictService districtService;

    /**
     * 分页查询区域信息
     * @param pageUtil
     * @return
     */
    @RequestMapping("getDistrictByPage")
    @ResponseBody
    public Map<String,Object> getDistrictByPage(PageUtil pageUtil){
        //调用业务
        PageInfo<District> pageInfo = districtService.getDisTrictByPage(pageUtil);
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("rows",pageInfo.getList());
        map.put("total",pageInfo.getTotal());
        return map;
    }

    @RequestMapping("addDistrict")
    @ResponseBody
    public Map<String,Object> addDistrict(District district){
        //调用业务
        int flag = districtService.addDistrict(district);
        //使用map封装返回的数据
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("result",flag);
        return map;
    }
}
