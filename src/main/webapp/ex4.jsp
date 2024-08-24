<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Ex4</title>
</head>
<body>
    <h1>Exercise 4: JSP Directives</h1>
    <p>Write a JSP program to demonstrate the use of JSP Page directives.</p>
    <p>We must keep in mind that JSP directives are the elements that guide the web container on how to translate our jsp into servlet</p>
    <p>As we are talking about <b>page</b> directives that means we are talking about imported packages, and classes/interfaces, defining what type of page it is...</p>
    <p>In this exercise we'll be working with TimeLocal import</p>

    <%@page import = "java.time.LocalTime"%>
    <%
        LocalTime currTime = LocalTime.now();

        int[] timeArr = new int[]{currTime.getHour(), currTime.getMinute(), currTime.getSecond()}; 
    %>

    <span style="font-size: 20px">
        <b> <%= timeArr[0]%> </b>:
        <b> <%= timeArr[1]%> </b>:
        <b> <%= timeArr[2]%> </b>
    </span>

    <%!
        int[] updateTime(int[] tArr, int secondsToIncrement){
            int hh = tArr[0];
            int mm = tArr[1];
            int ss = tArr[2] + secondsToIncrement;

            if(ss >= 60){
                mm = mm + 1;
                ss = ss - 60;
            }

            if(mm == 60){
                hh = hh + 1;
                mm = 0;
            }

            if(hh == 24){
                hh = 0;
            }
            

            int[] newTArr = new int[]{hh, mm, ss};
            return newTArr;
        }


    %>

</body>
</html>
