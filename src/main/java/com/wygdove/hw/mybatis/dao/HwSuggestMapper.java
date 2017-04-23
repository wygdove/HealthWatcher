package com.wygdove.hw.mybatis.dao;

import com.wygdove.hw.mybatis.model.HwSuggest;
import com.wygdove.hw.mybatis.model.HwSuggestExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface HwSuggestMapper {
    long countByExample(HwSuggestExample example);

    int deleteByExample(HwSuggestExample example);

    int deleteByPrimaryKey(Integer suggestId);

    int insert(HwSuggest record);

    int insertSelective(HwSuggest record);

    List<HwSuggest> selectByExampleWithBLOBs(HwSuggestExample example);

    List<HwSuggest> selectByExample(HwSuggestExample example);

    HwSuggest selectByPrimaryKey(Integer suggestId);

    int updateByExampleSelective(@Param("record") HwSuggest record, @Param("example") HwSuggestExample example);

    int updateByExampleWithBLOBs(@Param("record") HwSuggest record, @Param("example") HwSuggestExample example);

    int updateByExample(@Param("record") HwSuggest record, @Param("example") HwSuggestExample example);

    int updateByPrimaryKeySelective(HwSuggest record);

    int updateByPrimaryKeyWithBLOBs(HwSuggest record);

    int updateByPrimaryKey(HwSuggest record);
}