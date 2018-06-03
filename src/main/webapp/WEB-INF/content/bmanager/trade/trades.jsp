<%@page contentType="text/html;charset=UTF-8"%>

<%@ include file="/common/taglibs.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>内部办公自动化系统</title>
<%@ include file="/common/head.jsp"%>
<link rel="stylesheet" href="${ctx}/css/content.css" type="text/css" />

<style type="text/css">
a {
	font-size: 16px
}

#未访问：蓝色、无下划线 
a:link {
	color: green;
	text-decoration: none;
}

#激活：红色 
a:active: {
	color: red;
}

#已访问：purple、无下划线 
a:visited {
	color: green;
	text-decoration: none;
}

a:hover {
	color: red;
	text-decoration: underline;
}

.gonggao {
	position: absolute;
	top: 30px;
	left: 700px;
	width: 100px;
	height: 100px;
	border: 1px solid #993300;
	background-color: #ffffff;
}

.gonggao h1 {
	line-height: 50px;
	font-size: 24px;
	font-family: "黑体";
	font-weight: bold;
	text-align: center;
}

.gonggao div {
	line-height: 30px;
	font-size: 18px;
	font-family: "黑体";
	text-align: center;
	color: #993300;
}

.gonggao div a, .gonggao div a:visited {
	color: #993300;
}
</style>

<script type="text/javascript">
$(document).ready(function() {
	//为inputForm注册validate函数
	$("#mainForm").validate({
		submitHandler:function(form){
			var flag = tk();
			if(flag){form.submit();}
        }
	});
});

	function tk() {
		var state = $('#w_state') .val();
		var audit_persons = document.getElementById('autid_person').value;
		var flag = false;
		if(state!=0){
			alert("提现订单不是待审核状态！");
		return flag;
		}else{
			if(audit_persons != "admin"){
				alert("该提现订单为:"+audit_persons+" 审核，平台无法操作");
				location.reload();
				return flag;
			}else{
				
			}
		}
	}
	
	function tg() {
		var state = $('#w_state') .val();
		var audit_person = $('#autid_person').val();
		var audit_persons = document.getElementById('autid_person').value;
		var flag = false;
		if(state!=0){
			document.getElementById("btnShow").style.display="none";
			alert("提现订单不是待审核状态！");
			location.reload();
			//window.location.href = document.referrer;
			return flag;
		}else{
			if(audit_persons != "admin"){
				alert("该提现订单为:"+audit_persons+" 审核，平台无法操作");
				location.reload();
				return flag;
			}else{
				alert("审核通过!")
			}
		}
	}

  
</script>

