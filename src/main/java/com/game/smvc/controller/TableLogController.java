package com.game.smvc.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONException;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.game.bmanager.service.IJxAdvpicService;
import com.game.smvc.entity.JxTableLog;
import com.game.smvc.entity.result.Errors;
import com.game.smvc.entity.result.Result;
import com.game.smvc.entity.result.SecretResult;
import com.game.smvc.service.IJxTableLogService;
import com.game.smvc.service.IJxTableVideoService;
import com.game.smvc.util.HttpUtil;
import com.mysql.fabric.xmlrpc.base.Data;

/**
 * 平板日志信息
 * @author lh
 *
 */
@Controller
@RequestMapping({ "/smvc" })
public class TableLogController {

	@Autowired
	private IJxTableLogService jxTableLogService;
	@Autowired
	private IJxTableVideoService jxTableVideoService;
	@Autowired
	private IJxAdvpicService advpicService;
	
	
	@ResponseBody
	@RequestMapping(value = "/table/tablelog")
	public Result tableLog(HttpServletRequest request) {
		try {
			System.out.println("---开始保存平板日志信息---");
			String authCode = HttpUtil.getRquestParamsByIO(request);
			JSONObject jsonObject = JSONObject.fromObject(authCode);
			String pro_no = jsonObject.getString("pro_no");//机器号
			String tl_param = jsonObject.getString("tl_param");//参数
			String tl_option = jsonObject.getString("tl_option");//操作名字
			String tl_netdate = jsonObject.getString("tl_netdate");//网络回来的数据
			String tl_localdate = jsonObject.getString("tl_localdate");//本地的数据
			String apk_version = jsonObject.getString("apk_version");//app版本号
			String pb_version = jsonObject.getString("slab_version");//平板版本号
			JxTableLog jxTableLog = new JxTableLog();
			jxTableLog.setPro_no(pro_no);
			jxTableLog.setTl_param(tl_param);
			jxTableLog.setTl_localdate(tl_localdate);
			jxTableLog.setTl_netdate(tl_netdate);
			jxTableLog.setTl_option(tl_option);
			jxTableLog.setApk_version(apk_version);
			jxTableLog.setPb_version(pb_version);
			jxTableLog.setTl_addtime(new Date());
			jxTableLogService.save(jxTableLog);
			System.out.println("---开始清除大于15天的数据---");
			//清除大于15天的数据
			Date date = new Date();
			GregorianCalendar gc1 = new GregorianCalendar();
			gc1.setTime(date);
			gc1.add(5, -15);
			Date date2 = gc1.getTime();//  最初绑定时间
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String day = sdf.format(date2);
			int delDataOfDay = jxTableLogService.findDelDataOfDay(day,pro_no);
			System.out.println("---清除成功---");
			return new Result(Errors.OK);

		} catch (JSONException e) {
			return new Result(Errors.JSON_ERROR_NOTJSON);
		} catch (Exception e) {
			e.printStackTrace();
			return new Result(Errors.EXCEPTION_UNKNOW);
		}
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/table/tablevideo")
	public Result tableVideo(HttpServletRequest request) {
		try {
			System.out.println("---获取平板视频信息---");
			String authCode = HttpUtil.getRquestParamsByIO(request);
			JSONObject jsonObject = JSONObject.fromObject(authCode);
			String sup_id = jsonObject.getString("id");//图片id
			//Map<String,Object> map = advpicService.queryAdverByTypes(v_id);
			List<Map<String,Object>> list = jxTableVideoService.findVideoOfType(sup_id);
			//list.add(map);
			
			return new SecretResult(Errors.OK, list);
		} catch (JSONException e) {
			return new Result(Errors.JSON_ERROR_NOTJSON);
		} catch (Exception e) {
			e.printStackTrace();
			return new Result(Errors.EXCEPTION_UNKNOW);
		}
	}
	
	
	/*@ResponseBody
	@RequestMapping(value = "/table/tablevideoorpic")
	public Result tableVideoOrPic(HttpServletRequest request) {
		try {
			System.out.println("---获取平板视频信息---");
			String authCode = HttpUtil.getRquestParamsByIO(request);
			JSONObject jsonObject = JSONObject.fromObject(authCode);
			String type = jsonObject.getString("type");
            List<Map<String,Object>> list = advpicService.queryAdverByType(type);
            Map<String,Object> data = new HashMap<String, Object>();
            
            List<Map<String,Object>> list1 = new ArrayList<Map<String,Object>>();
            
            Map<String,List<Map<String,Object>>> a = new HashMap<String, List<Map<String,Object>>>();
            
            
            for(int i = 0;i<list.size();i++){
            	Map<String,Object> map = list.get(i);
            	String sup_id = map.get("id")+"";
            	List<Map<String,Object>> l = jxTableVideoService.findVideoOfType(sup_id);
            	for(int j = 0;j<l.size();j++){
            		Map<String,Object> video = new HashMap<String, Object>();
            		Map<String,Object> m = l.get(j);
            		video.put("id", m.get("id"));
            		video.put("video_url", m.get("video_url"));
            		video.put("adv_url", m.get("adv_url"));
            		video.put("is_accord", m.get("is_accord"));
            		video.put("video_dir", m.get("video_dir"));
            		video.put("sup_id", m.get("sup_id"));
            		list1.add(video);
            	}
            }
            data.put("list", list);
            data.put("list_video", list1);
			return new SecretResult(Errors.OK, data);
		} catch (JSONException e) {
			return new Result(Errors.JSON_ERROR_NOTJSON);
		} catch (Exception e) {
			e.printStackTrace();
			return new Result(Errors.EXCEPTION_UNKNOW);
		}
	}*/
	
	/**
	 * 获取视频&图片信息(最新版)
	 * 2.17/10/25
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/table/tablevideoorpic")
	public Result tableVideoOrPics(HttpServletRequest request) {
		try {
			System.out.println("---1获取平板视频信息1---");
			String authCode = HttpUtil.getRquestParamsByIO(request);
			JSONObject jsonObject = JSONObject.fromObject(authCode);
			String type = jsonObject.getString("type");
            List<Map<String,Object>> list = advpicService.queryAdverByType(type);
            
            for(int i = 0;i<list.size();i++){
            	Map<String,Object> map = list.get(i);
            	String sup_id = map.get("id")+"";
            	List<Map<String,Object>> l = jxTableVideoService.findVideoOfType(sup_id);
            	map.put("video_list", l);
            }
			return new SecretResult(Errors.OK, list);
		} catch (JSONException e) {
			return new Result(Errors.JSON_ERROR_NOTJSON);
		} catch (Exception e) {
			e.printStackTrace();
			return new Result(Errors.EXCEPTION_UNKNOW);
		}
	}
	
	
	public static void main(String[] args) {
		//使用断言测试
		/*int x = 10;
		System.out.println("Testing Assertion that x==100");
		assert x == 100:"Out assertion failed!";
		System.out.println("Test passed!");*/
		System.out.println("consumeQuerue");
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd");
		Map<String, Object> map = new HashMap<String, Object>();
		int ppdnum = 2;
		Calendar calendar = Calendar.getInstance();
		map.put("quantity", (calendar.getActualMaximum(Calendar.DAY_OF_YEAR)*ppdnum));
		calendar.add(Calendar.YEAR,(1 * ppdnum));
		// 默认包一年,如果有多的,从订单获取
		map.put("now", sdf.format(new Date()));
		Date date = calendar.getTime();
		map.put("end", sdf.format(date));
		list.add(map);
		System.out.println(list);
		
		
		Date date1 = new Date();
		GregorianCalendar gc1 = new GregorianCalendar();
		gc1.setTime(date1);
		gc1.add(5, -15);
		Date date2 = gc1.getTime();//  最初绑定时间
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
		String day = sdf1.format(date2);
		System.out.println(day);
		
	}
	
}
