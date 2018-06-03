package com.game.bmanager.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import com.game.bmanager.entity.JxDrawPeople;
import com.game.bmanager.entity.JxPartner;
import com.game.bmanager.entity.JxPartnerRebate;
import com.game.bmanager.entity.JxWithdrawalOrder;
import com.game.bmanager.service.IJxDrawPeopleService;
import com.game.bmanager.service.IJxPartnerRebateService;
import com.game.bmanager.service.IJxWithdrawalOrderService;
import com.game.modules.orm.Page;
import com.game.modules.web.CrudActionSupport;

@Namespace("/bmanager/trade")
@Results({ @Result(name = "reload", location = "tradess.action?id=${id}", type = "redirect") })
public class TradessAction extends CrudActionSupport<JxDrawPeople>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Autowired
	private IJxWithdrawalOrderService jxWithdrawalOrderService;
	@Autowired
	private IJxPartnerRebateService jxPartnerRebateService;
	@Autowired
	private IJxDrawPeopleService jxDrawPeopleService;
	
	private JxDrawPeople jxDrawPeople;
	private JxWithdrawalOrder jxWithdrawalOrder;
	private JxPartnerRebate jxPartnerRebate;
	private String withdrawal_order;
	private String withdrawal_amount;
	private String real_namer;
	private String by_tkr_id;
	private Page<JxDrawPeople> page = new Page<JxDrawPeople>(15);

	private Long id;
	private Long oldId;
	private List<Long> ids;
	@Override
	public JxDrawPeople getModel() {
		if (this.id != null) {
			this.jxDrawPeople = ((JxDrawPeople) jxDrawPeopleService
					.get(this.id));
		} else {
			this.jxDrawPeople = new JxDrawPeople();
		}
		
		return jxDrawPeople;
	}

	@Override
	public String delete() throws Exception {
		return null;
	}

	@Override
	public String input() throws Exception {
		return null;
	}

	public String lists() throws Exception {
		String a = by_tkr_id;
		if(by_tkr_id != null && a.length() != 0){
			page = jxDrawPeopleService.dimQueryOfRebatesOfTkrId(page,withdrawal_order,by_tkr_id);
		}else{
			page = jxDrawPeopleService.dimQueryOfRebates(page,withdrawal_order);
		}
		return SUCCESS;
	}
	
	@Override
	protected void prepareModel() throws Exception {
		// TODO Auto-generated method stub
		
	}
	
	//修改下级比例跳转的页面
	public String saves() throws Exception {
		return "updates";
	}

	@Override
	public String save() throws Exception {
		System.out.println("修改比例:"+jxDrawPeople.getBy_tkr_rebates());
		String withdrawal_order = jxDrawPeople.getWithdrawal_order();
		Float tkr_rebates = jxDrawPeople.getBy_tkr_rebates();
		String tkr_id = jxDrawPeople.getBy_tkr_id();
		JxDrawPeople jxDrawPeople = jxDrawPeopleService.
				findUnique("from jx_draw_people where withdrawal_order = '"+withdrawal_order+"' and by_tkr_id = '"+tkr_id+"'");
		jxDrawPeople.setService_fee(jxDrawPeople.getService_fee()/jxDrawPeople.getBy_tkr_rebates());
		jxDrawPeople.setF_renewal(jxDrawPeople.getF_renewal()/jxDrawPeople.getBy_tkr_rebates());
		jxDrawPeople.setBy_tkr_rebates(tkr_rebates);
		jxDrawPeopleService.save(jxDrawPeople);
		
		//得到并保存服务费和服务费续费
		JxDrawPeople jxDrawPeople3 = jxDrawPeopleService.
				findUnique("from jx_draw_people where withdrawal_order = '"+withdrawal_order+"' and by_tkr_id = '"+tkr_id+"'");
		jxDrawPeople3.setService_fee(jxDrawPeople3.getService_fee() * jxDrawPeople3.getBy_tkr_rebates());
		jxDrawPeople3.setF_renewal(jxDrawPeople3.getF_renewal() * jxDrawPeople3.getBy_tkr_rebates());
		jxDrawPeopleService.save(jxDrawPeople3);
		
		List<Map<String,Object>> list = jxDrawPeopleService.findAllOrders(withdrawal_order);
		if(list.size() > 0){
			for(int i = 0;i < list.size();i++){
				Map<String,Object> map = list.get(i);
				Float total_money = (Float) map.get("total_money");
				Float by_tkr_rebates = (Float) map.get("by_tkr_rebates");
				String by_tkr_id = (String) map.get("by_tkr_id");
				//根据产品经理编号和订单号来保存返利
				JxDrawPeople jxDrawPeople2 = jxDrawPeopleService.
						findUnique("from jx_draw_people where withdrawal_order = '"+withdrawal_order+"' and by_tkr_id = '"+by_tkr_id+"'");
				jxDrawPeople2.setBy_tkr_total_money(total_money*by_tkr_rebates);
				jxDrawPeopleService.save(jxDrawPeople2);
			}
		}
		
		Float money = jxDrawPeopleService.fondMostMoney(withdrawal_order);
		System.out.println("money:"+money);
		JxWithdrawalOrder jxWithdrawalOrder = jxWithdrawalOrderService
				.findUnique("from JxWithdrawalOrder where withdrawal_order = '"
						+ withdrawal_order + "'");
		jxWithdrawalOrder.setLower_rebate(money);
		jxWithdrawalOrderService.save(jxWithdrawalOrder);
		page = jxDrawPeopleService.dimQueryOfRebates(page,jxDrawPeople.getWithdrawal_order());
		return SUCCESS;
	}
	
	public JxWithdrawalOrder getJxWithdrawalOrder() {
		return jxWithdrawalOrder;
	}

	public void setJxWithdrawalOrder(JxWithdrawalOrder jxWithdrawalOrder) {
		this.jxWithdrawalOrder = jxWithdrawalOrder;
	}

	public JxPartnerRebate getJxPartnerRebate() {
		return jxPartnerRebate;
	}

	public void setJxPartnerRebate(JxPartnerRebate jxPartnerRebate) {
		this.jxPartnerRebate = jxPartnerRebate;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getOldId() {
		return oldId;
	}

	public void setOldId(Long oldId) {
		this.oldId = oldId;
	}

	public List<Long> getIds() {
		return ids;
	}

	public void setIds(List<Long> ids) {
		this.ids = ids;
	}


	@Override
	public String list() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	public String getWithdrawal_order() {
		return withdrawal_order;
	}

	public void setWithdrawal_order(String withdrawal_order) {
		this.withdrawal_order = withdrawal_order;
	}

	public String getReal_namer() {
		return real_namer;
	}

	public void setReal_namer(String real_namer) {
		this.real_namer = real_namer;
	}

	public JxDrawPeople getJxDrawPeople() {
		return jxDrawPeople;
	}

	public void setJxDrawPeople(JxDrawPeople jxDrawPeople) {
		this.jxDrawPeople = jxDrawPeople;
	}

	public Page<JxDrawPeople> getPage() {
		return page;
	}

	public void setPage(Page<JxDrawPeople> page) {
		this.page = page;
	}

	public String getBy_tkr_id() {
		return by_tkr_id;
	}

	public void setBy_tkr_id(String by_tkr_id) {
		this.by_tkr_id = by_tkr_id;
	}

	public String getWithdrawal_amount() {
		return withdrawal_amount;
	}

	public void setWithdrawal_amount(String withdrawal_amount) {
		this.withdrawal_amount = withdrawal_amount;
	}

	

	
}
