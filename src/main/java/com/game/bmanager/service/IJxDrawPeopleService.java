package com.game.bmanager.service;

import java.util.List;
import java.util.Map;

import com.game.bmanager.entity.JxDrawPeople;
import com.game.modules.orm.Page;
import com.game.modules.service.GenericManager;


public interface IJxDrawPeopleService extends GenericManager<JxDrawPeople,Long>{

	List<Map<String, Object>> findDrts(String withdrawalOrderNo);

	String findUsernameById(String id);

	Page<JxDrawPeople> dimQueryOfRebates(Page<JxDrawPeople> page,
			String withdrawal_order);

	List<Map<String, Object>> findAllOrders(String withdrawal_order);

	Float fondMostMoney(String withdrawal_order);

	Page<JxDrawPeople> dimQueryOfRebatesOfTkrId(Page<JxDrawPeople> page,
			String withdrawal_order, String by_tkr_id);

	int findupdate_states(String withdrawal_order);

	

}
