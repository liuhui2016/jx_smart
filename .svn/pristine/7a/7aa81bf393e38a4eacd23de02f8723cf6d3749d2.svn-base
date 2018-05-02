package com.game.bmanager.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Map;

import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.domain.AlipayFundTransOrderQueryModel;
import com.alipay.api.domain.AlipayFundTransToaccountTransferModel;
import com.alipay.api.request.AlipayFundTransOrderQueryRequest;
import com.alipay.api.request.AlipayFundTransToaccountTransferRequest;
import com.alipay.api.response.AlipayFundTransOrderQueryResponse;
import com.alipay.api.response.AlipayFundTransToaccountTransferResponse;
import com.game.bmanager.entity.JxDrawPeople;
import com.game.bmanager.entity.JxPartnerRebate;
import com.game.bmanager.entity.JxWithdrawalOrder;
import com.game.bmanager.service.IJxDrawPeopleService;
import com.game.bmanager.service.IJxPartnerRebateService;
import com.game.bmanager.service.IJxWithdrawalOrderService;
import com.game.entity.account.User;
import com.game.modules.orm.Page;
import com.game.modules.orm.PropertyFilter;
import com.game.modules.orm.hibernate.HibernateUtils;
import com.game.modules.web.CrudActionSupport;
import com.game.modules.web.struts2.Struts2Utils;
import com.game.services.account.AccountManager;
import com.game.services.account.DomainManager;
import com.game.smvc.controller.PushPartnerController;
import com.game.smvc.entity.JxPartnerMessages;
import com.game.smvc.util.IdentifyingUtil;
import com.game.smvc.util.RandomUtil;
import com.game.smvc.payUtil.AlipayConfigs;
import com.game.smvc.service.IJxOrderService;
import com.game.smvc.service.IJxPartnerMessagesService;

@Namespace("/bmanager/trade")
@Results({ @Result(name = "reload", location = "trades.action?authId=${authId}", type = "redirect") })
public class TradesAction extends CrudActionSupport<JxWithdrawalOrder> {

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
	@Autowired
	IJxOrderService jxOrderService;
	@Autowired
	private IJxPartnerMessagesService jxPartnerMessagesService;
	
	@Autowired
	private DomainManager domainManager;
	@Autowired
	private AccountManager accountManager;
	private JxWithdrawalOrder jxWithdrawalOrder;
	
	private User user;
	private String withdrawal_order;
	private JxPartnerRebate jxPartnerRebate;

	private Long id;
	private Long oldId;
	private List<Long> ids;
	private Page<JxWithdrawalOrder> page = new Page<JxWithdrawalOrder>(15);
	private Page<JxPartnerRebate> pages = new Page<JxPartnerRebate>(15);

	@Override
	public JxWithdrawalOrder getModel() {
		if (this.id != null) {
			this.jxWithdrawalOrder = ((JxWithdrawalOrder) jxWithdrawalOrderService
					.get(this.id));
		} else {
			this.jxWithdrawalOrder = new JxWithdrawalOrder();
		}
		
		if (this.id != null) {
			this.jxPartnerRebate = ((JxPartnerRebate) jxPartnerRebateService
					.get(this.id));
		} else {
			this.jxPartnerRebate = new JxPartnerRebate();
		}
		
		if (user == null) {
			user = super.getUser();
		}
		
		return jxWithdrawalOrder;
	}
	
	//修改比例
	public String updateSave() throws Exception {
		return "updates";
	}
	
