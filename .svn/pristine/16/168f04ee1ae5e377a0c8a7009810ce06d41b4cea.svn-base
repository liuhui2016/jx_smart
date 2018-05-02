package com.game.bmanager.service;

import java.util.List;
import java.util.Map;

import com.game.bmanager.entity.JxPartnerRebate;
import com.game.bmanager.entity.JxWithdrawalOrder;
import com.game.modules.orm.Page;
import com.game.modules.service.GenericManager;

public interface IJxWithdrawalOrderService extends GenericManager<JxWithdrawalOrder,Long>{

	List<Map<String, Object>> findAllWithdrawalOrder(String username, int page);

	Page<JxWithdrawalOrder> dimQueryAll(Page<JxWithdrawalOrder> page);

	Page<JxWithdrawalOrder> dimQueryOfUserid(Page<JxWithdrawalOrder> page,
			String userid);

	Page<JxWithdrawalOrder> findRebateXQ(Page<JxWithdrawalOrder> page,
			String withdrawal_order);

	Page<JxWithdrawalOrder> dimQueryOfRebates(Page<JxWithdrawalOrder> page,
			String withdrawal_order);

}
