package com.game.comm.util;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;

import com.game.comm.entity.AreaCode;
import com.game.comm.service.IAreaCodeService;

/**
 * 生成合伙人编号的工具类
 * @author lh
 * 2017/08/01
 *
 */
public class AreaUtil {

	@Autowired
	private IAreaCodeService areaCodeService;
	
	public static  String getCityCode() {
		
       /* SimpleDateFormat format = new SimpleDateFormat("MMddHHmmss",Locale.getDefault());
        Date date = new Date();
        String key = format.format(date);

        Random r = new Random();
        key = key + r.nextInt();
        key = key.substring(0, 15);
        return key;*/
		
		return null;
		
    }
	public static void main(String[] args) {
		String code = "010";
		String str = null;
		if(code.length() == 4){
			str = code.substring(1, 4);
			System.out.println(str);
		}else{
			str = code;
		}
		//根据市的个数得到下个编号
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		System.out.println(list.size());
		Map<String,Object> map = new HashMap<String, Object>();
		Map<String,Object> map1 = new HashMap<String, Object>();
		Map<String,Object> map2 = new HashMap<String, Object>();
		map.put("bianhao", 031301);
		map1.put("bianhao1", 031302);
		map2.put("bianhao3", 031303);
		list.add(map);
		list.add(map1);
		list.add(map2);
		System.out.println(list.size());
		String str1 = null;
		String s = list.size()+1+"";
		if(list.size()<10 && list.size()<100){
			str1 = "A"+str+"0"+s;
			System.out.println(str1);
		}else{
			str1 ="A"+str+s;
		}
		
		
		
	}
	
	
}
