package com.wygdove.hw.mybatis.dao;

import com.wygdove.hw.mybatis.model.HwDeviceType;
import com.wygdove.hw.mybatis.model.HwDeviceTypeExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface HwDeviceTypeMapper {
    long countByExample(HwDeviceTypeExample example);

    int deleteByExample(HwDeviceTypeExample example);

    int deleteByPrimaryKey(Integer deviceTypeId);

    int insert(HwDeviceType record);

    int insertSelective(HwDeviceType record);

    List<HwDeviceType> selectByExample(HwDeviceTypeExample example);

    HwDeviceType selectByPrimaryKey(Integer deviceTypeId);

    int updateByExampleSelective(@Param("record") HwDeviceType record, @Param("example") HwDeviceTypeExample example);

    int updateByExample(@Param("record") HwDeviceType record, @Param("example") HwDeviceTypeExample example);

    int updateByPrimaryKeySelective(HwDeviceType record);

    int updateByPrimaryKey(HwDeviceType record);
}