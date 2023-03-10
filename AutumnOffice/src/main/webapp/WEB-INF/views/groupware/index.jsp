<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<style>
.profile {
	text-align: center;
	padding-top: 12%;
	padding-bottom:5%;
	padding-left:5%;
	padding-right:5%;
}

.time_btn {
	width: 120px;
}

#time_span {
	margin-top: 15px;
	margin-bottom: 30px;
	margin-left: 65px;
}

.card {
}
.profileImageMain{
	border : 1px solid #9DA9BB;
}
@import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap');
td{
	font-family: 'IBM Plex Sans KR', sans-serif;
	font-size: 15px;
}
th{
	font-family: 'IBM Plex Sans KR', sans-serif;
	font-size: 15px;
}
h3{
	font-family: 'IBM Plex Sans KR', sans-serif;
}
h4{
	font-family: 'IBM Plex Sans KR', sans-serif;
	font-weight: bold;
}
h5{
	font-family: 'IBM Plex Sans KR', sans-serif;
	font-weight: bold;
}
a{
	font-family: 'IBM Plex Sans KR', sans-serif;
	font-size: 15px;
	font-weight: bold;
	color: #748194;
}
span{
	font-family: 'IBM Plex Sans KR', sans-serif;
}
button{
	font-family: 'IBM Plex Sans KR', sans-serif;
	font-size: 15px;
}
p{
	font-family: 'IBM Plex Sans KR', sans-serif;
}
.groupware-main-left{
	width: 29%; 
	float: left;
}
#profileInfo{
	margin-left:38%;
}
#workTimeView{
	text-align: center;
	margin-top: 20px;
}
#time_span{
	padding-right:2%;
}
.btn{
	font-family: 'IBM Plex Sans KR', sans-serif;
	font-weight: bold;
}
#mailBtn{
	text-align: center;
 	padding-top: 5%; 
 	padding-bottom: 5%; 
 	font-family: 'IBM Plex Sans KR', sans-serif;
}
#msgBtn{
	text-align: center; 
 	padding-top: 5%; 
 	padding-bottom: 5%; 
}
#weatherView{
	text-align: center; 
	padding: 5% 10%;
	background-color: #2C7BE5;
	color: white;
}
.groupware-main-right{
	width: 69%;
	float: right;
	color:#5E6E82;
}
</style>
<!-- popup -->
<c:if test="${popup.popupSta eq 1}">
	<jsp:include page="../management/base/popup.jsp"/>
</c:if>
<!-- ========================== -->
<!--     ???????????? ?????? - ?????? ?????????      -->
<!-- ========================== -->
<div class="groupware-main-left">
	<!-- -------------------------- -->
	<!--  ???????????? ?????? - ?????????/????????????      -->
	<!-- -------------------------- -->
	<div class="card md-3 profile" >
		<div class="avatar avatar-4xl" id="profileInfo">
			<img class="rounded-soft profileImageMain" 
				src="${cPath}/groupware/main/groupwareMainProfileInfo.do" 
				onerror="this.src='${cPath}/resources/groupware/assets/img/profile_user_example.png'"   />
		</div>
		<div class="card-body d-flex flex-column justify-content-between" id="myInfo"></div>
	</div>
	<!-- -------------------------- -->
	<!-- ???????????? ?????? - ????????????/???????????????    -->
	<!-- -------------------------- -->
	<br />
	<div class="card md-3">
		<span id="workTimeView">
			<h4><span class="fas fa-stopwatch"></span>&nbsp;???????????? : 00h 00m</h4>
		</span> 
		<span id="time_span">
			<button style="width:40%"
				class="btn btn-outline-primary rounded-pill me-1 mb-1 time_btn" 
				type="button" id="goTo">??????</button>
			<button style="width:40%"
				class="btn btn-outline-primary rounded-pill me-1 mb-1 time_btn"
				type="button" id="endWork">??????</button>
		</span>
	</div>
	<br />
	<!-- -------------------------- -->
	<!--     ???????????? ?????? - ????????????          -->
	<!-- -------------------------- -->
	<div  class="card md-3" id="mailBtn"
			onclick="location.href='${cPath}/groupware/mail/mailInsert.do'">
			<h4>
				<span class="far fa-envelope"></span> ?????? 
			</h4>
	</div>
	<br>
	<!-- -------------------------- -->
	<!--     ???????????? ?????? - ?????????           -->
	<!-- -------------------------- -->
	<div class="card md-3" id="msgBtn"
		onclick="location.href='${cPath}/groupware/chat/chatHome.do'">
		<h4>
			<span class="far fa-comment"></span>&nbsp;?????????&nbsp;
		</h4>
	</div>
	<br />
	<!-- -------------------------- -->
	<!--     ???????????? ?????? - ??????             -->
	<!-- -------------------------- -->
	<div class="card md-3" id="weatherView">
		<div class="weather">
			<img class='CurrIcon'><span class='City'></span>
		</div>
	</div>
