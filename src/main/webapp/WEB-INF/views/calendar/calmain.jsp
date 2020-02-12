<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!DOCTYPE html>
<html>
<head>
<link href='/fullcalendar/core/main.css' rel='stylesheet' />
<link href='/fullcalendar/daygrid/main.css' rel='stylesheet' />
<link href='/fullcalendar/timegrid/main.css' rel='stylesheet' />

<script src='/fullcalendar/core/main.js'></script>
<script src='/fullcalendar/daygrid/main.js'></script>
<script src='/fullcalendar/interaction/main.min.js'></script>
<script src='/fullcalendar/timegrid/main.min.js'></script>
<script src='/fullcalendar/core/locales/ko.js'></script>

<link href="${pageContext.request.contextPath}/css/board/qnaList.css" rel="stylesheet">
<c:import url="../template/boot.jsp" />
<c:import url="../layout/header.jsp" />
<link href="${pageContext.request.contextPath}/css/reset.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/board/qnaList.css" rel="stylesheet">
</head>

<body>
 	<div class="body_main">
	<div class="b"></div>
	<!-- 서브 타이틀 -->
	<div class="subTitle_wrap">
		<div class="subTitle_inner">
			<h2>My Calendar</h2>
		</div>
	</div>

	<div id="external-events">
	
		<c:set value="y" var="y"/>
		<c:if test="${mcheck ne y }">
    	<button id="ckbtn11" type="button" class="btnCheck1" name="memCheck" value="y" style="display: inline">출석체크</button>
 		</c:if>
 		<c:if test="${mcheck eq y }">
    	<button id="ckbtn22" type="button" class="btnCheck2" style="display: inline">출석완료</button>
		</c:if>
		
	    <input type="hidden" id="memNum" class="memNumber" name="memNum" value="${member.memNum}">
	    	
	    <!--1.출석체크 -->	
		<!--스크립트에서 배열에 넣기위해 컨트롤에서 받은 출석날짜값이있는 ar을 반복문을돌림.-->
	    <c:forEach items="${getCheck}" var="gcheck">
	    	<input type="hidden" value="${gcheck.checkDate}" class="checkDate">
	    </c:forEach>
	    <!--  -->
	  
	</div>

 <div class="container calendar-container">
	<div id="calendar" style="max-width:900px; margin:40px auto; width: 50%; height: 50%;"></div>
</div>


 <script type="text/javascript">

	 //출석체크 
	 $('#ckbtn11').click(function(){
		var d = new Date();
	    var currentDate = d.getFullYear() + "-" + ( d.getMonth() + 1 ) + "-" + d.getDate(); 
		$.ajax({
			url: "checkInsert",
			type: "POST",
			data:{
				memNum: $(".memNumber").val(),
				memCheck: $(".btnCheck1").val(),
				checkDate: currentDate
			},
			success: function(data){
				alert(data);
				location.reload();	
			}
		});
	});


 	//풀캘린더
 	document.addEventListener('DOMContentLoaded', function() {
	    var Calendar = FullCalendar.Calendar;
	    var Draggable = FullCalendarInteraction.Draggable;
	 
	    var containerEl = document.getElementById('external-events');
	    var calendarEl = document.getElementById('calendar');
	    var checkbox = document.getElementById('drop-remove');
	 
	    // initialize the external events(이벤트초기화)
	    new Draggable(containerEl, {
	      itemSelector: '.fc-event',
	      eventData: function(eventEl) {
	        return {
	          title: eventEl.innerText
	        };
	      }
	    });

	    /*2.출석체크 */
		//db에있는 출석날짜를 가져와서 화면에 출력하는 폼에 넣은 후 check라는 배열에 넣음(push).
		var check = [];
		$(".checkDate").each(function(){
			var dateC = {};
			dateC.start = $(this).val();
			dateC.end = $(this).val();
			dateC.color="";
			dateC.className="test";
			
			//dateC.title= "이미지야나와라";
			//dateC.imageurl="../images/check.jpg";
			//dateC.imageurl= "../images/check.jpg";
			//dateC.overlap= false;
			//dateC.url="../images/check.jpg";
			//dateC.rendering="background-image";
			check.push(dateC);
			
		});

		
	    // initialize the calendar(캘린더초기화)
	    var calendar = new Calendar(calendarEl, {
		  plugins: [ 'interaction', 'dayGrid', 'timeGrid' ],
	      header: {
	        left: 'prev,next today',
	        center: 'title',
	        right: 'dayGridMonth,timeGridWeek,timeGridDay'
	      },
	      editable: false,
	      droppable: true, // this allows things to be dropped onto the calendar
	      drop: function(info) {
	        // is the "remove after drop" checkbox checked?
	        if (checkbox.checked) {
	          // if so, remove the element from the "Draggable Events" list
	          info.draggedEl.parentNode.removeChild(info.draggedEl);
	        }
	      },
	      locale: 'ko',
	      /*3.출석체크 */
	      //이벤트안에 체크배열을 넣어줌.
	      events: check,
// 	      eventRender:function(event, eventElement) {
// 	    	  if (event.imageurl) {
// 	    		  eventElement.find("span.fc-title").prepend("<center><img src='" + event.imageurl + "'><center>");
// 	    	   }
//           }
	      
		    //원하는 날짜에 타이틀을 넣는 예제
	          //{
	            //title: 'simple event',
	            //start: '2020-02-02'
	          //},
	          //{
	            //title: 'simple event',
	            //start: '2020-02-03'
	          //}
	    });
	    calendar.render();
	  });

	$(".test").parent().addClass("test2");
 	
</script>

 
 
 <c:import url="../layout/footer.jsp" />
</div> 
</body>
</html>