package com.game.smvc.controller;

import java.awt.AWTException;
import java.awt.Desktop;
import java.awt.Dimension;
import java.awt.Graphics;
import java.awt.Image;
import java.awt.Rectangle;
import java.awt.Robot;
import java.awt.Toolkit;
import java.awt.event.KeyEvent;
import java.awt.image.BufferedImage;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URISyntaxException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.text.Collator;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;
import java.util.Map.Entry;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONException;
import net.sf.json.JSONNull;
import net.sf.json.JSONObject;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.game.bmanager.entity.JxPrototal;
import com.game.bmanager.service.IJxFilterLifeService;
import com.game.bmanager.service.IJxMenuService;
import com.game.bmanager.service.IJxPictureService;
import com.game.bmanager.service.IJxPrototalService;
import com.game.push.quickin.PushAllToApp;
import com.game.push.quickin.PushBase;
import com.game.smvc.entity.JxAfterSales;
import com.game.smvc.entity.JxCommunitySale;
import com.game.smvc.entity.JxMessages;
import com.game.smvc.entity.JxOrder;
import com.game.smvc.entity.JxOrderItem;
import com.game.smvc.entity.JxPay;
import com.game.smvc.entity.JxProduct;
import com.game.smvc.entity.JxReleaseOrder;
import com.game.smvc.entity.JxShoppingCart;
import com.game.smvc.entity.JxSpider;
import com.game.smvc.entity.JxStatistical;
import com.game.smvc.entity.JxUser;
import com.game.smvc.entity.Jxpublish;
import com.game.smvc.entity.result.DataResult;
import com.game.smvc.entity.result.Errors;
import com.game.smvc.entity.result.Result;
import com.game.smvc.entity.result.SecretResult;
import com.game.smvc.service.IJxCommunitySaleService;
import com.game.smvc.service.IJxFilterElementService;
import com.game.smvc.service.IJxMerchantPublishService;
import com.game.smvc.service.IJxMessageService;
import com.game.smvc.service.IJxNewsService;
import com.game.smvc.service.IJxOrderItemService;
import com.game.smvc.service.IJxOrderService;
import com.game.smvc.service.IJxPayWayService;
import com.game.smvc.service.IJxProductService;
import com.game.smvc.service.IJxShoppingCartService;
import com.game.smvc.service.IJxSpiderService;
import com.game.smvc.service.IJxStatisticalService;
import com.game.smvc.service.IJxUserService;
import com.game.smvc.service.IJxUserWapService;
import com.game.smvc.service.IJxWaterService;
import com.game.smvc.service.JxReleaseOrderService;
import com.game.smvc.util.HttpUtil;
import com.game.smvc.util.RandomUtil;
import com.game.smvc.util.mapUtil;
import com.game.spider.bean.LinkTypeData;
import com.game.spider.core.ExtractService;
import com.game.spider.rule.Rule;
import com.game.web.action.common.SysinitAction;
import org.jsoup.nodes.Element;

@Controller
@RequestMapping({ "/smvc" })
public class UserWapPushController extends PushBase {

	@Autowired
	private IJxUserWapService userWapService;
	@Autowired
	private IJxProductService productService;

	@Autowired
	private IJxFilterLifeService jxFilterLifeService;

	@Autowired
	private IJxFilterElementService filterElementService;

	@Autowired
	private IJxOrderService jxOrderService;
	@Autowired
	private IJxNewsService jxNewsService;
	@Autowired
	private IJxStatisticalService jxStatisticalService;
	@Autowired
	private IJxOrderItemService jxOrderItemServic;
	@Autowired
	private IJxSpiderService jxSpiderService;
	@Autowired
	private IJxShoppingCartService jxShoppingCartService;
	@Autowired
	private IJxPayWayService payWayService;
	@Autowired
	private IJxPrototalService prototalService;
	@Autowired
	private IJxPictureService pictureService;
	@Autowired
	private IJxMessageService messageService;
	@Autowired
	private IJxMerchantPublishService merchantPublish;
	@Autowired
	private JxReleaseOrderService jxReleaseOrderService;
	@Autowired
	private IJxMenuService menuService;
	@Autowired
	private IJxCommunitySaleService jxCommunitySaleService;
	@Autowired
	private IJxUserService jxUserService;
	@Autowired
	private IJxWaterService jxWaterService;
	@Autowired
	private IJxProductService jxProductService;