</div>

<!-- ========================== -->
<!--    ???????????? ?????? - ????????? ?????????      -->
<!-- ========================== -->
<div class="groupware-main-right">
	<!-- -------------------------- -->
	<!--    ???????????? ?????? - ????????????            -->
	<!-- -------------------------- -->
	<div class="card md-3">
		<div class="card-header d-flex flex-between-center py-2 border-bottom">
			<h5><span class="fas fa-caret-right"></span>&nbsp;?????? ??????</h5>
			<a href="${cPath}/groupware/calendar/empCalendarList.do"><span class="fas fa-plus"></span></a>
		</div>
		<div class="card-body d-flex flex-column justify-content-between calendarView" style="padding: 2%">
		</div>
	</div>
	<br />
	<br />
	<!-- -------------------------- -->
	<!--     ???????????? ?????? - ?????????            -->
	<!-- -------------------------- -->
	<div class="card md-3" style="margin-top: -3%;">
		<div class="card-header d-flex flex-between-center py-2 border-bottom">
			<h5><span class="fas fa-caret-right"></span>&nbsp;?????????</h5>
			<a href="${cPath}/groupware/approval/doc/waitAppDocList.do"><span class="fas fa-plus"></span></a>
		</div>
		<div class="card-body d-flex flex-column justify-content-between" style="padding: 1%">
			<div class="table-responsive scrollbar">
				<table class="table table-hover" >
					<tbody id="approvalView">
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<br />
	<!-- -------------------------- -->
	<!--     ???????????? ?????? - ????????????          -->
	<!-- -------------------------- -->
	<div class="card md-3">
		<div class="card-header d-flex flex-between-center py-2 border-bottom">
			<h5><span class="fas fa-caret-right"></span>&nbsp;????????????</h5>
			<a href="${cPath}/groupware/board/noticeList.do"><span class='fas fa-plus'></span></a>
		</div>
		<div class="card-body d-flex flex-column justify-content-between"  style="padding: 1%" >
				<table class="table table-hover" >
					<tbody id="noticeView">
					</tbody>
				</table>
		</div>
	</div>
</div>


