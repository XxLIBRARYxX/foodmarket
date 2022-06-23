<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="../layout/navbar.jsp" />
<c:set value="${pageContext.request.contextPath}" var="contextRoot"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改資料</title>
<style>
fieldset {
	width: 800px;
	height: 750px;
	margin: auto;
	margin-top: 10px;
	text-align: center;
	border: 3px solid black;
	background-color: lightblue;
	border-radius: 20px
}

h2 {
	text-align: center;
}

form {
	margin: auto;
	text-align: left;
	width: 600px;
}

.submit {
	text-align: center;
}

.picture {
	width: 450px;
}

textarea {
	resize: none;
}
</style>
</head>
<body>
	<fieldset>
		<h2>修改資料</h2>
		<form:form method="post" action="${contextRoot}/shopad/update"
			enctype='multipart/form-data' modelAttribute="editAd">

			<div class="div2">
				<label for="picture" class="FormTitle">圖片 : </label> <br><img
					id="output" src="data:image/*;base64, ${ad.picture}"
					class="picture" name="picture" />
			</div>

			<div class="div1">
				活動編號: <input type="text" readonly name="shopAdId" required
					value="${ad.shopAdId}">
			</div>

			<div class="div1">
				<label for="shopAdName" class="FormTitle">活動名稱 : </label> <input
					type="text" id="shopAdName" name="shopAdName" autocomplete="off"
					required value="${ad.shopAdName}" />
			</div>


			<!--  <div class="div1">

				<input type="file" onchange="loadFile(event)" accept="image/*"
					name="picture" required value="${ad.picture}"/>
			</div>-->

			<div class="div1">
				<label for="beginDate" class="FormTitle">活動開始日期 : </label> <input
					type="date" id="date" name="beginDate" max="2022-06-10" required
					value="${ad.beginDate}" />
			</div>

			<div class="div1">
				<label for="endDate" class="FormTitle">活動結束日期 : </label> <input
					type="date" id="date" name="endDate" max="2022-06-10" required
					value="${ad.endDate}" />
			</div>

			<div class="div1">
				<label for="remark" class="FormTitle">備註 :</label>
				<textarea id="remark" name="remark" rows="4" cols="50"
					onKeyDown="checkMaxInput(this.form)"
					onKeyUp="checkMaxInput(this.form)" required> ${ad.remark}
				</textarea><br>
				<label for="remark" class="FormTitle">剩餘 : </label>
				<input readonly type=text name=remLen size=3 maxlength=3 value="">字
			</div>

			<div class="div1">
				<label for="productId" class="FormTitle">商品編號 : </label> <input
					id="productId" name="productId" autocomplete="off" required
					value="${ad.productId}" />
			</div>

			<div class="submit">
				<input type="submit" id="submit" class="btn btn-outline-info"
					value="確定" /> <input class="btn btn-outline-danger" type="button"
					name="back" value="返回" onClick="javascript:history.back()">
			</div>
		</form:form>
	</fieldset>
	<script>
		var loadFile = function(event) {
			var reader = new FileReader();
			reader.onload = function() {
				var output = document.getElementById('output');
				output.src = reader.result;
			};
			reader.readAsDataURL(event.target.files[0]);
		};
		
		maxLen = 50; // 字數頂限

		function checkMaxInput(form) {
		if (form.remark.value.length > maxLen) // if too long.... trim it!
		form.remark.value = form.remark.value.substring(0, maxLen);
		// otherwise, update 'characters left' counter
		else form.remLen.value = maxLen - form.remark.value.length;
		}
		//  
		</script>
</body>
</html>