	/*
	 * 查看我的净水器
	 */
	@SuppressWarnings("unused")
	@ResponseBody
	@RequestMapping({ "/product/waterCleaner" })
	public Result waterCleaner(HttpServletRequest request) {
		try {
			String authCode = HttpUtil.getRquestParamsByIO(request);
			JSONObject jsonObject = JSONObject.fromObject(authCode);
			String uid = jsonObject.getString("userid");
			String page = jsonObject.getString("page");
			Object object = jsonObject.get("type");

			/*
			 * Document document =
			 * Jsoup.connect("http://video.eastday.com/vgaoxiao.html").get();
			 * //System.out.println(document.toString()); Elements liElements1 =
			 * document
			 * .getElementsByClass("special_list").get(0).getElementsByTag("a");
			 * for (int j =0; j<liElements1.size(); j++) {
			 * //System.out.println("内容："+j + ". " +
			 * liElements1.get(j).text());//内容
			 * //System.out.println("地址1:"+liElements1
			 * .get(j).attr("abs:href"));//地址 String img =
			 * liElements1.select("img[src]").get(j).attr("abs:src");//图片地址
			 * String titles =
			 * liElements1.select("img[src]").get(j).attr("alt");//标题 String s =
			 * liElements1.get(j).attr("abs:href"); //String title =
			 * liElements1.get(j).attr("title"); //String contenr =
			 * liElements1.get(j).text(); Document document1 =
			 * Jsoup.connect(s).get(); Elements liElements =
			 * document1.getElementsByClass
			 * ("video0").get(0).getElementsByTag("source");//得到地址 String href =
			 * liElements.get(1).absUrl("src");
			 * System.out.println("标题:"+titles);
			 * System.out.println("视频地址:"+href);
			 * System.out.println("图片地址:"+img); JxSpider jxSpider = new
			 * JxSpider(); jxSpider.setJx_content(titles);
			 * jxSpider.setJx_linkhref(href); jxSpider.setJx_linktext(img);
			 * jxSpider.setId(0); jxSpider.setJx_summary("1");
			 * jxSpider.setAddtime(new Date()); jxSpiderService.save(jxSpider);
			 * 
			 * }
			 */

			if (object == null) {
				List<Map<String, Object>> list = this.userWapService
						.findMyProductByUid(uid, Integer.parseInt(page));
				return new SecretResult(Errors.OK, list);
			}
			if ((uid == null) || ("".equals(uid.trim()))) {
				return new Result(Errors.USER_ERROR_PHONE_FORMAT);
			}

			List<Map<String, Object>> list = null;
			if ("0".equals(jsonObject.getString("type"))) {
				System.out.println("0");
				list = this.userWapService.findMyProductByUid(uid,
						Integer.parseInt(page));
			} else {
				list = productService.findShareProduct(uid,
						Integer.parseInt(page));
			}
			return new SecretResult(Errors.OK, list);
		} catch (JSONException e) {
			return new Result(Errors.JSON_ERROR_NOTJSON);

		} catch (Exception e) {
			e.printStackTrace();
			return new Result(Errors.EXCEPTION_UNKNOW);
		}
	}

	public void printf(List<LinkTypeData> datas) {
		for (LinkTypeData data : datas) {
			JxSpider spider = new JxSpider();
			spider.setId(data.getId());
			spider.setJx_content(data.getContent());
			spider.setJx_linkhref(data.getLinkHref());
			spider.setJx_linktext(data.getLinkText());
			spider.setJx_summary(data.getSummary());
			jxSpiderService.save(spider);
		}

	}

