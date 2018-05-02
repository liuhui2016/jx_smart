package com.game.bmanager.service;

import java.util.List;
import java.util.Map;

import com.game.bmanager.entity.JxAdvpic;
import com.game.bmanager.entity.JxAdvpics;
import com.game.modules.orm.Page;
import com.game.modules.orm.PropertyFilter;
import com.game.modules.service.GenericManager;

public interface IJxAdvpicService extends GenericManager<JxAdvpic, Long>{

    public abstract List<Map<String, Object>> queryAdverByType(String type);

	public abstract Map<String, Object> queryAdverByTypes(String v_id);

	public abstract Page<JxAdvpic> querySelectResourcer(
			Page<JxAdvpic> pageResourcer, String adv_type);


}
