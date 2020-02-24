<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-1.7.2.js"></script>
<script type="text/javascript">
	$(function(){
		var index = 0;
		var picbodylength = ${list.size()}
		$(".picbody").eq(index).css("background","green");
		$.each($(".addpic"),function(i,n){
			$(n).css("left",400*i+"px");
		})
		setInterval(function(){
			$.each($(".addpic"),function(i,n){
				$(n).animate({"left":parseInt($(n).css("left"))-400+"px"},1000,function(){
					if(i==0){
						var $newImage = $(n).clone();
						$(n).remove;
						$newImage.css("left","800px")
						$("#pichead").append($newImage);
					}
				});
			})
			index++;
			if(index > picbodylength){
				index = 0;
			}
			$(".picbody").css("background","red")
			$(".picbody").eq(index).css("background","green");
		},1500);
	})
</script>
</head>
<body>
	<button>点击</button>
	<div id="pichead" style="width: 400px;height: 200px;border: 1px solid black; margin-left: 100px;position: absolute;overflow: hidden;" >
	<c:forEach items="${list }" var="pic">
 	<img class="addpic" src="${pic.path }" width="400" height="200" style="position: absolute;left: 0px;top: 0px;">
	</c:forEach>
	</div>
	<div style="position: absolute;top: 180px;left: 250px">
		<c:forEach begin="1" end="${list.size() }" var="step">
		<span class="picbody" style="background-color: red">${step }</span>
		
		</c:forEach>
	</div>
</body>
</html>