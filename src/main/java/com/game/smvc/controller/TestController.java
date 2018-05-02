package com.game.smvc.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Timer;
import java.util.TimerTask;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import com.game.push.quickin.PushBaseTest;
import com.gexin.rp.sdk.base.IIGtPush;
import com.gexin.rp.sdk.base.IPushResult;
import com.gexin.rp.sdk.base.impl.SingleMessage;
import com.gexin.rp.sdk.base.impl.Target;
import com.gexin.rp.sdk.base.payload.APNPayload;
import com.gexin.rp.sdk.http.IGtPush;
import com.gexin.rp.sdk.template.TransmissionTemplate;
import com.mysql.fabric.xmlrpc.base.Data;

public class TestController extends PushBaseTest{

	public static TransmissionTemplate YHIOSMssage(String alias,String title,String content){
		
		IIGtPush push = new IGtPush(url, appKey, masterSecret);
		SingleMessage message = new SingleMessage();
	
	    TransmissionTemplate template = new TransmissionTemplate();
	    template.setAppId(appId);
	    template.setAppkey(appKey);
	    template.setTransmissionContent(content);
	    template.setTransmissionType(2);
	    APNPayload payload = new APNPayload();
	    payload.setBadge(+1);
	    //payload.setContentAvailable(1);
	    payload.setSound("default"); //通知铃声文件名，无声设置为"com.gexin.ios.silence"
	    payload.setSound("com.gexin.ios.silence");
	    payload.setCategory("$由客户端定义");
	    
	    //简单模式APNPayload.SimpleMsg 
	    payload.setAlertMsg(new APNPayload.SimpleAlertMsg(title));
	    //字典模式使用下者
	  
	    //payload.setAlertMsg(getDictionaryAlertMsg());
	    template.setAPNInfo(payload);
		message.setData(template);  
        message.setOffline(true);                   //用户当前不在线时，是否离线存储,可选  
        message.setOfflineExpireTime(72 * 3600 * 1000); //离线有效时间，单位为毫秒，可选  
        Target target1 = new Target();  
        target1.setAppId(appId);  
        //target1.setAlias(alias);
        target1.setClientId(alias);
		IPushResult ret = push.pushMessageToSingle(message, target1);
        System.out.println(ret.getResponse().toString());
        return template;

	}

	/**
	 * 定时30分钟调取一次
	 * @param args
	 */
	public static void main(String[] args) {
		
		/*Runnable runnable = new Runnable() {  
			public void run() {  
				String alias = "5c67ad062be9b28e8f42c64bf31c57dd";
				String title = "支付消息";
				String s = "854221021173836";
				String date = "2017-11-01 15:09:01";
				String name = "张三";
				String dir = "深圳市宝安区";
				String state = "1";
				String content = s+","+date+","+name+","+dir+","+state;
				TestController.YHIOSMssage(alias, title, content);
	            System.out.println("Hello !!");  
	         }  
	    };  
	    ScheduledExecutorService service = Executors  //30*60*1000
	            .newSingleThreadScheduledExecutor();  
	    // 第二个参数为首次执行的延时时间，第三个参数为定时执行的间隔时间  
	    service.scheduleAtFixedRate(runnable, 0, 1*1000, TimeUnit.SECONDS);  */
		
		TimerTask task = new TimerTask() {  
            @Override  
            public void run() {  
            	String alias = "5c67ad062be9b28e8f42c64bf31c57dd";
				String title = "支付消息";
				String s = "854221021173836";
				String date = "2017-11-01 15:09:01";
				String name = "张三";
				String dir = "深圳市宝安区";
				String state = "1";
				String content = s+","+date+","+name+","+dir+","+state;
				TestController.YHIOSMssage(alias, title, content);
                System.out.println("Hello !!!");  
            }  
        };  
        Timer timer = new Timer();  
        long delay = 0;  
        long intevalPeriod = 10 * 60 * 1000;  
        timer.scheduleAtFixedRate(task, delay, intevalPeriod);  
    } 
	
	
}
