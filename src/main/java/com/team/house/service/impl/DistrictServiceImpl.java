package com.team.house.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.team.house.entity.District;
import com.team.house.entity.DistrictExample;
import com.team.house.mapper.DistrictMapper;
import com.team.house.service.DistrictService;
import com.team.house.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author: zzw
 * @Date： 2019/10/15
 * @Description：
 * @Version: 1.0
 */
@Service
public class DistrictServiceImpl implements DistrictService {
    @Autowired
    private DistrictMapper districtMapper;
    public PageInfo<District> getDisTrictByPage(PageUtil pageInfo) {
        //开启分页
        PageHelper.startPage(pageInfo.getPage(),pageInfo.getRows());
        //调用方法
        DistrictExample districtExample = new DistrictExample();
        List<District> list = districtMapper.selectByExample(districtExample);
        //获取分页信息
        PageInfo<District> pageInfo1 = new PageInfo(list);
        //返回数据
        return pageInfo1;
    }

    /**
     * 添加区域信息
     * @param district
     * @return
     */
    public int addDistrict(District district) {
        return districtMapper.insertSelective(district);
    }
}