	/*
	 * 查看滤芯状态
	 */
	/**
	 * 
	 */
	@ResponseBody
	@RequestMapping({ "/userwappush/doulton" })
	public Result doulton(HttpServletRequest request) {
		try {
			System.out.println("---开始查看滤芯状态---");
			String authCode = HttpUtil.getRquestParamsByIO(request);
			JSONObject jsonObject = JSONObject.fromObject(authCode);
			String pro_no = jsonObject.getString("pro_id");
			List<Map<String, Object>> lx = this.userWapService
					.findStatusByproId(pro_no);
			System.out.println(lx.size());
			if (lx.size() <= 0) {
				return new Result(Errors.NO_FILTER_MESSAGES);
			}
			// 得到现在的滤芯
			Map<String, Object> map = lx.get(0);
			Object pp = map.get("pp");
			Object cto = map.get("cto");
			Object ro = map.get("ro");
			Object t33 = map.get("t33");
			Object wfr = map.get("wfr");

			double pps = Double.parseDouble(pp.toString());
			double ctos = Double.parseDouble(cto.toString());
			double ros = Double.parseDouble(ro.toString());
			double t33s = Double.parseDouble(t33.toString());
			double wfrs = Double.parseDouble(wfr.toString());
			String code = (String) map.get("code");
			System.out.println("现在滤芯---》" + pp);

			// 获得原始滤芯
			System.out.println("---开始获取原始滤芯---");
			List<Map<String, Object>> list1 = jxFilterLifeService
					.queryFilterLifeByProvince(code);
			Map<String, Object> map1 = list1.get(0);
			Object ppss = map1.get("pp");
			Object ctoss = map1.get("cto");
			Object ross = map1.get("ro");
			Object t33ss = map1.get("t33");
			Object wfrss = map1.get("wfr");
			double yspp = Double.parseDouble(ppss.toString());
			double yscto = Double.parseDouble(ctoss.toString());
			double ysro = Double.parseDouble(ross.toString());
			double yst33 = Double.parseDouble(t33ss.toString());
			double yswfr = Double.parseDouble(wfrss.toString());

			System.out.println("原始滤芯--->" + ppss);
			System.out.println("--->" + yspp);

			// 计算滤芯百分比
			double p = (pps / yspp) * 100;
			double c = (ctos / yscto) * 100;
			double r = (ros / ysro) * 100;
			double t = (t33s / yst33) * 100;
			double w = (wfrs / yswfr) * 100;

			// 判断滤芯值
			if (p > 100) {
				p = 100;
			}

			if (c > 100) {
				c = 100;
			}

			if (r > 100) {
				r = 100;
			}
			if (t > 100) {
				t = 100;
			}
			if (w > 100) {
				w = 100;
			}
			/*
			 * double p = (100.0); double c = (99.0); double r = (99.0); double
			 * t = (98.5); double w = (96.0);
			 */

			List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
			Map<String, Object> m = new HashMap<String, Object>();
			/*
			 * m.put("pp", p+""); m.put("cto", c+""); m.put("ro", r+"");
			 * m.put("t33", t+""); m.put("wfr", w+"");
			 */
			m.put("pp", (int) p);
			m.put("cto", (int) c);
			m.put("ro", (int) r);
			m.put("t33", (int) t);
			m.put("wfr", (int) w);
			list.add(m);
			System.out.println("---新的滤芯---" + list);

			System.out.println("------>>>" + p);
			return new SecretResult(Errors.OK, list);
		} catch (JSONException e) {
			return new Result(Errors.JSON_ERROR_NOTJSON);

		} catch (Exception e) {
			e.printStackTrace();
			return new Result(Errors.EXCEPTION_UNKNOW);
		}
	}

	/*
	 * 我发布的内容
	 */
	@ResponseBody
	@RequestMapping({ "/userwappush/mydoulton" })
	public Result mydoulton(HttpServletRequest request) {
		try {
			String authCode = HttpUtil.getRquestParamsByIO(request);
			JSONObject jsonObject = JSONObject.fromObject(authCode);
			String phoneNum = jsonObject.getString("phoneNum");
			String uid = jsonObject.getString("userid");
			String page = jsonObject.getString("page");

			if ((phoneNum == null) || ("".equals(phoneNum.trim()))
					|| (page == null) || ("".equals(page.trim()))) {
				return new Result(Errors.USER_ERROR_PHONE_FORMAT);
			}

			List<Map<String, Object>> list = userWapService
					.findwapServiceBypho(uid, page);
			return new SecretResult(Errors.OK, list);
		} catch (JSONException e) {
			return new Result(Errors.JSON_ERROR_NOTJSON);

		} catch (Exception e) {
			e.printStackTrace();
			return new Result(Errors.EXCEPTION_UNKNOW);
		}
	}

