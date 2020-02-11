<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


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

</head>

<body>
 <c:import url="../template/boot.jsp"/>
 <div id="external-events">
<!--     <form action="./checkInsert" method="post"> -->
		<c:set value="y" var="y"/>
    	<c:if test="${check ne y }">
    	<button id="ckbtn11" type="button" class="btnCheck1" name="memCheck" value="y" style="display: inline">출석체크</button>
 		</c:if>
 		<c:if test="${check eq y }">
    	<button id="ckbtn22" type="button" class="btnCheck2" style="display: inline">출석완료</button>
		</c:if>
    	
    <c:forEach items="${getCheck}" var="gcheck">
    	<input type="hidden" value="${gcheck.checkDate}" class="cival">
    </c:forEach>
  
    <input type="text" id="memNum" class="memNumber" name="memNum" value="${member.memNum}">
<!--     <input type="text" id="checkDate" name="checkDate" value="2020-02-11"> -->
    
<!--   </form> -->
    
    <p>
      <strong>Draggable Events</strong>
    </p>
    <div class="fc-event">My Event 1</div>
    <div class="fc-event">My Event 2</div>
    <div class="fc-event">My Event 3</div>
    <div class="fc-event">My Event 4</div>
    <div class="fc-event">My Event 5</div>
    <p>
      <input type="checkbox" id="drop-remove">
      <label for="drop-remove">remove after drop</label>
    </p>
  </div>
 


 
 <div class="container calendar-container">
	<div id="calendar" style="max-width:900px; margin:40px auto; width: 50%; height: 50%;"></div>
</div>
 
 <script type="text/javascript">

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
	
						
			}
		});
	       	 	
			
	});

	 
 
 	document.addEventListener('DOMContentLoaded', function() {
	    var Calendar = FullCalendar.Calendar;
	    var Draggable = FullCalendarInteraction.Draggable;
	 
	    var containerEl = document.getElementById('external-events');
	    var calendarEl = document.getElementById('calendar');
	    var checkbox = document.getElementById('drop-remove');
	 
	    // initialize the external events
	    // -----------------------------------------------------------------
	 	

	    new Draggable(containerEl, {
	      itemSelector: '.fc-event',
	      eventData: function(eventEl) {
	        return {
	          title: eventEl.innerText
	        };
	      }
	    });
	 
	    // initialize the calendar
	    // -----------------------------------------------------------------
	    var check = [];
$(".cival").each(function(){
	var dateC = {};
	dateC.title = "출첵";
	dateC.start = $(this).val();
	dateC.end = $(this).val();
	check.push(dateC);
});
 	
	    
	    var calendar = new Calendar(calendarEl, {
		  plugins: [ 'interaction', 'dayGrid', 'timeGrid' ],
	      header: {
	        left: 'prev,next today',
	        center: 'title',
	        right: 'dayGridMonth,timeGridWeek,timeGridDay'
	      },
	      dateClick: function() {
	 		    alert('a day has been clicked!');
	 	   },
	      editable: true,
	      droppable: true, // this allows things to be dropped onto the calendar
	      drop: function(info) {
	        // is the "remove after drop" checkbox checked?
	        if (checkbox.checked) {
	          // if so, remove the element from the "Draggable Events" list
	          info.draggedEl.parentNode.removeChild(info.draggedEl);
	        }
	      },
	      events: check
// 	          {
// 	            title: 'simple event',
// 	            start: '2020-02-02'
// 	          },
// 	          {
// 	            title: 'simple event',
// 	            start: '2020-02-02'
// 	          }
	        
	    });
	 
	    calendar.render();
	  });
	 	
 
 </script>
 
 
</body>
</html>