<script>
	//========================================================
	// ?????? API
	//========================================================
	var apiURI = "https://api.openweathermap.org/data/2.5/weather?q=daejeon&appid=f4b1c6882c589c4f858bc7e7c459df9c";
	
	$(function() {
		$.ajax({
			url : apiURI,
			dataType : "json",
			type : "GET",
			async : "false",
			success : function(resp) {
				console.log(resp);
				console.log("???????????? : " + (resp.main.temp - 273.15));
				console.log("???????????? : " + resp.main.humidity);
				console.log("?????? : " + resp.weather[0].main);
				console.log("?????????????????? : " + resp.weather[0].description);
				console.log("?????? ????????? : " + resp.weather[0].icon);
				console.log("??????   : " + resp.wind.speed);
				console.log("??????   : " + resp.sys.country);
				console.log("????????????  : " + resp.name);
				console.log("??????  : " + (resp.clouds.all) + "%");

				imgURL = "http://openweathermap.org/img/wn/"
						+ resp.weather[0].icon + ".png";
				$(".CurrIcon").attr("src", imgURL);
				$(".City").html(
						"??????  ???????????? : "
								+ parseInt(resp.main.temp - 273.15)
								+ "???");
			}
		})
	
	})
	//========================================================
	// ???????????? ?????? ?????? ??? Disabled ??????
	//========================================================
	let goTo = $("#goTo");

	$(document).ready(function(){
		
		$.ajax({
			url : "${cPath}/groupware/attendance/my/status/goToWorkList.do",
			dataType : "JSON",
			success : function(resp) {
				
				if(resp == 0){
					goTo.prop("disabled", false);
				}else{
					goTo.prop("disabled", true);
				}
			},
			error : function(errorResp) {
				console.log(errorResp.status);
			}
		})
		
	})

	//========================================================
	// ????????????
	//========================================================
	let noticeView = $("#noticeView");
		
	$.ajax({
		url : "${cPath}/groupware/main/groupwareMainNoticeList.do",
		dataType : "JSON",
		success : function(noticeList) {
			noticeView.empty();
			let makeTrTags = [];
			let noticeTable;
			console.log("???????????? list ??????"+noticeList.length);
			if(noticeList.length > 0){
				$.each(noticeList, function(index, noticeVO){ 
					noticeTable = "<tr class='cTr' id="+noticeVO.nocNo+"><td>"+(index+1)+"</td><td>"+noticeVO.nocTit+"</td><td>?????????</td><td>"+noticeVO.nocDate+"</td></td>";
					makeTrTags.push(noticeTable);
				});
			}else{
				noticeTable = "<tr><td><span class='far fa-times-circle' /> ????????? ??????????????? ????????????.</td></tr>";
				makeTrTags.push(noticeTable);
			}
			noticeView.append(makeTrTags);
		},
		error : function(errorResp) {
			console.log(errorResp.status);
		}
	})
	$(document).on('click','#noticeView > .cTr', function(event){
			let noticeId = $(this).attr('id');
			location.href="${cPath}/groupware/board/noticeView.do?what="+noticeId;
	})
	
	
	//========================================================
	// ?????? ??????
	//========================================================
	let calendarView = $(".calendarView");
		
	$.ajax({
		url : "${cPath}/groupware/main/groupwareMainCalendarList.do",
		dataType : "JSON",
		success : function(calendarList) {
			calendarView.empty();
			let makeTrTags = [];
			let calendarTable;
			console.log("????????? list ??????"+calendarList.length);
			if(calendarList.length > 0){
				$.each(calendarList, function(index, calendarVO){
					if(calendarVO.calSta == 0){
						
						calendarTable = "<div class='row g-3 timeline timeline-primary timeline-past pb-card' style='margin-bottom: 1%'>";
						calendarTable += 	"<br><div class='col-auto ps-4 ms-2'>";
						calendarTable += 		"<div class='ps-2'>";
						calendarTable += 			"<div class='icon-item icon-item-sm rounded-circle bg-200 shadow-none'>";
						calendarTable += 				"<span style='color:#2C7BE5' class='fas fa-calendar-check'></span>";
						calendarTable += 			"</div>";
						calendarTable += 		"</div>";
						calendarTable += 	"</div>";
						calendarTable += 	"<div class='col'>";
						calendarTable += 		"<div class='row gx-0 border-bottom pb-card' style='text-align: left'>";
						calendarTable += 			"<div class='col'>";
						calendarTable += 				"<h6 class='text-800 mb-1'><span class='badge badge-soft-warning'>?????? ??????</span></h6>";
						calendarTable += 				"<p class='fs--1 text-600 mb-0' style='font-family: 'IBM Plex Sans KR', sans-serif;'>"+calendarVO.calTit+"</p>";
						calendarTable += 			"</div>";
						calendarTable += 			"<div class='col-auto'>";
						if(calendarVO.calAllday==0){
							calendarTable += 				"<p class='fs--1 text-500 mb-0' style='font-family: 'IBM Plex Sans KR', sans-serif;'>"+calendarVO.calStart+"~"+calendarVO.calEnd+"</p>";
						}else{
							calendarTable += 				"<p class='fs--1 text-500 mb-0' style='font-family: 'IBM Plex Sans KR', sans-serif;'>????????????</p>";
						}
						calendarTable += 			"</div>";
						calendarTable += 		"</div>";
						calendarTable += 	"</div>";
						calendarTable += "</div>";
						
					}else {
						calendarTable = "<div class='row g-3 timeline timeline-primary timeline-past pb-card' style='margin-bottom: 1%'>";
						calendarTable += 	"<br><div class='col-auto ps-4 ms-2'>";
						calendarTable += 		"<div class='ps-2'>";
						calendarTable += 			"<div class='icon-item icon-item-sm rounded-circle bg-200 shadow-none'>";
						calendarTable += 				"<span style='color:#2C7BE5' class='far fa-calendar-check'></span>";
						calendarTable += 			"</div>";
						calendarTable += 		"</div>";
						calendarTable += 	"</div>";
						calendarTable += 	"<div class='col'>";
						calendarTable += 		"<div class='row gx-0 border-bottom pb-card' style='text-align: left'>";
						calendarTable += 			"<div class='col'>";
						calendarTable += 				"<h6 class='text-800 mb-1'><span class='badge badge-soft-primary'>?????? ??????</span></h6>";
						calendarTable += 				"<p class='fs--1 text-600 mb-0' style='font-family: 'IBM Plex Sans KR', sans-serif;'>"+calendarVO.calTit+"</p>";
						calendarTable += 			"</div>";
						calendarTable += 			"<div class='col-auto'>";
						if(calendarVO.calAllday==0){ 
							calendarTable += 				"<p class='fs--1 text-500 mb-0' style='font-family: 'IBM Plex Sans KR', sans-serif;'>"+calendarVO.calStart+"~"+calendarVO.calEnd+"</p>";
						}else{
							calendarTable += 				"<p class='fs--1 text-500 mb-0' style='font-family: 'IBM Plex Sans KR', sans-serif;'>????????????</p>";
						}
						calendarTable += 			"</div>";
						calendarTable += 		"</div>";
						calendarTable += 	"</div>";
						calendarTable += "</div>";
						
					}
						makeTrTags.push(calendarTable);
				});
			}else{
				calendarTable = "<table><tr class='not-click'><td><span class='far fa-times-circle' /> ????????? ????????? ????????????.</td></tr></table>";
				makeTrTags.push(calendarTable);
			}
			calendarView.append(makeTrTags);
		},
		error : function(errorResp) {
			console.log(errorResp.status);
		}
	})
	
	//========================================================
	// ?????? ?????? ??????
	//========================================================
	let approvalView = $("#approvalView");
	
	$.ajax({
		url : "${cPath}/groupware/main/groupwareMainApprovalList.do",
		dataType : "JSON",
		success : function(approvalList) {
			approvalView.empty();
			let makeTrTags = [];
			let approvalTable;
			console.log("???????????? list ??????"+approvalList.length);
			if(approvalList.length > 0){
				$.each(approvalList, function(index, approvalVO){
						approvalTable = "<tr class='cTr' id="+approvalVO.eleNo+"><td>"+(index+1)+"</td><td><span class='badge badge-soft-light'>"+approvalVO.appForm.apfCat+"</span></td><td>"+approvalVO.eleTit+"</td><td>"+approvalVO.eleCrd+"</td></td><td>"+approvalVO.empNm+"</td>";
						makeTrTags.push(approvalTable);
				});
			}else{
				approvalTable = "<tr><td><span class='far fa-times-circle' /> ????????? ?????? ?????? ????????? ????????????.</td></tr>";
				makeTrTags.push(approvalTable);
			}
			approvalView.append(makeTrTags);
		},
		error : function(errorResp) {
			console.log(errorResp.status);
		}
	})
	$(document).on('click','#approvalView > .cTr', function(event){
			let approvalId = $(this).attr('id');
			location.href="${cPath}/groupware/approval/doc/waitAppDocDetail.do?eleNo="+approvalId;
	})
	
	//========================================================
	// ?????? ?????? ?????????
	//========================================================
	let myInfo = $("#myInfo");
	
	$.ajax({
		url : "${cPath}/groupware/main/groupwareMainMyInfo.do",
		dataType : "JSON",
		success : function(employeeVO) {
			if(employeeVO.empSta == 1){
				myInfo.empty();
				myInfo.html("<span><span class='fas fa-sun'></span> "+employeeVO.empNm+"&nbsp;"+employeeVO.jobNm+"???</span><span>????????? ?????? ?????? ?????????!</span><hr><span class='badge badge-soft-secondary'>"+employeeVO.depNm+"</span><hr><span style='font-weight:bold;font-size:20px' ><span class='fas fa-smile' style='color:#48D1CC	'></span> ?????? ??????????????????.</span>");
			}else{ // ??????????????????
				myInfo.empty();
				myInfo.html("<span><span class='fas fa-sun'></span> "+employeeVO.empNm+"&nbsp;"+employeeVO.jobNm+"???</span><span>????????? ?????? ?????? ?????????!</span><hr><span class='badge badge-soft-secondary'>"+employeeVO.depNm+"</span><hr><span style='font-weight:bold;font-size:20px'><span class='fas fa-chair' style='color:coral'></span> ???????????? ????????????.</span>");
			}
		},
		error : function(errorResp) {
			console.log(errorResp.status);
		}
	})
	
	//========================================================
	// ?????? ???????????? ?????????
	//========================================================
	let workTimeView = $("#workTimeView");
	$(function() {
		const timer = function () {
			$.ajax({
				url : "${cPath}/groupware/main/groupwareMainWorkTimeInfo.do",
				dataType : "JSON",
				success : function(status) {
					workTimeView.html("<h4 style='font-weight: bold;'><span class='fas fa-stopwatch'></span>&nbsp;???????????? : "+status.sumTime+"</h4>");
				},
				error : function(errorResp) {
					console.log(errorResp.status);
				}
			})
		}; 
		
		timer(); // loop ??? ?????? ??????
		setInterval(timer, 60000);
	});
	
	//========================================================
	// ????????????
	//========================================================
	goTo.on('click', function(){
		$.ajax({
			url : "${cPath}/groupware/attendance/my/status/goToWork.do",
			dataType : "JSON",
			success : function(resp) {
				if(resp==1){
					toastr.info("??????????????? ?????????????????????.<br> ????????? ????????????!");
					
					$.ajax({
						url : "${cPath}/groupware/attendance/my/status/goToWorkList.do",
						dataType : "JSON",
						success : function(resp) {
							
							if(resp == 0){
								goTo.prop("disabled", false);
							}else{
								goTo.prop("disabled", true);
							}
						},
						error : function(errorResp) {
							console.log(errorResp.status);
						}
					})
					
					
				}else{
					toastr.info("?????? ????????? ?????????????????????.<br> ?????? ??? ?????? ??????????????????");
				}
			},
			error : function(errorResp) {
				console.log(errorResp.status);
			}
		})
	})
	
	//========================================================
	// ????????????
	//========================================================
	let endWork = $("#endWork");
	
	endWork.on('click',function(){
		$.ajax({
			url : "${cPath}/groupware/attendance/my/status/endWork.do",
			dataType : "JSON",
			success : function(resp) {
				if(resp==1){
					toastr.info("?????? ????????? ?????????????????????.<br> ????????? ?????????????????????!");
				}else{
					toastr.info("?????? ????????? ?????????????????????.<br> ?????? ??? ?????? ??????????????????");
				}
			},
			error : function(errorResp) {
				console.log(errorResp.status);
			}
		})
	})
</script>