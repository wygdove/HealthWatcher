package com.wygdove.hw.mybatis.dao;

import com.wygdove.hw.mybatis.model.HwUser;
import com.wygdove.hw.mybatis.model.HwUserExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface HwUserMapper {
    long countByExample(HwUserExample example);

    int deleteByExample(HwUserExample example);

    int deleteByPrimaryKey(Integer userId);

    int insert(HwUser record);

    int insertSelective(HwUser record);

    List<HwUser> selectByExample(HwUserExample example);

    HwUser selectByPrimaryKey(Integer userId);

    int updateByExampleSelective(@Param("record") HwUser record, @Param("example") HwUserExample example);

    int updateByExample(@Param("record") HwUser record, @Param("example") HwUserExample example);

    int updateByPrimaryKeySelective(HwUser record);

    int updateByPrimaryKey(HwUser record);
}