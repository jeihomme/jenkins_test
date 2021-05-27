<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, user-scalable=no">
	<title>기업회원  | EVENTSO</title>

	<!-- Jquery and Bootstap core js files -->
	<script type="text/javascript" src="/resources/js/jquery.min.js"></script>	
	<script type="text/javascript" src="/resources/js/jquery.slimscroll.min.js"></script>
	<script type="text/javascript" src="/resources/js/common_cms.js"></script>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	
	<script src="${root}/unit.iwonsoft.com/base.js?uid=${uid}"></script>
	
	<!-- Custom Scripts  and CSS -->
	<script src="https://kit.fontawesome.com/35f90b3902.js"></script>
	<link href="/resources/css/common_cms.css" rel="stylesheet">
	<link href="/resources/css/layout_cms.css" rel="stylesheet">
</head>

<body>
<div class="wrapper">
	
	<!-- START : Contents -->
	<tiles:insertAttribute name="body" />
	<!-- END : Contents -->

</div>

</body>
</html>