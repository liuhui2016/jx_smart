<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>${id==null?'新增广告':'修改广告' }</title>
	<%@ include file="/common/head.jsp" %>
	
	<link rel='STYLESHEET' type='text/css' href='${tree}/common/style.css' />
	<link rel="STYLESHEET" type="text/css" href="${tree}/dhtmlxtree.css" />
	<script type="text/javascript" src="${tree}/dhtmlxcommon.js"></script>
	<script type="text/javascript" src="${tree}/dhtmlxtree.js"></script>
	
    <script src="${ctx}/js/jQuery/validate/jquery.validate.js" type="text/javascript"></script>
	<link href="${ctx}/js/jQuery/validate/jquery.validate.css" type="text/css" rel="stylesheet"/>
	<script type="text/javascript" src="${ctx}/js/jQuery/ui/jquery.ui.datepicker-zh-CN.js"></script>
	<script type="text/javascript" src="${ctx}/js/lhgdialog/lhgdialog.js?t=self&s=zxyg"></script>
	<script src="${ctx}/js/jQuery/timepicker.js"></script>
	<script src="${ctx}/js/jQuery/timerange.js"></script>
	
	<style>
			.gonggao{
			    position:absolute;
			    top:80px;
			    left:200px;
			    width:330px;
			    height:500px;
			    border:1px solid #993300;
			    background-color:#ffffff;
			}
			.gonggao h1{
			    line-height:50px;
			    font-size:24px;
			    font-family:"黑体";
			    font-weight:bold;
			    text-align:center;
			}
			.gonggao div{
			    line-height:30px;
			    font-size:18px;
			    font-family:"黑体";
			    text-align:center;
			    color:#993300;
			}
			.gonggao div a,.gonggao div a:visited{
			    color:#993300;
			}
	  </style>
	
<script>

  $(document).ready(function() {
	//为inputForm注册validate函数
	$("#inputForm").validate({
		submitHandler:function(form){
			var video_type = $("#video_type").val();
			var fl = pChange();
			if(fl){form.submit();}
        }
	});
});  

$(function() {
		$.ajax({ //一个Ajax过程
		       type: "post", //以post方式与后台沟通
		       url:'${pageContext.request.contextPath}/smvc/adv/advpic.v?id=${adv_type}',
		       contentType:'application/json;charset=utf-8',
		       success: function(data){
		   			$("#adv_type").append(data);
		       }
		 	});
		});
		
		function clsGG(srcpath) {
			window.document.getElementById("viewimg").src = srcpath;
			document.all("gonggao").style.display = "block";
		}
		function closediv() {
			document.all("gonggao").style.display = "none";
		}
		
		$(document).ready(function() {
			$('#adv_vaildtime, #adv_invildtime').datepicker($.datepicker.regional['zh-CN']);
		});
		
		function selectDlg(url, dialogTitle) {
		   	var aa = $("#adv_type").val();
			url = prepURL(url, "authId", "${authId}");
		 	url = prepURL(url, "adv_type", aa);
			var dg = new $.dialog({ id:'poupup', skin:'zxyg',rang:true,title:dialogTitle,fixed:true,
				drag:true, resize:true,cancelBtn:false,iconTitle:false,width:800,height:460,page:url,
				top:50,left:200,dgOnLoad:function(){}
			});
			dg.ShowDialog();
	}
		
		function typeChange(){
			var type = $("#adv_type").val();
			if(type == '-1'){
				$("#aa").show();
				$("#ab").show();
				$("#ac").show();
				$("#ad").show();
				$("#ae").show();
			}else{
				$("#aa").css("display","none");
				$("#ab").css("display","none");
				$("#ac").css("display","none");
				$("#ad").css("display","none");
				$("#ae").css("display","none");
			}
		}
		
		function typeChanges(){
			var type = $("#video_type").val();
			if(type == '1'){
				$("#aa").show();
				$("#ab").show();
			}else{
				$("#aa").css("display","none");
				$("#ab").css("display","none");
			}
		}
		
		function pChange(){
			var adv_url = $("#iconfiles").val();
			var adv_type = $("#adv_type").val();
			var video_type = $("#video_type").val();
			var video_url = $("#video_url").val();
			var fl = false;
			var s = /.+\.(mp4|MP4)$/;
			var s2 = /\\w*\\.(mp4|MP4)$/;
			var s3 = /[a-za-z0-9-/.](mp4|MP4)$]/;
			if(adv_type == '-1' && video_type == '1'){
				 if(!s.test(adv_url)){
					$("#files").text("视频后缀必须为.mp4格式");
				}else{
					fl = true;
					$("#files").text("");
				}
			}else{
				fl = true;
			}
			 return fl;
		}
	</script>
	
	
	
	
</head>
<body>
<div class="currloca">
  <p>${auth.fullMenu}${id==null?'&nbsp;»&nbsp;<span>新增广告</span>':'&nbsp;»&nbsp;<span>修改广告</span>' }</p>
  <div class="sitemap">
  	<span style="display:block;float:left"><s:actionmessage theme="custom"/></span>
    <span id="showMap"><img onclick="showMap();return false;" id="sMap" class="pointer" width="64" height="18" title="后台导航" src="${ctx}/images/map.gif"/></span>
  </div>
</div>

