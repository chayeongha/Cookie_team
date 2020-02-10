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
<script src='/fullcalendar/timegrid/main.js'></script>
<script src='/fullcalendar/interaction/main.js'></script>
<script src='fullcalendar/core/locales/ko.js'></script>

<script>
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
 
    var calendar = new Calendar(calendarEl, {
      plugins: [ 'interaction', 'dayGrid', 'timeGrid' ],
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay'
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
      locale: 'ko'
    });
 
    calendar.render();
  });
 
	var calendar = new Calendar(calendarEl, {
	  dateClick: function() {
	    alert('a day has been clicked!');
	  }
	});
	  
	calendar.on('dateClick', function(info) {
		  console.log('clicked on ' + info.dateStr);
	});
		  	

</script>
</head>

<body>
 
 <div id="external-events">
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
 
 <div id='calendar' style="width: 50%; height: 50%;"></div>
 
</body>
</html>