	/**
	 * 点击'我的订单'查询这个用户下面所有的订单
	 * 
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/order/myOrders")
	public Result myOrders(HttpServletRequest request) {
		try {
			String authCode = HttpUtil.getRquestParamsByIO(request);
			JSONObject jsonObject = JSONObject.fromObject(authCode);
			String uid = jsonObject.getString("uid");
			// String uid = "3";
			int page = Integer.parseInt(jsonObject.getString("page"));
			String state = jsonObject.getString("state");
			// int state = Integer.parseInt(state);

			if ((uid == null) || ("".equals(uid.trim()))) {
				return new Result(Errors.USER_ERROR_PHONE_FORMAT);
			}

			if ("".equals(state) || state == null) {
				System.out.println("---全部订单---");
				List<Map<String, Object>> orders = userWapService
						.queryOrdersByuid(uid, (page - 1) * 10);

				return new SecretResult(Errors.OK, orders);
			} else if ("0".equals(state)) {
				System.out.println("---代付款订单---");
				List<Map<String, Object>> orders = userWapService
						.findGenerationOfPayment(uid, state, (page - 1) * 10);
				return new SecretResult(Errors.OK, orders);
			} else if ("1".equals(state)) {
				System.out.println("---已付款订单---");
				List<Map<String, Object>> orders = userWapService
						.findPaymentHasBenn(uid, state, (page - 1) * 10);
				return new SecretResult(Errors.OK, orders);
			} else if ("3".equals(state)) {
				System.out.println("---已绑定订单---");
				List<Map<String, Object>> orders = userWapService
						.findIsBinding(uid, state, (page - 1) * 10);
				return new SecretResult(Errors.OK, orders);
			} else if ("4,5".equals(state)) {
				System.out.println("---续费订单---");
				List<Map<String, Object>> orders = userWapService.findRenewal(
						uid, state, (page - 1) * 10);
				return new SecretResult(Errors.OK, orders);
			} else {

				return new Result(Errors.USER_ERROR_NOT_ORDER);
			}

		} catch (JSONException e) {
			e.printStackTrace();
			return new Result(Errors.JSON_ERROR_NOTJSON);

		} catch (Exception e) {
			e.printStackTrace();
			return new Result(Errors.EXCEPTION_UNKNOW);
		}
	}

	/**
	 * 查看订单详情
	 * 
	 * @param request
	 * @param orderNum
	 * @return
	 */

	@ResponseBody
	@RequestMapping(value = "/order/orderuDetail")
	public Result orderDetail(HttpServletRequest request) {
		try {
			String authCode = HttpUtil.getRquestParamsByIO(request);
			JSONObject jsonObject = JSONObject.fromObject(authCode);
			String ono = jsonObject.getString("ord_no");
			// 判断

			JxOrder jxOrder = jxOrderService.findorder(ono);
			int multiple = jxOrder.getOrd_multiple();
			Float prices = jxOrder.getOrd_priceper();

			if (jxOrder.getFim_ord_no() == null
					|| jxOrder.getFim_ord_no().equals("")) {
				jxOrder.setOrd_pledge(0);
				jxOrder.setFim_ord_no(jxOrder.getOrd_no());
				jxOrderService.save(jxOrder);
			}

			if (prices == null || prices == 0) {
				jxOrder.setOrd_priceper(Float.parseFloat("0"));
				jxOrderService.save(jxOrder);
			}

			if (multiple == 0) {
				jxOrder.setOrd_multiple(1);
				jxOrderService.save(jxOrder);
			}

			String s = jxOrder.getFim_ord_no();
			System.out.println("s:" + s);
			String ord_no = jxOrder.getOrd_no();
			// 如果是子订单
			if (ord_no.equals(ono)) {
				System.out.println("子订单");
				List<Map<String, Object>> list = this.userWapService
						.findOrderDetailByOno(ono);
				return new SecretResult(Errors.OK, list);
			} else {

				System.out.println("父订单");
				List<Map<String, Object>> list = this.userWapService
						.findOrderDetailByFimOno(ono);
				return new SecretResult(Errors.OK, list);
			}

		} catch (JSONException e) {
			return new Result(Errors.JSON_ERROR_NOTJSON);

		} catch (Exception e) {
			e.printStackTrace();
			return new Result(Errors.EXCEPTION_UNKNOW);
		}
	}

