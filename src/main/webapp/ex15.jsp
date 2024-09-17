<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ex15</title>
</head>
<style>
    table {
        width: 100%;
        border-collapse: collapse;
        font-family: Arial, sans-serif;
        margin-bottom: 20px;
    }

    th, td {
        padding: 12px 15px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }

    th {
        background-color: #4CAF50;
        color: white;
    }

    tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    tr:hover {
        background-color: #ddd;
    }
</style>

<body>
<%@ taglib prefix="mTagLib" uri="/WEB-INF/mytaglib.tld" %>
<h1>
A JSP Application to Display a Custom Tag
</h1>

<h2>Using <span style="color:green">SimpleTagSupport</span></h2>
<ul>
	<li>[X] <b>Log session id</b></li>
	<li> <mTagLib:sessionId></mTagLib:sessionId> </li>
	<br>
	<li>[X] <b>Log local date</b></li>
	<li> <mTagLib:getLocalDate></mTagLib:getLocalDate> </li>
</ul>

<h2>Using <span style="color:green">BodyTagSupport</span></h2>
<ul>
	<li>[X] <b>Format dates in tables: default separator is ",". But you can add whatever you want as long as it is not a "-" as it is used to separate days from months and years. (although you can also set a different insiderSeparator for our date instead of "-", keep in mind that hyphen "-" is the default value for insiderSeparator)</b></li>
	<li> <mTagLib:formatDatesInTable>
		20-02-2001,
		31-01-2001
	</mTagLib:formatDatesInTable> </li>
	<br>
	<li>[X] <b>Count how many character each line has</b> using the "\n" newline symbol</li>
	<li>
	<mTagLib:lineCounter>
assssssssssssssssssssssasdasddasd
asdasdasdasdsadasdasdasdasdasd
asdasdasdasdasdasd
</mTagLib:lineCounter>
	</li>
	

</ul>
</body>
</html>