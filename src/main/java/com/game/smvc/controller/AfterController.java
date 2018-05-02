package com.game.smvc.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.game.bmanager.entity.JxFilterWarning;
import com.game.bmanager.service.IJxFilterLifeService;
import com.game.bmanager.service.IJxFilterWarningService;
import com.game.smvc.dao.WebDao;
import com.game.smvc.entity.JxAppraise;
import com.game.smvc.entity.JxFilterAfterSales;
import com.game.smvc.entity.JxPartnerMessages;
import com.game.smvc.entity.result.Errors;
import com.game.smvc.entity.result.Result;
import com.game.smvc.entity.result.SecretResult;
import com.game.smvc.service.IJxAppraiseService;
import com.game.smvc.service.IJxFilterAfterSalesService;
import com.game.smvc.service.IJxMessageService;
import com.game.smvc.service.IJxPartnerMessagesService;
import com.game.smvc.service.IJxUserWapService;
import com.game.smvc.util.HttpUtil;

/**
 * 售后的Controller
 * 所有售后信息
 * @author Administrator
 *
 */
@Controller
@RequestMapping({ "/after" })
public class AfterController {
	@Autowired
	private WebDao webDao;
	@Autowired
	private IJxFilterAfterSalesService jxFilterAfterSalesService;
	@Autowired
	private IJxMessageService messageService;
	@Autowired
	private IJxPartnerMessagesService jxPartnerMessagesService;
	@Autowired
	private IJxUserWapService userWapService;
	@Autowired
    private IJxFilterLifeService jxFilterLifeService;
	@Autowired
    private IJxAppraiseService jxAppraiseService;
	@Autowired
	private IJxFilterWarningService filterWarningService;
	
