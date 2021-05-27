<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>500 Error Page</title>
</head>
<body style="height:100%; text-align:center;">
	<img src="${root }/resources/images/common/error500.png" style="margin-top:5%;" usemap="#rootBtn" />
	<map name="rootBtn" id="rootBtn">
		<area shape="rect" coords="314, 473, 509, 512" href="${root }" target="_self">
	</map>
</body>
</html>