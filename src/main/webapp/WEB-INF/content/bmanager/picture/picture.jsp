<%@page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>内部办公自动化系统</title>
<%@ include file="/common/head.jsp" %>
<link rel="stylesheet" href="${ctx}/css/content.css" type="text/css" />

<style type="text/css">

a {font-size:16px} 
#未访问：蓝色、无下划线 
a:link {
	color: green; 
	text-decoration:none;
} 
#激活：红色 
a:active:{color: red; } 
#已访问：purple、无下划线 
a:visited {
	color:green;
	text-decoration:none;
}
a:hover {
	color: red; 
	text-decoration:underline;
} 

</style>

<script type="text/javascript">
$(document).ready(function () {
	//$("#status").val("${param.filter_EQI_status}");
});

function clsGG(srcpath) {
	window.document.getElementById("viewimg").src = srcpath;
	document.all("gonggao").style.display = "block";
}
function closediv() {
	document.all("gonggao").style.display = "none";
}

</script>


</head>
<body>
<div class="currloca">
  <p>${auth.fullMenu}</p>
  <div class="sitemap">
    <span style="display:block;float:left"><s:actionmessage theme="custom"/></span>
    <span id="add2custom"><img class="pointer" onclick="add2custom('${authId}');return false;" id="aCustom" width="24" align="absmiddle" height="24" title="添加到常用操作" src="${ctx}/images/favorite.png"/></span>
  </div>
</div>
   <div class="titt">
     <h2><img alt="" src="${ctx}/images/web/311.gif" align="absmiddle" />${auth.label}</h2>
   </div>
   <form id="mainForm" action="picture!list.action" method="post">
   <div id="gonggao" class="gonggao" style="display: none">
		<img name="viewimg" id="viewimg" style="width: 300; height: 500" />
		<a href="javascript:closediv();">关闭</a>
	</div>
    <input type="hidden" name="page.pageNo" id="pageNo" value="${page.pageNo}"/>
    <input type="hidden" name="page.orderBy" id="orderBy" value="${page.orderBy}"/>
    <input type="hidden" name="page.order" id="order" value="${page.order}"/>
    <input type="hidden" name="authId" id="authId" value="${authId}"/>
    <input type="hidden" name="page.pageSize" id="pageSize" value="${page.pageSize}" />
    <input type="hidden" name="page.excelExp" id="excelExp" value="${page.excelExp}" />
  <!-- 查询条件 -->
<!--    <div id="filter" class="filter"> -->
<!--     <div id="item" class="item"> -->
<!--     <div class="where"> -->
<!--         <div class="and"> -->
<!--            <span>图片名:</span> -->
<%--            <input type="text" class="small" name="filter_LIKES_pic_name" value="${param['filter_LIKES_pic_name']}" /> --%>
<!--         </div> -->
<!--     </div> -->

<!--       <div class="space"></div> -->
<!--       <div style="text-align: center;"> -->
<%--       <img src="${ctx}/images/b_select.gif" alt="" onclick="search();" class="pointer" align="middle"/> --%>
<%--       <img src="${ctx}/images/b_reset.gif" alt="" onclick="resetb();" class="pointer"align="middle"/> --%>
<!--       </div> -->
<!--     </div> -->
<%--     <div id="contral" class="contral pointer" onclick="contral(this);"><img src="${ctx}/images/f_close.gif" title="收起查询面板"/></div> --%>
<!--    </div> -->
  
   <div class="mainC">
	<!-- 增删改查...操作菜单-->
	<div id="operate" class="operate">
<%-- 	  <div><img src="${ctx}/images/b_add.gif" alt="增加" onclick="opr_input('picture!input.action',false,'${authId}');"/></div> --%>
	  <div><img src="${ctx}/images/b_edit.gif" alt="修改" onclick="opr_update('picture!input.action','mainForm',false,'${authId}');" /></div>
<%-- 	  <div><img src="${ctx}/images/b_del.gif" alt="删除" onclick="opr_delete('picture!delete.action','mainForm');" /></div> --%>
	</div>
<!-- id,apk_digest,apk_name,apk_md5,apk_version,system_version,
apk_path,apk_url,apk_icon,icon_md5,apk_size,create_time -->
      <table class="mtab" cellpadding="2" cellspacing="1" border="0">
			<tr align="center">
				<th class="first"><input type="checkbox" id="box" name="box" onclick="checkedAll('ids')"/></th>
				<th>产品类别</th>
				<th>图片颜色</th>
				<th>颜色色值</th>
				<th>图片名</th>
				<th>图片url</th>
				<th>图片新增时间</th>
			</tr> 
			<c:forEach items="${page.result}" var="a" varStatus="c">
				<tr align="center">
					<td><input type="checkbox" value="${a.id}" id="id_${a.id}" name="ids"/></td>
<%-- 					<td>${a.protype_id}</td> --%>
					<td>
						<c:if test="${a.protype_id == 1}">壁挂净水器</c:if>
						<c:if test="${a.protype_id == 2}">台式净水器</c:if>
						<c:if test="${a.protype_id == 3}">立式净水器</c:if>
					</td>
					<td>${a.pic_color}</td>
					<td>${a.pic_tone}</td>
					<td>${a.pic_name}</td>
					<td>
						<c:if test="${a.pic_url != null && a.pic_url != ''}">
								&nbsp;&nbsp;<a href="#" id="icondelete" onclick="clsGG('${a.pic_url}');">查看图片</a>
						</c:if>
					</td>
					<td>${a.pic_addtime}</td>
				</tr>
			</c:forEach>
		</table>
	</div> 
	<center><input class="button" type="button" value="返回" onclick="history.back()" /></center>
</form>
<!-- 分页区域-->
<div id="page" class="page">
<wlps:page page="${page}" showPageSize="true" excelExp="false" /></div>
<!-- end--------------------------------------- -->

</body>
</html>
