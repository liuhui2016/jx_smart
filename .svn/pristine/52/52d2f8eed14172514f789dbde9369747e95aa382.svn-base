package com.game.bmanager.action;

/**
 * 加入批量操作类
 */

import java.util.Date;
import java.util.List;

import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import com.game.services.account.AccountManager;
import com.game.services.account.DomainManager;
import com.game.smvc.entity.JxBatch;
import com.game.smvc.entity.JxOrder;
import com.game.smvc.service.IJxBatchService;
import com.game.smvc.service.IJxOrderService;
import com.game.bmanager.service.IJxPartnerService;
import com.game.entity.account.User;
import com.game.modules.orm.Page;
import com.game.modules.orm.PropertyFilter;
import com.game.modules.orm.hibernate.HibernateUtils;
import com.game.modules.web.CrudActionSupport;
import com.game.modules.web.struts2.Struts2Utils;

@Namespace("/bmanager/order")
@Results({ @Result(name = "reload", location = "batch.action?authId=${authId}", type = "redirect") })
public class BatchAction extends CrudActionSupport<JxBatch>{
	/**
	 * 
	 */
	private static final long serialVersionUID = 7680327260962182295L;
	
	@Autowired
	private IJxOrderService orderService;
	@Autowired
	private DomainManager domainManager;
	@Autowired
	private AccountManager accountManager;
	@Autowired
    private IJxPartnerService partnerService;
	@Autowired
	private IJxBatchService jxBatchService;
	private JxOrder order;
	
	private String ord_no;
	private JxBatch batch;
	private User user;
	private Long id;
	private Long oldId;
	private List<Long> ids;
	
	private Page<JxBatch> page = new Page<JxBatch>(15);
	
	@Override
	public JxBatch getModel() {
		if (this.id != null) {
			this.batch = ((JxBatch) jxBatchService.get(this.id));
		} else {
			this.batch = new JxBatch();
		}
		if(user==null){
	        user=super.getUser(); 
	    }
		return batch;
	}
	
	@Override
	public String delete() throws Exception {
		System.out.println("---批量删除---");
		//获取前台隐藏域存着的选中的复选框的value
		String id = Struts2Utils.getRequest().getParameter("checkedIds");
		String s = id.substring(1);
		//进行分割存到数组
		/*String checkedIds[]=id.split(",");
		String temp="";
		for(int i =0;i<checkedIds.length;i++){
			if(!checkedIds[i].equals("")){
				temp=checkedIds[i];
				System.out.println("temp:"+temp);
				//根据id 修改订单提现状态
				//int ModifyTheOrderBasedTradeState = jxBatchService.ModifyTheOrderBasedTradeState();
				int ModifyTheOrderBasedOnId = jxBatchService.ModifyTheOrderBasedOnId(temp);
			}
		}*/
		int ModifyTheOrderBasedTradeState = jxBatchService.ModifyTheOrderBasedTradeState(s);
		int ModifyTheOrderBasedOnId = jxBatchService.ModifyTheOrderBasedOnId(s);
		
		List<PropertyFilter> filters = HibernateUtils
				.buildPropertyFilters(Struts2Utils.getRequest());
		if (!this.page.isOrderBySetted()) {
			this.page.setOrderBy("id");
			this.page.setOrder("desc");
		}
		page = jxBatchService.searchPage(page, filters);
		return SUCCESS;
	}

	@Override
	public String input() throws Exception {
		return SUCCESS;
	}

	@Override
	public String list() throws Exception {
		System.out.println("---加入批量操作---");
		List<PropertyFilter> filters = HibernateUtils
				.buildPropertyFilters(Struts2Utils.getRequest());
		if (!this.page.isOrderBySetted()) {
			this.page.setOrderBy("id");
			this.page.setOrder("desc");
		}
		page = jxBatchService.searchPage(page, filters);
		return SUCCESS;
	}
	
