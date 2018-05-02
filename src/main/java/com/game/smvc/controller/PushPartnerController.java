package com.game.smvc.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.game.push.quickin.PushPartnerBase;
import com.game.smvc.entity.JxMessages;
import com.game.smvc.entity.JxPartnerMessages;
import com.game.smvc.service.IJxMessageService;
import com.game.smvc.service.IJxOrderItemService;
import com.game.smvc.service.IJxOrderService;
import com.game.smvc.service.IJxPayWayService;
import com.game.smvc.service.IJxProductService;
import com.gexin.rp.sdk.base.IIGtPush;
import com.gexin.rp.sdk.base.IPushResult;
import com.gexin.rp.sdk.base.impl.SingleMessage;
import com.gexin.rp.sdk.base.impl.Target;
import com.gexin.rp.sdk.base.payload.APNPayload;
import com.gexin.rp.sdk.http.IGtPush;
import com.gexin.rp.sdk.template.TransmissionTemplate;

@Controller
@RequestMapping({ "/smvc" })
public class PushPartnerController extends PushPartnerBase{

	@Autowired
	IJxOrderService jxOrderService;
	@Autowired
	IJxProductService productService;
	@Autowired
	private IJxPayWayService payWayService;
	@Autowired
	public static IJxMessageService messageService;
	@Autowired
	private IJxOrderItemService jxOrderItemServic;

	/**
	 * 合伙人消息推送模板类
	 * 2017/08/17
	 * @param alias
	 * @param title
	 * @param content
	 * @return
	 */
	public static TransmissionTemplate PartnerMssage(String alias, String title,
			String content) {

		IIGtPush push = new IGtPush(url, appKey, masterSecret);
		SingleMessage message = new SingleMessage();

		TransmissionTemplate template = new TransmissionTemplate();
		template.setAppId(appId);
		template.setAppkey(appKey);
		template.setTransmissionContent(content);
		template.setTransmissionType(2); // 收到消息是否立即启动应用，1为立即启动，2则广播等待客户端自启动  
		APNPayload payload = new APNPayload();
		payload.setBadge(+1);
		/*payload.setContentAvailable(1);*/
		payload.setSound("default");
		payload.setCategory("$由客户端定义");

		// 简单模式APNPayload.SimpleMsg
		payload.setAlertMsg(new APNPayload.SimpleAlertMsg(title));
		// 字典模式使用下者

		// payload.setAlertMsg(getDictionaryAlertMsg());
		template.setAPNInfo(payload);
		message.setData(template);
		message.setOffline(true); // 用户当前不在线时，是否离线存储,可选
		message.setOfflineExpireTime(72 * 3600 * 1000); // 离线有效时间，单位为毫秒，可选
		Target target1 = new Target();
		target1.setAppId(appId);
		target1.setAlias(alias);
		// target1.setClientId(alias);
		IPushResult ret = push.pushMessageToSingle(message, target1);
		System.out.println(ret.getResponse().toString());
		return template;

	}
	
	
	public static JxPartnerMessages partnerMessage(String orderno,String content,String ord_managerno,String p_title,int p_type) {
		JxPartnerMessages messages = new JxPartnerMessages();
		messages.setMessage_time(new Date());
		messages.setNextparams(orderno);
		messages.setP_content(content);
		messages.setP_isread(0);
		messages.setP_type(p_type);
		messages.setP_name(ord_managerno);
		messages.setP_title(p_title);
		return messages;
      
    }
	
	/**
	 * 售后消息
	 * 说明:消息类型从1001开始  
	 * @param orderno
	 * @param content
	 * @param ord_managerno
	 * @param p_title
	 * @param p_type
	 * @return
	 */
	public static JxPartnerMessages partnerAfterSaleMessage(String phone,String content,String ord_managerno,String p_title,int p_type) {
		JxPartnerMessages messages = new JxPartnerMessages();
		messages.setMessage_time(new Date());
		messages.setNextparams(phone);
		messages.setP_content(content);
		messages.setP_isread(0);
		messages.setP_type(p_type);
		messages.setP_name(ord_managerno);
		messages.setP_title(p_title);
		return messages;
      
    }

}