	/*
	 * 查看所有发布服务的种类
	 */
	@ResponseBody
	@RequestMapping(value = "/wapPush/wappushtotal")
	public Result mainImg() {
		try {

			return new SecretResult(Errors.OK,
					userWapService.wapServicecategory());
		} catch (JSONException e) {
			return new Result(Errors.JSON_ERROR_NOTJSON);

		} catch (Exception e) {
			e.printStackTrace();
			return new Result(Errors.EXCEPTION_UNKNOW);
		}
	}

	/*public static void main(String[] args) throws MalformedURLException,
		IOException, URISyntaxException, AWTException {
		// 此方法仅适用于JdK1.6及以上版本
		Desktop.getDesktop().browse(
				new URL("http://www.jinse.com/").toURI());
		Robot robot = new Robot();
		robot.delay(10000);
		Dimension d = new Dimension(Toolkit.getDefaultToolkit().getScreenSize());
		int width = (int) d.getWidth();
		int height = (int) d.getHeight();
		// 最大化浏览器
		robot.keyRelease(KeyEvent.VK_F11);
		robot.delay(2000);
		Image image = robot.createScreenCapture(new Rectangle(0, 0, width,
				height));
		BufferedImage bi = new BufferedImage(width, height,
				BufferedImage.TYPE_INT_RGB);
		Graphics g = bi.createGraphics();
		g.drawImage(image, 0, 0, width, height, null);
		// 保存图片
		ImageIO.write(bi, "jpg", new File("google.jpg"));
	}*/
	
	public static void downImages(String filePath, String imgUrl) {
        // 若指定文件夹没有，则先创建
        File dir = new File(filePath);
        if (!dir.exists()) {
            dir.mkdirs();
        }
        // 截取图片文件名
        String fileName = imgUrl.substring(imgUrl.lastIndexOf('/') + 1, imgUrl.length());

        try {
            // 文件名里面可能有中文或者空格，所以这里要进行处理。但空格又会被URLEncoder转义为加号
            String urlTail = URLEncoder.encode(fileName, "UTF-8");
            // 因此要将加号转化为UTF-8格式的%20
            imgUrl = imgUrl.substring(0, imgUrl.lastIndexOf('/') + 1) + urlTail.replaceAll("\\+", "\\%20");

        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        // 写出的路径
        File file = new File(filePath + File.separator + fileName);

        try {
            // 获取图片URL
            URL url = new URL(imgUrl);
            // 获得连接
            URLConnection connection = url.openConnection();
            // 设置10秒的相应时间
            connection.setConnectTimeout(10 * 1000);
            // 获得输入流
            InputStream in = connection.getInputStream();
            // 获得输出流
            BufferedOutputStream out = new BufferedOutputStream(new FileOutputStream(file));
            // 构建缓冲区
            byte[] buf = new byte[1024];
            int size;
            // 写入到文件
            while (-1 != (size = in.read(buf))) {
                out.write(buf, 0, size);
            }
            out.close();
            in.close();
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    public static void main(String[] args) {
        // 利用Jsoup获得连接
        Connection connect = Jsoup.connect("http://www.jinse.com/lives");
        try {
            // 得到Document对象
            Document document = connect.get();
            // 查找所有img标签
            Elements imgs = document.getElementsByTag("img");
            Elements lis = document.getElementsByTag("li");
            System.out.println("共检测到下列图片URL：");
            System.out.println("开始下载");
            // 遍历img标签并获得src的属性
           /* for (Element element : imgs) {
                //获取每个img标签URL "abs:"表示绝对路径
                //String imgSrc = element.attr("abs:src");
                String li = element.attr("abs:li");
                // 打印URL
                System.out.println(li);
               // System.out.println(imgSrc);
                //下载图片到本地
               // UserWapPushController.downImages("d:/img", imgSrc);
            }*/
            for (Element element : lis) {
                //获取每个img标签URL "abs:"表示绝对路径
                //String imgSrc = element.attr("abs:src");
                String li = element.attr("abs:li");
                // 打印URL
                System.out.println(li);
               // System.out.println(imgSrc);
                //下载图片到本地
               // UserWapPushController.downImages("d:/img", imgSrc);
            }
            
            System.out.println("下载完成");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