	public String updatetobatch() throws Exception {
		System.out.println("---批量操作修改---");
		System.out.println("id:"+batch.getOrd_id());
		
		List<PropertyFilter> filters = HibernateUtils
				.buildPropertyFilters(Struts2Utils.getRequest());
		if (!this.page.isOrderBySetted()) {
			this.page.setOrderBy("id");
			this.page.setOrder("desc");
		}
		page = jxBatchService.searchPage(page, filters);
		return SUCCESS;
	}
	
	//加入批量操作
	public String inserinto() throws Exception {
		System.out.println("---开始添加批量信息---");
		JxOrder jxOrder = orderService.findUnique("from jx_order where ord_no = '"+batch.getOrd_no()+"'");
		JxBatch jx_batch = jxBatchService.findUnique("from jx_batch where ord_no = '"+batch.getOrd_no()+"'");
		if(jx_batch == null){
			JxBatch batch = new JxBatch();
			batch.setAdr_id(jxOrder.getAdr_id());
			batch.setFim_ord_no(jxOrder.getFim_ord_no());
			batch.setOrd_addtime(jxOrder.getOrd_addtime());
			batch.setOrd_color(jxOrder.getOrd_color());
			batch.setOrd_id(jxOrder.getOrd_id());
			batch.setOrd_imgurl(jxOrder.getOrd_imgurl());
			batch.setOrd_managerno(jxOrder.getOrd_managerno());
			batch.setOrd_modtime(jxOrder.getOrd_modtime());
			batch.setOrd_multiple(jxOrder.getOrd_multiple());
			batch.setOrd_no(jxOrder.getOrd_no());
			batch.setOrd_ordertype(jxOrder.getOrd_ordertype());
			batch.setOrd_phone(jxOrder.getOrd_phone());
			batch.setOrd_pledge(jxOrder.getOrd_pledge());
			batch.setOrd_price(jxOrder.getOrd_price());
			batch.setOrd_priceper(jxOrder.getOrd_priceper());
			batch.setOrd_proname(jxOrder.getOrd_proname());
			batch.setOrd_protypeid(jxOrder.getOrd_protypeid());
			batch.setOrd_receivename(jxOrder.getOrd_receivename());
			batch.setOrd_sertime(jxOrder.getOrd_sertime());
			batch.setOrd_status(jxOrder.getOrd_status());
			batch.setOrd_way(jxOrder.getOrd_way());
			batch.setPro_day(jxOrder.getPro_day());
			batch.setPro_id(jxOrder.getPro_id());
			batch.setPro_no(jxOrder.getPro_no());
			batch.setPro_restflow(jxOrder.getPro_restflow());
			batch.setTrade_state(jxOrder.getTrade_state());
			batch.setU_id(jxOrder.getU_id());
			jxBatchService.save(batch);
		}else{
			jx_batch.setTrade_state(jxOrder.getTrade_state());
		}
		
		List<PropertyFilter> filters = HibernateUtils
				.buildPropertyFilters(Struts2Utils.getRequest());
		if (!this.page.isOrderBySetted()) {
			this.page.setOrderBy("id");
			this.page.setOrder("desc");
		}
		page = jxBatchService.searchPage(page, filters);
		return SUCCESS;
	}

	
	
	public JxOrder getOrder() {
		return order;
	}

	public void setOrder(JxOrder order) {
		this.order = order;
	}
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	
	public JxBatch getBatch() {
		return batch;
	}

	public void setBatch(JxBatch batch) {
		this.batch = batch;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	protected void prepareModel() throws Exception {
		
	}

	@Override
	public String save() throws Exception {
		return null;
	}

	public Page<JxBatch> getPage() {
		return page;
	}

	public void setPage(Page<JxBatch> page) {
		this.page = page;
	}

	public List<Long> getIds() {
		return ids;
	}

	public void setIds(List<Long> ids) {
		this.ids = ids;
	}

	public Long getOldId() {
		return oldId;
	}

	public void setOldId(Long oldId) {
		this.oldId = oldId;
	}

	public String getOro_no() {
		return ord_no;
	}

	public void setPro_no(String ord_no) {
		this.ord_no = ord_no;
	}

}




