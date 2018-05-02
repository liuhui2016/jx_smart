package com.game.bmanager.service;

import java.util.List;
import java.util.Map;

import com.game.bmanager.entity.JxPartnerRebate;
import com.game.bmanager.entity.JxWithdrawalOrder;
import com.game.modules.orm.Page;
import com.game.modules.service.GenericManager;

public interface IJxPartnerRebateService extends GenericManager<JxPartnerRebate,Long>{

	List<Map<String,Object>> findLastAddtime(String username);

	JxPartnerRebate findRebateXQ(String withdrawal_order);

	Page<JxPartnerRebate> findRebates(Page<JxPartnerRebate> pages,
			String withdrawal_order);

	Page<JxPartnerRebate> dimQueryOfRebates(Page<JxPartnerRebate> page,
			String withdrawal_order);

	String findNameToWithdrawalOrder(String withdrawal_order);

	List<Map<String, Object>> findLastAddtimes(String user_name);

	

	

}