<div class="container">
  <!-- 内容区域 -->
  <div class="itemtitle"><h2>${id==null?'新增广告':'修改广告' }</h2></div>
    
      <!-- 附加信息-->
  <div id="message" class="message">
    <span style="font-weight: bold;font-size: 14px;"><!-- 提示：资源列表... --></span>
  </div>
  
  <form id="inputForm" action="advpic!save.action" method="post" enctype="multipart/form-data">
  	<div id="gonggao" class="gonggao" style="display: none">
				<img name="viewimg" id="viewimg" style="width: 300; height: 500" />
				<a href="javascript:closediv();">关闭</a>
			</div>
	  <!-- 列表区域-->
	  <div id="content" class="content input">
	    <div id="indiv" style="width:100%;OVERFLOW-X:auto;">
	    </div>
	    	<input type="hidden" name="id" value="${id}"/>
			<input type="hidden" name="authId" value="${authId}"/>
			<table class="tab_cont" width="" cellspacing="0" cellpadding="0" border="0" align="left">
				<tbody>
				    <tr>
				      <th class="first" width="130">标准信息</th>
				      <th class="last" colspan="3"></th>
				    </tr>
				     
					<tr>
						<td class="right">广告类型:</td>
							<td colspan="3"><select id="adv_type" name="adv_type" onchange="typeChange()">
									<option value="-2" <c:if test="${adv_type==-2 }">selected=true</c:if>>首页广告</option>
									<option value="-1" <c:if test="${adv_type==-1 }">selected=true</c:if>>平板广告</option>
									<option value="0" <c:if test="${adv_type==0 }">selected=true</c:if>>社区广告</option>
								</select>
							</td>
					</tr>
					
					<tr id= "ae" style="display: none">
						<td class="right" >上传类型:</td>
							<td colspan="3"><select id="video_type" name="video_type" onchange="typeChanges()">
									<option value="1" <c:if test="${video_type==1 }">selected=true</c:if>>视频</option>
									<option value="0" <c:if test="${video_type==0 }"></c:if>>图片</option>
								</select>
							</td>
					</tr>
					
				    <tr>
						<td class="right">手机号码:</td>
						<td colspan="3"><input type="text" name="adv_phone" size="40" id="adv_phone" maxlength="255" value="${adv_phone}"/></td>
					</tr>
					
				
					
					<tr>
						<td class="right">图片:</td>
						<td colspan="3">
							<input type="file" id="iconfile" name="iconfile" value="${adv_imgurl}" style="width: 320px" />
							<input type="hidden" id="adv_imgurl" name="adv_imgurl" value="${adv_imgurl}" />
							<c:if test="${adv_imgurl != null && adv_imgurl != ''}">
								&nbsp;&nbsp;<a href="#" id="icondelete" onclick="clsGG('${adv_imgurl}');">查看原图</a>
							</c:if>
						</td>
					</tr>
					
					<tr id = "aa" style="display: none">
						<td class="right"><span class="red"></span>视频:</td>
						<td colspan="3">
							<input type="file" id="iconfiles" name="iconfiles" value="${video_url}" style="width: 320px" onchange="pChange()"/><span id="files" style="color:red"></span>
							<input type="hidden" id="video_url" name="video_url" value="${video_url}" />
							<c:if test="${video_url != null && video_url != ''}">
								&nbsp;&nbsp;<a href="#" id="icondelete" onclick="clsGG('${video_url}');">查看原图</a>
							</c:if>
						</td>
					</tr>
					
					<tr id = "ab" style="display: none">
						<td class="right">上级图片地址:</td>
						<td colspan="3">
							<input type="text" id="sup_id" name="sup_id" value="${sup_id}" style="width: 100px" />
							<input type="button" onclick="selectDlg('advpic!selectresourcer.action', '选择上级图片地址');" value="选择上级图片地址"/>
						</td>
					</tr>
					
					<tr id = "ac" style="display: none">
						<td class="right"><span class="red"></span>是否主动:</td>
						<td colspan="3">
							<c:if test="${is_accord == 0}">
							<input id="is_accord" name="is_accord" type="radio" value="1" checked="checked" />主动
							<input id="is_accord" name="is_accord" type="radio" value="0"/>被动
							</c:if>
							
							<c:if test="${is_accord == 1}">
							<input id="is_accord" name="is_accord" type="radio" value="1"/>主动
							<input id="is_accord" name="is_accord" type="radio" value="0" checked="checked"/>被动
							</c:if>
						</td>
					</tr>
					
					
					<tr>
						<td class="right">跳转url:</td>
						<td colspan="3"><input type="text" name="adv_url" size="40" id="adv_url" maxlength="255" value="${adv_url}"/></td>
					</tr>
					
					<tr>
						<td class="right">开始时间(天):</td>
						<td><input type="text" name="adv_vaildtime" size="40" id="adv_vaildtime" maxlength="255" value="<fmt:formatDate pattern='yyyy-MM-dd' value='${adv_vaildtime}'/>"/></td>
					</tr>
					
					<tr>	
						<td class="right">结束时间(天):</td>
						<td><input type="text" name="adv_invildtime" size="40" id="adv_invildtime" maxlength="255" value="<fmt:formatDate pattern='yyyy-MM-dd' value='${adv_invildtime}'/>"/></td>
						
					</tr>
					
					<tr>
						<th class="first" width="130"></th>
						<th class="last" colspan="3">
							<input class="button" type="submit" value="提交"/>&nbsp;
							<input class="button" type="button" value="返回" onclick="history.back()"/>
						</th>
					</tr>
				</tbody>
			</table>
	    </div>
  </form>
</div>
</body>
</html>