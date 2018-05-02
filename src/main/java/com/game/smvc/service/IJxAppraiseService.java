package com.game.smvc.service;

import java.util.List;
import java.util.Map;

import com.game.modules.service.GenericManager;
import com.game.smvc.entity.JxAppraise;

public interface IJxAppraiseService  extends GenericManager<JxAppraise, Long>{

	List<Map<String, Object>> findAppraisesParticularsToId(String after_id);

}
