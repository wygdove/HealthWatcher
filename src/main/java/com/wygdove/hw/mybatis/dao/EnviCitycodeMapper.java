package com.wygdove.hw.mybatis.dao;

import com.wygdove.hw.mybatis.model.EnviCitycode;
import com.wygdove.hw.mybatis.model.EnviCitycodeExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface EnviCitycodeMapper {
    long countByExample(EnviCitycodeExample example);

    int deleteByExample(EnviCitycodeExample example);

    int deleteByPrimaryKey(String areaid);

    int insert(EnviCitycode record);

    int insertSelective(EnviCitycode record);

    List<EnviCitycode> selectByExample(EnviCitycodeExample example);

    EnviCitycode selectByPrimaryKey(String areaid);

    int updateByExampleSelective(@Param("record") EnviCitycode record, @Param("example") EnviCitycodeExample example);

    int updateByExample(@Param("record") EnviCitycode record, @Param("example") EnviCitycodeExample example);

    int updateByPrimaryKeySelective(EnviCitycode record);

    int updateByPrimaryKey(EnviCitycode record);
}