	public String updateSaves() throws Exception {
		
		Float wdl_fee = jxWithdrawalOrder.getWdl_fee();
		JxWithdrawalOrder jxWithdrawalOrder = jxWithdrawalOrderService
				.findUnique("from JxWithdrawalOrder where withdrawal_order = '"
						+ withdrawal_order + "'");
		Float service_fee = jxWithdrawalOrder.getBuy_combined() * wdl_fee;
		Float f_renewal = jxWithdrawalOrder.getRenewal_combined() * wdl_fee;
		
		//服务费和服务费续费
		jxWithdrawalOrder.setService_fee(service_fee);
		jxWithdrawalOrder.setF_renewal(f_renewal);
		
		Float f_installation =  jxWithdrawalOrder.getF_installation();
		Float lower_rebate = jxWithdrawalOrder.getLower_rebate();
		
		//总费用
		jxWithdrawalOrder.setWithdrawal_amount(service_fee + f_renewal + f_installation + lower_rebate);
		jxWithdrawalOrder.setTotal_amount(service_fee + f_renewal + f_installation + lower_rebate);
		
		//修改后的比例
		jxWithdrawalOrder.setWdl_fee(wdl_fee);
		jxWithdrawalOrderService.save(jxWithdrawalOrder);
		
		String alias = jxWithdrawalOrder.getUser_number();
		String title = "返利比例修改消息";
		String content = "您发起的提现单(" + withdrawal_order + "),比例已修改为 ："+wdl_fee;
		int p_type = 13;
		PushPartnerController.PartnerMssage(alias, title, content);
		JxPartnerMessages mess = PushPartnerController.partnerMessage(
				withdrawal_order, content, alias, title, p_type);
		jxPartnerMessagesService.save(mess);
		
		page = jxWithdrawalOrderService.dimQueryOfRebates(page,withdrawal_order);
		return SUCCESS;
	}

	@Override
	public String delete() throws Exception {
		return null;
	}

	@Override
	public String input() throws Exception {
		return null;
	}

	@Override
	public String list() throws Exception {
		List<PropertyFilter> filters = HibernateUtils
				.buildPropertyFilters(Struts2Utils.getRequest());
		if (!this.page.isOrderBySetted()) {
			this.page.setOrderBy("withdrawal_state,add_time");
			this.page.setOrder("asc,desc");
		}
		String userid = user.getUsername();
		if("admin".equals(userid)){
			page = jxWithdrawalOrderService.searchPage(page, filters);
		}else{
			page = jxWithdrawalOrderService.dimQueryOfUserid(page,userid);
			
		}
		return SUCCESS;
	}
	
	public String lists() throws Exception {
		page = jxWithdrawalOrderService.dimQueryOfRebates(page,withdrawal_order);
		return SUCCESS;
	}

	@Override
	protected void prepareModel() throws Exception {

	}

	@Override
	public String save() throws Exception {
		System.out.println("订单" + withdrawal_order);
		String out_biz_no = withdrawal_order;
		JxWithdrawalOrder jxWithdrawalOrder = jxWithdrawalOrderService
				.findUnique("from JxWithdrawalOrder where withdrawal_order = '"
						+ out_biz_no + "' and withdrawal_state = 0");
		if (jxWithdrawalOrder == null) {
			page = jxWithdrawalOrderService.dimQueryOfRebates(page, out_biz_no);
			return ERROR;

		}
		String person = jxWithdrawalOrder.getAudit_person();
		System.out.println("审核人:" + person);
		if (jxWithdrawalOrder.getAudit_person() != null
				&& !person.equals("admin")) {
			page = jxWithdrawalOrderService.dimQueryOfRebates(page, out_biz_no);
			return SUCCESS;
		}
		Date time = new Date();
		GregorianCalendar gc = new GregorianCalendar();
		gc.setTime(time);
		gc.add(GregorianCalendar.MINUTE, 5);
		Date t = gc.getTime();
		jxWithdrawalOrder.setWithdrawal_state(3);
		jxWithdrawalOrder.setAudit_time(time);
		jxWithdrawalOrder.setArrive_time(t);
		jxWithdrawalOrderService.save(jxWithdrawalOrder);
		int update_state = jxDrawPeopleService.findupdate_states(withdrawal_order);
		// 提现消息推送
		String alias = jxWithdrawalOrder.getUser_number();
		String title = "提现消息";
		String content = "您刚发起的提现单(" + out_biz_no
				+ "),已经审核成功,预计5分钟内到账，具体到账时间以支付宝为准。";
		int p_type = 8;
		PushPartnerController.PartnerMssage(alias, title, content);
		JxPartnerMessages mess = PushPartnerController.partnerMessage(
				out_biz_no, content, alias, title, p_type);
		jxPartnerMessagesService.save(mess);
		// 开启转账功能
		if (IdentifyingUtil.isPay() == 0) {
			String date = transfer(out_biz_no);
			System.out.println("date:"+date);
			if ("10000".equals(date)) {
				return "successes";
			} else {
				return "unsuccesses";
			}

		} else {
			JxPartnerRebate jxPartnerRebate = jxPartnerRebateService
					.findUnique("from jx_partner_rebate where withdrawal_order = '"
							+ out_biz_no + "'");
			if (jxPartnerRebate == null) {
				page = jxWithdrawalOrderService.dimQueryOfRebates(page,
						out_biz_no);
				return "unsuccesses";//提现单号错误
			}

			jxWithdrawalOrder.setWithdrawal_state(200);
			jxWithdrawalOrder.setLast_modtime(new Date());
			jxWithdrawalOrder.setArrive_time(new Date());// 到账时间
			
			// 取出最后一次提现的时间
			List<Map<String, Object>> mm = jxPartnerRebateService
					.findLastAddtimes(jxPartnerRebate.getUser_name());
			String last_add_time = null;
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			if (mm.size() <= 0) {
				last_add_time = "1970-01-01 00:00:00";
			} else {
				Map<String, Object> ma = mm.get(0);
				Date s = (Date) ma.get("add_time");
				last_add_time = sdf.format(s);
			}

			jxPartnerRebate.setW_state(3);
			jxPartnerRebate.setWithdrawal_state(200);
			Date at = jxPartnerRebate.getAdd_time();
			//Date mt = jxPartnerRebate.getMod_time();
			String addtime = sdf.format(at);
			//String modtime = sdf.format(mt);
			String user_name = jxPartnerRebate.getUser_name();
			// 设置订单状态
			int jxOrder = jxOrderService.updateTradeStateToSuccess(addtime,
					last_add_time, user_name);
			jxPartnerRebateService.save(jxPartnerRebate);
			jxWithdrawalOrderService.save(jxWithdrawalOrder);
			System.out.println("0000000111");
			return "successes";
		}
	}
	