	/**
	 * @Inject
	 * 点击售后与评价跳转的界面
	 * 售后与评价 
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/users/afterofappraise")
	public Result afterOfAppraise(HttpServletRequest request) {
		try {
			System.out.println("---查看售后与评价任务---");
			String params = HttpUtil.getRquestParamsByIO(request);
			JSONObject param = JSONObject.fromObject(params);
			String fas_state = param.getString("fas_state");//售后状态1进行，200为完成,100已评价
			String u_id = param.getString("userid");
			int page = Integer.parseInt(param.getString("page"));
			List<Map<String,Object>> list = jxFilterAfterSalesService.findAfterInformationOfState(fas_state,u_id,(page -1)*10);
			/*String fas_type = null;
			for(int i = 0;i<list.size();i++){
				Map<String,Object> map = list.get(i);
				int fas_types = (Integer) map.get("fas_type");
				if(fas_types == 1){
					fas_type = "滤芯更换";
				}else if(fas_types == 2){
					fas_type = "设备报修";
				}else if(fas_types == 3){
					fas_type = "其他";
				}
				map.put("fas_type", fas_type);
			}*/
			return new SecretResult(Errors.OK, list);
		} catch (Exception e) {
			e.printStackTrace();
			return new Result(Errors.EXCEPTION_UNKNOW);
		}
	}
	
	/**
	 * 查看售后详情
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/users/afterthedetails")
	public Result afterTheDetails(HttpServletRequest request) {
		try {
			System.out.println("---查看售后详情---");
			String params = HttpUtil.getRquestParamsByIO(request);
			JSONObject param = JSONObject.fromObject(params);
			String id = param.getString("id");//售后状态1进行，200为完成
			List<Map<String,Object>> list = jxFilterAfterSalesService.findAfterthedetailsToId(id);
			return new SecretResult(Errors.OK, list);
		} catch (Exception e) {
			e.printStackTrace();
			return new Result(Errors.EXCEPTION_UNKNOW);
		}
	}
	
	/**
	 * 选择设备/故障设备
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/users/filterreplacement")
	public Result filterReplacement(HttpServletRequest request) {
		try {
			System.out.println("---选择售后机器---");
			String params = HttpUtil.getRquestParamsByIO(request);
			JSONObject param = JSONObject.fromObject(params);
			String userid = param.getString("userid");
			int page = Integer.parseInt(param.getString("page"));
			List<Map<String,Object>> list = jxFilterAfterSalesService.findFilterOfUserId(userid,(page -1)*10);
			return new SecretResult(Errors.OK, list);
		} catch (Exception e) {
			e.printStackTrace();
			return new Result(Errors.EXCEPTION_UNKNOW);
		}
	}
	
	/**
	 * 更换滤芯   ---》滤芯
	 * 滤芯需要百分比
	 * 根据设备码
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/users/cartridgereplacement")
	public Result cartridgeReplacement(HttpServletRequest request) {
		try {
			System.out.println("---查看滤芯---");
			String params = HttpUtil.getRquestParamsByIO(request);
			JSONObject param = JSONObject.fromObject(params);
			String pro_no = param.getString("pro_no");
			//List<Map<String,Object>> list = jxFilterAfterSalesService.findFilter(pro_no);
			List<Map<String, Object>> lx = this.userWapService
					.findStatusByproId(pro_no);
			if(lx.size()<=0){
				return new Result(Errors.NO_FILTER_MESSAGES);
			}
			//得到现在的滤芯
			Map<String, Object> map = lx.get(0);
			Object pp = map.get("pp");
			Object cto = map.get("cto");
			Object ro = map.get("ro");
			Object t33 = map.get("t33");
			Object wfr = map.get("wfr");
			
			double pps=Double.parseDouble(pp.toString());
			double ctos=Double.parseDouble(cto.toString());
			double ros=Double.parseDouble(ro.toString());
			double t33s=Double.parseDouble(t33.toString());
			double wfrs=Double.parseDouble(wfr.toString());
			String code = (String) map.get("code");
			
			//获得原始滤芯
			List<Map<String, Object>> list1 = jxFilterLifeService.queryFilterLifeByProvince(code);
			if(list1.size() <= 0){
				return new Result(Errors.NO_FILTER_MESSAGES_IN_THE_PROVINCES);
			}
			Map<String, Object> map1 = list1.get(0);
			Object ppss = map1.get("pp");
			Object ctoss = map1.get("cto");
			Object ross = map1.get("ro");
			Object t33ss = map1.get("t33");
			Object wfrss = map1.get("wfr");
			double yspp=Double.parseDouble(ppss.toString());
			double yscto=Double.parseDouble(ctoss.toString());
			double ysro=Double.parseDouble(ross.toString());
			double yst33=Double.parseDouble(t33ss.toString());
			double yswfr=Double.parseDouble(wfrss.toString());
			
			//计算滤芯百分比
			double p = (pps/yspp)*100;
			double c = (ctos/yscto)*100;
			double r = (ros/ysro)*100;
			double t = (t33s/yst33)*100;
			double w = (wfrs/yswfr)*100;
			
			//判断滤芯值
			if(p > 100){
				p = 100;
			}
			
			if(c > 100){
				c = 100;
			}
			
			if(r > 100){
				r =100;
			}
			if(t > 100){
				t = 100;
			}
			if(w > 100){
				w = 100;
			}
			List<Map<String, Object>> list = new ArrayList<Map<String,Object>>(); 
			Map<String, Object> m = new HashMap<String, Object>();
			m.put("proportion", (int)p);
			m.put("name", "pp滤芯");
			m.put("proflt_life", "pp");
			
			Map<String, Object> m1 = new HashMap<String, Object>();
			m1.put("proportion", (int)c);
			m1.put("name", "cto块状活性炭滤芯");
			m1.put("proflt_life", "cto");
			
			Map<String, Object> m2 = new HashMap<String, Object>();
			m2.put("proportion", (int)r);
			m2.put("name", "ro膜滤芯");
			m2.put("proflt_life", "ro");
			
			Map<String, Object> m3 = new HashMap<String, Object>();
			m3.put("proportion", (int)t);
			m3.put("name", "复合能量矿化滤芯");
			m3.put("proflt_life", "t33+wfr");
			/*m.put("cto", (int)c);
			m.put("ro", (int)r);
			m.put("t33", (int)t);
			m.put("wfr", (int)w);*/
			list.add(m);
			list.add(m1);
			list.add(m2);
			list.add(m3);
			return new SecretResult(Errors.OK, list);
		} catch (Exception e) {
			e.printStackTrace();
			return new Result(Errors.EXCEPTION_UNKNOW);
		}
	}
	
	/**
	 * 设备报修  ---》故障现象
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/users/fault")
	public Result fault(HttpServletRequest request) {
		try {
			System.out.println("---查看所有上架的故障现象---");
			String params = HttpUtil.getRquestParamsByIO(request);
			JSONObject param = JSONObject.fromObject(params);
			String is_shelves = param.getString("is_shelves");//是否上架
			List<Map<String,Object>> list = jxFilterAfterSalesService.findFault(is_shelves);
			return new SecretResult(Errors.OK, list);
		} catch (Exception e) {
			e.printStackTrace();
			return new Result(Errors.EXCEPTION_UNKNOW);
		}
	}
	

	/**
	 * 添加滤芯售后信息
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/users/addfilterafter")
	public Result addFilterAfter(HttpServletRequest request) {
		try {
			String params = HttpUtil.getRquestParamsByIO(request);
			JSONObject param = JSONObject.fromObject(params);
			String u_id = param.getString("userid");//用户id
			String pro_id = param.getString("pro_id");//机器类型
			String pro_name = param.getString("pro_name");//机器名字
			String ord_color = param.getString("ord_color");//颜色
			String make_time = param.getString("make_time");//预约时间
			String contact_person = param.getString("contact_person");//联系人
			String contact_way = param.getString("contact_way");//联系方式
			String user_address = param.getString("user_address");//地址
			String address_details = param.getString("address_details");//详细地址
			String pro_no = param.getString("pro_no");//机器码
			String ord_no = param.getString("ord_no");
			String ord_managerno = param.getString("ord_managerno");//合伙人编号
			String type = param.getString("fas_type");//售后类型
			String specific_reason = param.getString("specific_reason");//具体原因
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			
			if("1".equals(type)){
				System.out.println("---添加滤芯售后---");
				String proflt_life = param.getString("proflt_life");//滤芯
				String filter_name = param.getString("filter_name");//中午名字
				JxFilterAfterSales afterSales = new JxFilterAfterSales();
				afterSales.setU_id(Integer.parseInt(u_id));
				afterSales.setPro_no(pro_no);
				afterSales.setOrd_no(ord_no);
				afterSales.setPro_id(Integer.parseInt(pro_id));
				afterSales.setPro_name(pro_name);
				afterSales.setOrd_color(ord_color);
				afterSales.setMake_time(sdf.parse(make_time));
				afterSales.setContact_person(contact_person);
				afterSales.setContact_way(contact_way);
				afterSales.setUser_address(user_address);
				afterSales.setAddress_details(address_details);
				afterSales.setProflt_life(proflt_life);
				afterSales.setFilter_name(filter_name);
				afterSales.setSpecific_reason(specific_reason);
				afterSales.setOrd_managerno(ord_managerno);
				afterSales.setFas_state(1);//1进行中，200为完成
				afterSales.setFas_type(1);//1为更换滤芯
				afterSales.setFas_addtime(new Date());
				jxFilterAfterSalesService.save(afterSales);
				String p_title = "售后消息";
				String content = "亲~您名下的"+contact_way+"用户，设备由于，"+filter_name+"低于5%,发起了一条售后信息，请及时处理！";
				int p_type = 1001;
				JxPartnerMessages messages = PushPartnerController.partnerAfterSaleMessage(contact_way, content, ord_managerno, p_title,p_type);
				jxPartnerMessagesService.save(messages);
				PushPartnerController.PartnerMssage(ord_managerno, p_title, content);
				
			}else if("2".equals(type)){
				System.out.println("---添加设备报修售后---");
				String fault_cause = param.getString("fault_cause");//故障原因
				//String specific_reason = param.getString("specific_reason");//详细原因
				String fautl_url = param.getString("fautl_url");//图片地址
				JxFilterAfterSales afterSales = new JxFilterAfterSales();
				afterSales.setU_id(Integer.parseInt(u_id));
				afterSales.setPro_no(pro_no);
				afterSales.setOrd_no(ord_no);
				afterSales.setPro_id(Integer.parseInt(pro_id));
				afterSales.setPro_name(pro_name);
				afterSales.setOrd_color(ord_color);
				afterSales.setMake_time(sdf.parse(make_time));
				afterSales.setContact_person(contact_person);
				afterSales.setContact_way(contact_way);
				afterSales.setUser_address(user_address);
				afterSales.setAddress_details(address_details);
				afterSales.setFault_cause(fault_cause);
				afterSales.setFautl_url(fautl_url);
				afterSales.setSpecific_reason(specific_reason);
				afterSales.setOrd_managerno(ord_managerno);
				afterSales.setFas_state(1);//1进行中，200为完成
				afterSales.setFas_type(2);//2为设备报修
				afterSales.setFas_addtime(new Date());
				jxFilterAfterSalesService.save(afterSales);
				
				String p_title = "售后消息";
				String content = "亲~您名下的"+contact_way+"用户，设备由于，"+fault_cause+",发起了一条售后信息，请及时处理！";
				int p_type = 1002;
				JxPartnerMessages messages = PushPartnerController.partnerAfterSaleMessage(contact_way, content, ord_managerno, p_title,p_type);
				jxPartnerMessagesService.save(messages);
				PushPartnerController.PartnerMssage(ord_managerno, p_title, content);
				
			}else if("3".equals(type)){
				System.out.println("---添加其他售后信息---");
				//String specific_reason = param.getString("specific_reason");//详细原因
				String fautl_url = param.getString("fautl_url");//图片地址
				System.out.println("---添加其他售后信息---");
				JxFilterAfterSales afterSales = new JxFilterAfterSales();
				afterSales.setU_id(Integer.parseInt(u_id));
				afterSales.setPro_no(pro_no);
				afterSales.setOrd_no(ord_no);
				afterSales.setPro_id(Integer.parseInt(pro_id));
				afterSales.setPro_name(pro_name);
				afterSales.setOrd_color(ord_color);
				afterSales.setMake_time(sdf.parse(make_time));
				afterSales.setContact_person(contact_person);
				afterSales.setContact_way(contact_way);
				afterSales.setUser_address(user_address);
				afterSales.setAddress_details(address_details);
				afterSales.setFautl_url(fautl_url);
				afterSales.setSpecific_reason(specific_reason);
				afterSales.setOrd_managerno(ord_managerno);
				afterSales.setFas_state(1);//1进行中，200为完成
				afterSales.setFas_type(3);//2为设备报修
				afterSales.setFas_addtime(new Date());
				jxFilterAfterSalesService.save(afterSales);
				
				String p_title = "售后消息";
				String content = "亲~您名下的"+contact_way+"用户，设备由于其他问题，发起了一条售后信息，请及时处理！";
				int p_type = 1003;
				JxPartnerMessages messages = PushPartnerController.partnerAfterSaleMessage(contact_way, content, ord_managerno, p_title,p_type);
				jxPartnerMessagesService.save(messages);
				PushPartnerController.PartnerMssage(ord_managerno, p_title, content);
			}else{
				return new Result(Errors.THERE_IS_NO_MORE_AFTER_SALES_TYPE);
			}
			
			return new Result(Errors.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new Result(Errors.EXCEPTION_UNKNOW);
		}
	}
	
	
	/**
	 * 售后评价
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/users/appraise")
	public Result appraise(HttpServletRequest request) {
		try {
			System.out.println("---服务评价---");
			String params = HttpUtil.getRquestParamsByIO(request);
			JSONObject param = JSONObject.fromObject(params);
			String pro_no = param.getString("pro_no");//机器码
			String ord_no = param.getString("ord_no");//订单号
			String service_type = param.getString("service_type");//服务类型
			String service_master = param.getString("service_master");//服务师傅
			String service_master_phone = param.getString("service_master_phone");//服务师傅联系方式
			String evaluation_people = param.getString("evaluation_people");//评价人
			String evaluation_people_phone = param.getString("evaluation_people_phnoe");//评价人联系方式
			String u_id = param.getString("userid");//用户id
			String content = param.getString("content");//评价内容
			String appraise_url = param.getString("appraise_url");//评价图片url
			String is_badge = param.getString("is_badge");//是否戴工牌  0不带 1 是带
			String is_overalls = param.getString("is_overalls");//是否穿工作服
			String is_anonymous = param.getString("is_anonymous");//是否匿名
			String satisfaction = param.getString("satisfaction");//满意度 1，2，3，4，5
			String service_attitude = param.getString("service_attitude");//服务态度 1，2，3，4，5
			String ord_managerno = param.getString("ord_managerno");//所属合伙人
			String after_id = param.getString("id");//售后id
			
			JxAppraise appraise = jxAppraiseService.findUnique("from jx_appraise where after_id = '"+after_id+"'");
			if(appraise == null){
				JxAppraise jxAppraise = new JxAppraise();
				jxAppraise.setU_id(Integer.parseInt(u_id));
				jxAppraise.setOrd_no(ord_no);
				jxAppraise.setPro_no(pro_no);
				jxAppraise.setService_type(service_type);
				jxAppraise.setService_master(service_master);
				jxAppraise.setService_master_phone(service_master_phone);
				jxAppraise.setEvaluation_people(evaluation_people);
				jxAppraise.setEvaluation_people_phone(evaluation_people_phone);
				jxAppraise.setAe_content(content);
				jxAppraise.setAe_satisfaction(satisfaction);
				jxAppraise.setAfter_id(Integer.parseInt(after_id));
				jxAppraise.setAppraise_url(appraise_url);
				jxAppraise.setIs_badge(is_badge);
				jxAppraise.setIs_overalls(is_overalls);
				jxAppraise.setIs_anonymous(is_anonymous);
				jxAppraise.setOrd_managerno(ord_managerno);
				jxAppraise.setService_attitude(service_attitude);				
				jxAppraise.setAe_addtime(new Date());
				//根据after_id设置售后评价状态为已评价  0为未评价1为已评价
				JxFilterAfterSales afterSales = jxFilterAfterSalesService.findUnique("from jx_filter_after_sales where id = '"+after_id+"'");
				afterSales.setIs_appraise(1);
				afterSales.setFas_state(200);
				afterSales.setFas_modtime(new Date());
				int fas_type = afterSales.getFas_type();
				String proNo = afterSales.getPro_no();
				if(fas_type == 1){
					//滤芯更换成功，设置滤芯警告表状态
					String proflt_lifes[]=afterSales.getProflt_life().split(",");
					String temp="";
					for(int i =0;i<proflt_lifes.length;i++){
						if(!proflt_lifes[i].equals("")){
							temp=proflt_lifes[i];
							temp = temp + "滤芯";
							System.out.println("temp:"+temp);
							//根据机器码，滤芯名字，修改滤芯更换状态
							JxFilterWarning fw = filterWarningService.findUnique("from JxFilterWarning where pro_no  = '"+proNo+"' and filter_name='"+temp+"' and status=0");
							if (fw != null) {
								if (fw.getFilter_name().contains(temp)) {
									fw.setStatus(1);
									filterWarningService.save(fw);
								}
							}
						}
					}
				}
				jxAppraiseService.save(jxAppraise);
				jxFilterAfterSalesService.save(afterSales);
				return new Result(Errors.OK);
			}else{
				return new Result(Errors.THIS_ORDER_HAS_BEEN_EVALUATED);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new Result(Errors.EXCEPTION_UNKNOW);
		}
	}
	
	/**
	 * 查看评价详情
	 * 
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/users/appraisesparticulars")
	public Result appraisesParticulars(HttpServletRequest request) {
		try {
			String params = HttpUtil.getRquestParamsByIO(request);
			JSONObject jsonbject = JSONObject.fromObject(params);
			String after_id = jsonbject.getString("id");
			List<Map<String,Object>> list = jxAppraiseService.findAppraisesParticularsToId(after_id);
			if(list.size() > 0 ){
				return new SecretResult(Errors.OK, list);
			}else{
				return new Result(Errors.THE_ORDER_HAS_NOT_BEEN_EVALUATED);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			return new Result(Errors.EXCEPTION_UNKNOW);
		}
	}
	
	public static void main(String[] args) {
		Date date = new Date();
		System.out.println(date);
		System.out.println("-------------------------------------");
		long start = System.currentTimeMillis();
		for(int i = 0;i<1000;i++){
			System.out.println(i);
			System.out.println("i = "+i);
		}
		System.out.println("------------------------------------------------------------------");
		long ent = System.currentTimeMillis();
		System.out.println(ent-start);
	}
	
}
