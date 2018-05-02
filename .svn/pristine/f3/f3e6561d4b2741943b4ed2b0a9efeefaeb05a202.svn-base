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


$(function() {
	
	// 选中跳转
	$(".tab_sel tr:gt(0)").bind("mouseover", function() {
		$(this).addClass("rowchange");
	}).bind("mouseout", function() {
		$(this).removeClass("rowchange");
	}).bind("click", function() {
		$('input[type=radio]').removeAttr("checked");
		$(this).children().first().children().attr("checked", true);
		ok();
	});

	// 弹出层用lhgdialog
	var DG = frameElement.lhgDG;
	DG.addBtn('ok', '确定', ok);

	function ok() {
		// 这里写你要操作的代码，最后写刷新代码
		var $radio = $("input[name=ids][checked]").val();
		if ($radio.length != 0) {
			parent.$('input[id="sup_id"]').val($radio);
		}

		// 确定按钮回调函数
		if ('${param.type}'.indexOf("-") == -1) {
			if (typeof (eval('parent.callback_${param.type}')) == "function") {
				eval('parent.callback_${param.type}($radio.val(),function(){DG.cancel();});');
			} else if (typeof (eval('parent.callback_${param.type}_name')) == "function") {
				eval('parent.callback_${param.type}_name($radio.val(),function(){DG.cancel();},"${name}");');
			} else if (!window.frameElement.lhgDG.advpic) {
				DG.cancel();
			}
		}
	}

});

function checkid(cid) {
	window.returnValue = cid;
	this.close();
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
     <h2><img alt="" src="${ctx}/images/web/311.gif" align="absmiddle" />选择上级图片id</h2>
   </div>
   <form id="mainForm" action="advpic!selectresourcer.action" method="post">
    <input type="hidden" name="pageResourcer.pageNo" id="pageNo" value="${pageResourcer.pageNo}"/>
    <input type="hidden" name="pageResourcer.orderBy" id="orderBy" value="${pageResourcer.orderBy}"/>
    <input type="hidden" name="pageResourcer.order" id="order" value="${pageResourcer.order}"/>
    <input type="hidden" name="authId" id="authId" value="${authId}"/>
    <input type="hidden" name="pageResourcer.pageSize" id="pageSize" value="${pageResourcer.pageSize}" />
    <input type="hidden" name="pageResourcer.excelExp" id="excelExp" value="${pageResourcer.excelExp}" />
  <!-- 查询条件 -->
   <div id="filter" class="filter">
    <div id="item" class="item">
    <div class="where">
        <div class="and">
           <span>图片id:</span>
				<input type="text" class="small" name="par_names"></input>
        </div>
    </div>

      <div class="space"></div>
      <div style="text-align: center;">
      <img src="${ctx}/images/b_select.gif" alt="" onclick="search();" class="pointer" align="middle"/>
      <img src="${ctx}/images/b_reset.gif" alt="" onclick="resetb();" class="pointer"align="middle"/>
      </div>
    </div>
    <div id="contral" class="contral pointer" onclick="contral(this);"><img src="${ctx}/images/f_close.gif" title="收起查询面板"/></div>
   </div>
      <table class="mtab tab_sel" cellpadding="2" cellspacing="1" border="0">
			<tr align="center">
				<th>选择</th>
				<!-- <th>id</th> -->
				<th>手机号码</th>
				<th>图片</th>
				<th>点击跳转url</th>
				<input type="hidden" value="上级图片id"></input>
				<th>广告图片类型</th>
				<th>图片增加时间</th>
			</tr> 
			<c:forEach items="${pageResourcer.result}" var="a" varStatus="c">
				<tr align="center">
					<td><input type="radio" value="${a.id}" id="id_${a.id}" name="ids"/></td>
					<%-- <td>${a.id}</td> --%>
					<td>${a.adv_phone}</td>
					<td>
						<c:if test="${a.adv_imgurl != null && a.adv_imgurl != ''}">
							<img src="${a.adv_imgurl}" width="80" height="40"/>
						</c:if>
					</td>
					<td>${a.adv_url}</td>
					<input type="hidden" value="${a.id}"></input>
					<td>
						<c:if test="${a.adv_type == -1}">平板广告</c:if>
						<c:if test="${a.adv_type == 0}">社区广告</c:if>
						<c:if test="${a.adv_type == -2}">首页广告</c:if>
						<c:out value="${a.menu_name}"></c:out>
					</td>
					<td>${a.adv_addtime}</td>
				</tr>
			</c:forEach>
		</table>
	</div> 
</form>
<!-- 分页区域-->
<div id="page" class="page">
<wlps:page page="${pageResourcer}" showPageSize="true" excelExp="false" /></div>
<!-- end--------------------------------------- -->

</body>
</html>