</head>
<body>
	<div class="currloca">
		<p>${auth.fullMenu}</p>
		<div class="sitemap">
			<span style="display: block; float: left"><s:actionmessage
					theme="custom" /></span> <span id="add2custom"><img class="pointer"
				onclick="add2custom('${authId}');return false;" id="aCustom"
				width="24" align="absmiddle" height="24" title="添加到常用操作"
				src="${ctx}/images/favorite.png" /></span>
		</div>
	</div>
	<div class="titt">
		<h2>
			<img alt="" src="${ctx}/images/web/311.gif" align="absmiddle" />${auth.label}</h2>
	</div>
	<form id="mainForm" action="trades!save.action?withdrawal_order=${withdrawal_order}"method="post">
		<input type="hidden" name="page.pageNo" id="pageNo"
			value="${page.pageNo}" /> <input type="hidden" name="page.orderBy"
			id="orderBy" value="${page.orderBy}" /> <input type="hidden"
			name="page.order" id="order" value="${page.order}" /> <input
			type="hidden" name="authId" id="authId" value="${authId}" /> <input
			type="hidden" name="page.pageSize" id="pageSize"
			value="${page.pageSize}" /> <input type="hidden"
			name="page.excelExp" id="excelExp" value="${page.excelExp}" />
		<!-- 查询条件 -->
		<div id="filter" class="filter">
			<div id="item" class="item">
				<div class="where">
				</div>

				<div class="space"></div>
				<div style="text-align: center;">
					<img src="" alt="" onclick="search();" class="pointer"
						align="middle" /> <img src="" alt="" onclick="resetb();"
						class="pointer" align="middle" />
				</div>
			</div>
			<div id="contral" class="contral pointer" onclick="contral(this);">
				<img src="${ctx}/images/f_close.gif" title="收起查询面板" />
			</div>
		</div>

		<div class="mainC">
			<!-- 增删改查...操作菜单-->
			<%-- 	<div id="operate" class="operate" style="display: ${user.username=='admin'?'block':'none'}"> --%>
			<%-- 	  <div><img src="${ctx}/images/b_add.gif" alt="增加" onclick="opr_input('partner!input.action',false,'${authId}');"/></div> --%>
			<%-- 	  <div><img src="${ctx}/images/b_edit.gif" alt="修改" onclick="opr_update('partner!input.action','mainForm',false,'${authId}');" /></div> --%>
			<%-- 	  <div><img src="${ctx}/images/b_del.gif" alt="删除" onclick="opr_delete('partner!delete.action','mainForm');" /></div> --%>
			<!-- 	</div> -->
			<table class="mtab" cellpadding="2" cellspacing="1" border="0">
			
				<c:forEach items="${page.result}" var="a" varStatus="c">
					<tr>
						<td width="100px">提现单号:</td>
						 <td id = "orders" naem = "orders" value="${withdrawal_order}">${a.withdrawal_order}</td>
					</tr>
					<tr>
						<td>提现人编号:</td>
						<td>${a.user_number}</td>
					</tr>
					
					<tr>
						<td>支付宝名称:</td>
						<td>${a.pay_name}</td>
					</tr>
					
					<tr>
						<td>支付宝账号:</td>
						<td>${a.pay_account}</td>
					</tr>
					
					<tr>
						<td>提现日期:</td>
						<td>${a.add_time}</td>
					</tr>
					<tr>
						<td>提现时间段:</td>
						<td>${a.last_time}～${a.add_time}</td>
					</tr>
					<tr>
						<td colspan="2">购买型:
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;
						<a href="ordersss!list.action?trade_state=${a.withdrawal_state}&ord_addtime=${a.add_time}&ord_modtime=${a.last_time}&ord_managerno=${a.user_number}&ord_status=1,3">购买型详情</a>
						</td>
					</tr>
					<tr>
						<td>壁挂式:</td>
						<td>${a.sell_wall}台</td>
					</tr>
					<tr>
						<td>立式:</td>
						<td>${a.sell_vertical}台</td>
					</tr>
					<tr>
						<td>台式:</td>
						<td>${a.sell_desktop}台</td>
					</tr>
					
					<tr>
						<td>购买型合计(去押金):</td>
						<td>${a.buy_combined}元</td>
					</tr>
					

					<tr>
						<td colspan="3">续费型:
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;
						<a href="orderss!list.action?trade_state=${a.withdrawal_state}&ord_addtime=${a.add_time}&ord_modtime=${a.last_time}&ord_managerno=${a.user_number}&ord_status=4,5">续费型详情</a>
						</td>
					</tr>
					<tr>
						<td>壁挂式:</td>
						<td colspan="2">${a.wall_renew}台</td>
					</tr>
					<tr>
						<td>立式:</td>
						<td>${a.vertical_renew}台</td>
					</tr>
					<tr>
						<td>台式:</td>
						<td>${a.desktop_renew}台</td>
					</tr>
					<tr>
						<td>续费型合计(去押金):</td>
						<td>${a.renewal_combined}元</td> 
					</tr>

					<tr>
						<td colspan="2">可提现金额为:</td>
					</tr>
					<c:if test="${a.par_pact == 1}">
					<tr>
						<td>是否按照合同:</td>
						<td>是</td>
					</tr>
					</c:if>
					<c:if test="${a.par_pact == 0}">
					<tr>
						<td>是否按照合同:</td>
						<td>否</td>
					</tr>
					</c:if>
					
					<c:if test="${a.withdrawal_state == 0}">
					<tr>
						<td>返利比例:</td>
						<td>${a.wdl_fee}
						<a href="trades!updateSave.action?wdl_fee=${a.wdl_fee}&withdrawal_order=${a.withdrawal_order}">
						修改返利比例
						</a>
						</td>
					</tr>
					</c:if>
						<c:if test="${a.withdrawal_state != 0}">
					<tr>
						<td>返利比例:</td>
						<td>${a.wdl_fee}
						</td>
					</tr>
					</c:if>
					
					<tr>
						<td>安装费比例:</td>
						<td>${a.rwl_install}</td>
					</tr>
					
					<c:if test="${a.service_fee != 0}">
					<tr>
						<td>服务费:</td>
						<td><fmt:formatNumber type="number" value="${a.buy_combined*a.wdl_fee}" pattern="#.00"/></td>
						<%-- <td>${a.service_fee}</td> --%>
					</tr>
					</c:if>
					
					<c:if test="${a.service_fee == 0}">
					<tr>
						<td>服务费:</td>
						<td>${a.service_fee}</td>
					</tr>
					</c:if>
					
					<c:if test="${a.f_renewal != 0}">
					<tr>
						<td>服务费续费:</td>
						<td><fmt:formatNumber type="number" value="${a.renewal_combined*a.wdl_fee}" pattern="#.00"/></td>
						<%-- <td>${a.f_renewal}</td> --%>
					</tr>
					</c:if>
					
					<c:if test="${a.f_renewal == 0}">
					<tr>
						<td>服务费续费:</td>
						<td>${a.f_renewal}</td>
					</tr>
					</c:if>
					
					<tr>
						<td>安装费:</td>
						<td>${a.f_installation}</td>
					</tr>
					<tr>
						<td>下级返利:</td>
						<td>${a.lower_rebate}
						元&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="tradess!lists.action?withdrawal_order=${a.withdrawal_order}">查看下级返利详情</td>
					</tr>
					<input type="hidden" id = "amount" name = "amount" value="${a.total_amount}" /> 
					<tr>
						<td>合计:</td>
						<td>${a.withdrawal_amount}
							元&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="trades!input.action?withdrawal_order=${a.withdrawal_order}">修改金额</td>
						</td>
						<%-- <td><fmt:formatNumber type="number" value="${((a.buy_combined+a.renewal_combined)*a.wdl_fee)+a.f_installation+a.lower_rebate}" pattern="#.00"/></td> --%>
					</tr>
					<input type="hidden" id = "w_state" name = "w_state" value="${a.withdrawal_state}" /> 
					<input type="hidden" id = "autid_person" name = "autid_person" value="${a.audit_person}" />
				
					
				<tr>
					<th class="first" width="130"></th>
					<th class="last" colspan="3">
						<c:if test="${a.withdrawal_state == 0}">
						<input class="button" type="submit" value="审核通过" onclick="tg()" id="btnShow" />&nbsp; 
						<a href="tradesss!save.action?withdrawal_order=${a.withdrawal_order}" >
						<input type="button" value="拒绝" onclick="tk()" id="btnShow" />
						</a>
						</c:if>
						&nbsp;
						<input class="button" type="button" value="返回" onclick="history.back()" id = "aa" /></th>
				</tr>
					
				</c:forEach>
			</table>
		</div>
	</form>
	<!-- 分页区域-->
	<div id="page" class="page">
		<%-- <wlps:page page="${page}" showPageSize="true" excelExp="false" /></div> --%>

		<!-- end--------------------------------------- -->
</body>
</html>