	// 转账逻辑
		private String transfer(String out_biz_no) throws AlipayApiException {
			JxWithdrawalOrder withdrawalOrder = jxWithdrawalOrderService
					.findUnique("from JxWithdrawalOrder where withdrawal_order = '"
							+ out_biz_no + "' and withdrawal_state = 3 ");
			String payee_type = "ALIPAY_LOGONID";// 收款方账户类型
			String gatewayUrl = AlipayConfigs.gatewayUrl;
			String app_id = AlipayConfigs.app_id;
			String payee_account = withdrawalOrder.getPay_account();
			String amount = withdrawalOrder.getWithdrawal_amount() + "";// 转账金额
			float price1 = (float) (Math.round(Float.valueOf(amount) * 100)) / 100;
			amount = price1 + "";
			String rsa_private = AlipayConfigs.private_key;// 商户私钥，pkcs8格式
			String rsa_public = AlipayConfigs.alipay_public_zh_key;// 支付宝公钥
			String remark = "净喜转账";
			AlipayClient alipayClient = new DefaultAlipayClient(gatewayUrl, app_id,
					rsa_private, AlipayConfigs.format, AlipayConfigs.input_charset,
					rsa_public, AlipayConfigs.sign_type);
			AlipayFundTransToaccountTransferRequest requests = new AlipayFundTransToaccountTransferRequest();
			AlipayFundTransToaccountTransferModel model = new AlipayFundTransToaccountTransferModel();
			// 商户转账唯一订单号
			model.setOutBizNo(out_biz_no);
			// 收款方账户类型。
			// 1、ALIPAY_USERID：pid ,以2088开头的16位纯数字组成。
			// 2、ALIPAY_LOGONID：支付宝登录号(邮箱或手机号)
			model.setPayeeType(payee_type);
			// 收款方账户。与payee_type配合使用。付款方和收款方不能是同一个账户。
			model.setPayeeAccount(payee_account);
			// 测试金额必须大于等于0.1，只支持2位小数，小数点前最大支持13位
			model.setAmount(amount);
			// 当付款方为企业账户且转账金额达到（大于等于）50000元，remark不能为空。
			model.setRemark(remark);
			requests.setBizModel(model);
			AlipayFundTransToaccountTransferResponse response = alipayClient
					.execute(requests);
			System.out.println(response.getBody());
			System.out.println("code值"+response.getCode());
			System.out.println(response.getSubMsg());
			String reason = response.getSubMsg();
			if (response.isSuccess()) {
				System.out.println("调用成功");
				// 成功之后的逻辑
				// 设置订单状态
				// 取出最后一次提现的时间
				List<Map<String, Object>> mm = jxPartnerRebateService
						.findLastAddtimes(jxPartnerRebate.getUser_name());
				String last_add_time = null;
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				if (mm.size() <= 0) {
					last_add_time = "1970-01-01 00:00:00";
				} else {
					Map<String, Object> ma = mm.get(0);
					Date s = (Date) ma.get("add_time");
					last_add_time = sdf.format(s);
				}

				JxPartnerRebate jxPartnerRebate = jxPartnerRebateService
						.findUnique("from jx_partner_rebate where withdrawal_order = '"
								+ out_biz_no + "' ");
				
				withdrawalOrder.setWithdrawal_state(200);
				withdrawalOrder.setLast_modtime(new Date());
				withdrawalOrder.setArrive_time(new Date());// 到账时间
				jxPartnerRebate.setW_state(3);
				jxPartnerRebate.setWithdrawal_state(200);
				Date at = jxPartnerRebate.getAdd_time();
				String addtime = sdf.format(at);
				String user_name = jxPartnerRebate.getUser_name();
				// 设置订单状态
				int jxOrder = jxOrderService.updateTradeStateToSuccess(addtime,
						last_add_time, user_name);
				jxPartnerRebateService.save(jxPartnerRebate);
				jxWithdrawalOrderService.save(withdrawalOrder);
				// 消息推送
				String alias = withdrawalOrder.getUser_number();
				String title = "提现消息";
				String content = "您刚发起的提现单(" + out_biz_no + "),已成功到账。";
				PushPartnerController.PartnerMssage(alias, title, content);
				int p_type = 10;
				JxPartnerMessages mess = PushPartnerController.partnerMessage(
						out_biz_no, content, alias, title, p_type);
				jxPartnerMessagesService.save(mess);
				return response.getCode();
			} else {
				System.out.println("调用失败");
				// 失败的逻辑
				// 查询账单是否到账
				String messages = enquiries(out_biz_no, reason);
				return messages;
			}
		}

