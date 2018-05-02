<%@page contentType="text/html;charset=UTF-8"%>

<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>内部办公自动化系统</title>
<%@ include file="/common/head.jsp" %>
<link rel="stylesheet" href="${ctx}/css/content.css" type="text/css" />

<style type="text/css">

a.span{
	color: #E5E0E0; 
	text-decoration:none;
}

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
			.gonggao{
			    position:absolute;
			    top:30px;
			    left:700px;
			    width:100px;
			    height:100px;
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

<script type="text/javascript">
$(document).ready(function () {
	$("#filter_EQI_ord_status").attr("value",'${param.filter_EQI_ord_status}');
});

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
   <form id="mainForm" action="tradess!lists.action?withdrawal_order=${withdrawal_order}" method="post">
    <input type="hidden" name="page.pageNo" id="pageNo" value="${page.pageNo}"/>
    <input type="hidden" name="page.orderBy" id="orderBy" value="${page.orderBy}"/>
    <input type="hidden" name="page.order" id="order" value="${page.order}"/>
    <input type="hidden" name="authId" id="authId" value="${authId}"/>
    <input type="hidden" name="page.pageSize" id="pageSize" value="${page.pageSize}" />
    <input type="hidden" name="page.excelExp" id="excelExp" value="${page.excelExp}" />
  <!-- 查询条件 -->
   <div id="filter" class="filter">
    <div id="item" class="item">
    <div class="where">
        <div class="and">
           <span>被提现人编号:</span>
           	<input type="text" class="small" name="by_tkr_id" />
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
  
   <div class="mainC">
	<!-- 增删改查...操作菜单-->
<%-- 	<div id="operate" class="operate" style="display: ${user.username=='admin'?'block':'none'}"> --%>
<%-- 	  <div><img src="${ctx}/images/b_add.gif" alt="增加" onclick="opr_input('partner!input.action',false,'${authId}');"/></div> --%>
<%-- 	  <div><img src="${ctx}/images/b_edit.gif" alt="修改" onclick="opr_update('partner!input.action','mainForm',false,'${authId}');" /></div> --%>
<%-- 	  <div><img src="${ctx}/images/b_del.gif" alt="删除" onclick="opr_delete('partner!delete.action','mainForm');" /></div> --%>
<!-- 	</div> -->
      <table class="mtab" cellpadding="2" cellspacing="1" border="0">
			<tr align="center">
				<th>提现单号</th>
				<th>被提现人</th>
				<th>被提现人编号</th>
				<th>被提现金额</th>
				<th>被提现比例</th>
				<th>服务费</th>
				<th>服务费续费</th>
				<th>合计（去押金）</th>
				<th>壁挂式购买</th>
				<th>立式购买</th>
				<th>台式购买</th>
				<th>壁挂式续费</th>
				<th>立式续费</th>
				<th>台式续费</th>
				<th>修改下级返利</th>
			</tr> 
			<c:forEach items="${page.result}" var="a" varStatus="c">
			
				<tr align="center">
				<input type="hidden" value="${a.id}" id="id_${a.id}" name="ids"/>
					<td>${a.withdrawal_order}</td>
					<td>${a.by_tkr_name}</td>
					<td>${a.by_tkr_id}</td>
					<td>${a.by_tkr_total_money}</td>
					<td>${a.by_tkr_rebates}</td>
					<td>${a.service_fee}</td>
					<td>${a.f_renewal}</td>
					<td>${a.total_money}</td>
					<td>${a.sell_wall}</td>
					<td>${a.sell_vertical}</td>
					<td>${a.sell_desktop}</td>
					<td>${a.wall_renew}</td>
					<td>${a.vertical_renew}</td>
					<td>${a.desktop_renew}</td>
					<c:if test="${a.withdrawal_state == 0}">
					<td>
						<a href="tradess!saves.action?by_tkr_rebates=${a.by_tkr_rebates}&withdrawal_order=${a.withdrawal_order}&by_tkr_id=${a.by_tkr_id}">修改</a>
					</td>
					</c:if>
						<c:if test="${a.withdrawal_state != 0}">
					<td>
						<a href="#" style="text-decoration:none"><span style="color: #E5E0E0">修改</span></a>
					</td>
					</c:if>
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
