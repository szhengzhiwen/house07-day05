package com.team.house.service;

import com.github.pagehelper.PageInfo;
import com.team.house.entity.District;
import com.team.house.util.PageUtil;

/**
 * @Author: zzw
 * @Date： 2019/10/15
 * @Description：
 * @Version: 1.0
 */
public interface DistrictService {
    /**
     * 分页显示区域信息
     */
    PageInfo<District> getDisTrictByPage(PageUtil pageInfo);

    /**
     * 添加区域信息
     */
    public int addDistrict(District district);
}