		// 到账查询
		@SuppressWarnings("unused")
		private String enquiries(String out_biz_no, String reason)
				throws AlipayApiException {
			System.out.println("订单号:" + out_biz_no);
			String rsa_private = AlipayConfigs.private_key;
			JxWithdrawalOrder withdrawalOrder = jxWithdrawalOrderService
					.findUnique("from JxWithdrawalOrder where withdrawal_order = '"
							+ out_biz_no + "' and withdrawal_state = 3");
			AlipayClient alipayClient = new DefaultAlipayClient(
					AlipayConfigs.gatewayUrl, AlipayConfigs.app_id, rsa_private,
					AlipayConfigs.format, AlipayConfigs.input_charset,
					AlipayConfigs.alipay_public_zh_key, AlipayConfigs.sign_type);
			AlipayFundTransOrderQueryRequest request1 = new AlipayFundTransOrderQueryRequest();
			AlipayFundTransOrderQueryModel model = new AlipayFundTransOrderQueryModel();
			// 商户转账唯一订单号
			model.setOutBizNo(out_biz_no);
			// 支付宝转账单据号：和商户转账唯一订单号不能同时为空。二选一传入
			request1.setBizModel(model);
			AlipayFundTransOrderQueryResponse response = alipayClient
					.execute(request1);

			// 取出最后一次提现的时间
			List<Map<String, Object>> mm = jxPartnerRebateService
					.findLastAddtimes(jxPartnerRebate.getUser_name());
			String last_add_time = null;
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			if (mm.size() <= 0) {
				last_add_time = "0000-00-00 00:00:00";
			} else {
				Map<String, Object> ma = mm.get(0);
				Date s = (Date) ma.get("add_time");
				last_add_time = sdf.format(s);
			}

			if (response.isSuccess()) {
				System.out.println("调用成功1");
				// 成功之后的逻辑
				// 设置订单状态
				JxPartnerRebate jxPartnerRebate = jxPartnerRebateService
						.findUnique("from jx_partner_rebate where withdrawal_order = '"
								+ out_biz_no + "'");
				withdrawalOrder.setWithdrawal_state(200);
				withdrawalOrder.setLast_modtime(new Date());
				withdrawalOrder.setArrive_time(new Date());// 到账时间
				jxPartnerRebate.setW_state(3);
				jxPartnerRebate.setWithdrawal_state(200);
				Date at = jxPartnerRebate.getAdd_time();
				//Date mt = jxPartnerRebate.getMod_time();
				String addtime = sdf.format(at);
				//String modtime = sdf.format(mt);
				String user_name = jxPartnerRebate.getUser_name();
				// 设置订单状态
				int jxOrder = jxOrderService.updateTradeStateToSuccess(addtime,
						last_add_time, user_name);
				jxPartnerRebateService.save(jxPartnerRebate);
				jxWithdrawalOrderService.save(withdrawalOrder);
				// 消息推送
				String alias = withdrawalOrder.getUser_number();
				String title = "提现消息";
				String content = "您刚发起的提现单(" + out_biz_no + "),已成功到账。";
				PushPartnerController.PartnerMssage(alias, title, content);
				int p_type = 10;
				JxPartnerMessages mess = PushPartnerController.partnerMessage(
						out_biz_no, content, alias, title, p_type);
				jxPartnerMessagesService.save(mess);
				return response.getCode();
			} else {
				System.out.println("调用失败1");

				withdrawalOrder.setWithdrawal_state(4);
				withdrawalOrder.setLast_modtime(new Date());
				withdrawalOrder.setWithdrawal_reason(reason);
				JxPartnerRebate jxPartnerRebate = jxPartnerRebateService
						.findUnique("from jx_partner_rebate where withdrawal_order = '"
								+ out_biz_no + "'");
				jxPartnerRebate.setW_state(1);
				jxPartnerRebate.setWithdrawal_state(4);
				Date at = jxPartnerRebate.getAdd_time();
				//Date mt = jxPartnerRebate.getMod_time();
				String addtime = sdf.format(at);
				//String modtime = sdf.format(mt);
				String user_name = jxPartnerRebate.getUser_name();
				
				// 解除冻结
				int jxOrder = jxOrderService.updateTradeStateToFail(addtime,
						last_add_time, user_name);
				jxPartnerRebateService.save(jxPartnerRebate);
				jxWithdrawalOrderService.save(withdrawalOrder);
				// 消息推送
				String alias = withdrawalOrder.getUser_number();
				String title = "提现消息";
				String content = "您刚发起的提现单(" + out_biz_no + "),处理失败。具体原因可查看提现详情";
				PushPartnerController.PartnerMssage(alias, title, content);
				int p_type = 11;
				JxPartnerMessages mess = PushPartnerController.partnerMessage(
						out_biz_no, content, alias, title, p_type);
				jxPartnerMessagesService.save(mess);
				return response.getCode();
				// 失败的逻辑
			}

		}

	public JxWithdrawalOrder getJxWithdrawalOrder() {
		return jxWithdrawalOrder;
	}

	public void setJxWithdrawalOrder(JxWithdrawalOrder jxWithdrawalOrder) {
		this.jxWithdrawalOrder = jxWithdrawalOrder;
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

	public Page<JxWithdrawalOrder> getPage() {
		return page;
	}

	public void setPage(Page<JxWithdrawalOrder> page) {
		this.page = page;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public JxPartnerRebate getJxPartnerRebate() {
		return jxPartnerRebate;
	}

	public void setJxPartnerRebate(JxPartnerRebate jxPartnerRebate) {
		this.jxPartnerRebate = jxPartnerRebate;
	}

	public String getWithdrawal_order() {
		return withdrawal_order;
	}

	public void setWithdrawal_order(String withdrawal_order) {
		this.withdrawal_order = withdrawal_order;
	}

	public Page<JxPartnerRebate> getPages() {
		return pages;
	}

	public void setPages(Page<JxPartnerRebate> pages) {
		this.pages = pages;
	}
	
}
