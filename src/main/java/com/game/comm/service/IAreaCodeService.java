package com.game.comm.service;

import java.util.List;
import java.util.Map;

import com.game.comm.entity.AreaCode;
import com.game.modules.service.GenericManager;

public interface IAreaCodeService extends GenericManager<AreaCode, Long>{

	String findAreaCode(String s_city);

	List<Map<String, Object>> findACode(String par_level, String s_city,String parParentid);

	List<Map<String, Object>> findOtherCode(String par_level, String city,String parParentid);

}
