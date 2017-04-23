package com.wygdove.hw.mybatis.dao;

import com.wygdove.hw.mybatis.model.HwDevice;
import com.wygdove.hw.mybatis.model.HwDeviceExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface HwDeviceMapper {
    long countByExample(HwDeviceExample example);

    int deleteByExample(HwDeviceExample example);

    int deleteByPrimaryKey(Integer deviceId);

    int insert(HwDevice record);

    int insertSelective(HwDevice record);

    List<HwDevice> selectByExample(HwDeviceExample example);

    HwDevice selectByPrimaryKey(Integer deviceId);

    int updateByExampleSelective(@Param("record") HwDevice record, @Param("example") HwDeviceExample example);

    int updateByExample(@Param("record") HwDevice record, @Param("example") HwDeviceExample example);

    int updateByPrimaryKeySelective(HwDevice record);

    int updateByPrimaryKey(HwDevice record);
}