<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang='en'>
  <head>
    <meta charset='utf-8' />
<jsp:include page="../common/header.jsp"/>
<link href='${path}/resources/fullcalendar-5.1.0/lib/main.css' rel='stylesheet' />
<script src='${path}/resources/fullcalendar-5.1.0/lib/main.js'></script>
<script type='text/javascript'>

document.addEventListener('DOMContentLoaded', function() {
  var calendarEl = document.getElementById('calendar');

  var calendar = new FullCalendar.Calendar(calendarEl, {
    googleCalendarApiKey: 'AIzaSyBvQIOoXTdqB0zDwDHaHthTK-pxYNamcrA',
    eventSources: [
    {
          googleCalendarId: '1l6fnc1qofntapm1dkn8mnqlng@group.calendar.google.com',
          className: '웹디자인기능사',
          color: '#B7F0B1', //rgb,#ffffff 등의 형식으로 할 수 있어요.
          //textColor: 'black' 
        },
      {
          googleCalendarId: 'c1jsfsi3ic1bkn4mkf019bq8r0@group.calendar.google.com',
          className: '정보처리기능사',
            color: '#FFB2D9',
            //textColor: 'black' 
        },
      {
          googleCalendarId: '9cku81j5r1h2n62jnrt8cqrgec@group.calendar.google.com',
          className: '정보처리기사',
            color: '#B2CCFF',
            //textColor: 'black' 
        },
      {
          googleCalendarId: 'li1ufh11a1v2p4l8hnr1t03lpk@group.calendar.google.com',
          className: '네트워크관리사',
            color: '#DAD9FF',
            //textColor: 'black' 
        },
      {
          googleCalendarId: 'sumbhvb7ffgdu7rrc3ksm0t0v4@group.calendar.google.com',
          className: '리눅스마스터',
            color: '#B5B2FF',
            //textColor: 'black' 
        },
      {
          googleCalendarId: '1l6fnc1qofntapm1dkn8mnqlng@group.calendar.google.com',
          className: '웹디자인기능사',
          color: '#E8D9FF',
            //textColor: 'black' 
        },
      {
          googleCalendarId: 'kijiu791lmkt35i5t4ekj4pl88@group.calendar.google.com',
          className: 'ADP/ADsP',
          color: '#204051',
            //textColor: 'black' 
        },
    ]
  });
  calendar.render();
});
</script>
<style>
#calendar{
   width:60%;
   margin:20px auto;
}
</style>
  </head>
  <body>
  <br><br><br><br><br>
    <div id='calendar'></div>
  </body>
</html>