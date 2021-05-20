<%@ page contentType="text/html; charset=Shift_JIS" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%-- <%@ taglib uri="/WEB-INF/tld/c.tld" prefix="c" %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>���N�̌��ʊ���</title>
<style>
body {
	margin-left: 500px;
	margin-top: 70px;
	background: #EEE8AA;
}

<%--���ʃ{�^��-- %>
 <%--�܂��͂����܂�̃{�b�N�X�T�C�Y�Z�o��borer-box�� --%>
  *, *:before, *:after {
	-webkit-box-sizing: inherit;
	box-sizing: inherit;
}

html {
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	font-size: 62.5%; /*rem�Z�o�����₷�����邽�߂�*/
}

h2 {
	font-size: 25px;
	margin-top: -10px;
	margin-left: 150px;
}

<%--�{�^��--%>
.button, .btn, a.btn, button.btn {
	font-size: 1.6rem;
	font-weight: 700;
	line-height: 1.5;
	position: relative;
	display: inline-block;
	padding: 1rem 4rem;
	cursor: pointer;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	-webkit-transition: all 0.3s;
	transition: all 0.3s;
	text-align: center;
	vertical-align: middle;
	text-decoration: none;
	letter-spacing: 0.1em;
	color: #000000;
	border-radius: 0.5rem;
	border: 0px none;
	font-family: arial narrow;
}

<%--�{�^���f�U�C��--%>
button.btn--green.btn--emboss {
	color: #000000;
	text-shadow: -1px -1px 1px 55d8ff;
	border-bottom: 5px solid #C0C0C0;
	background: #FFFFFF;
}
button.btn--green.btn--cubic:hover {
	margin-top: 3px;
	border-bottom: 2px solid #C0C0C0;
}

.button {
	margin-top: 30px;
	margin-left: 150px;
}

<%--�e�[�u���T�C�Y--%>
table{
	font-family: arial narrow;
	font-size: 5px;
	width: 1050px;
	margin-top: 10px;
	margin-left: -280px;
	border-collapse: collapse;
	border-spacing: 0;
}

<%--�e�[�u���f�U�C��--%>
.tableDesign{
	table-layout: auto;
	font-size: 20px;
}
thead, tbody {
    display: block;
}
tbody{
    height: 200px;
}
.fixed01{
width: 300px;
}

<%--�w�b�_�[ --%>
.tableDesign thead th {
	background:#C4A3BF;
	font-weight: bold;
	text-align: center;
}

<%--�{�f�B���ځE�t�b�^�[���� --%>
.tableDesign tbody th,
.tableDesign tfoot th {
	background:#FEEEED;
}
<%--�{�f�B�f�[�^�E�t�b�^�[�f�[�^ --%>
.tableDesign tbody td,
.tableDesign tfoot td {
	text-align:center;
}

/* �����s �P�s���Ƃ̐F�ς����s�v�Ȃ�폜 */
.tableDesign tr:nth-child(2n) td {
    background: #C0C0C0;
}
/* �����s�̍��� �P�s���Ƃ̐F�ς����s�v�Ȃ�폜 */
.tableDesign tr{
    background: #FBFBF6;
}

.title{
	font-size: 20px;
}
</style>
</head>

<body>
	<h2>�e�^���̊���</h2>

	<div class=title>
		���ߋ����N�̑S�̂̂��݂����^�����ʂ̊��� <br>
	<table class=tableDesign>
		<thead>
			<tr>
			<%-- <bean:parameter id ="hPercent" name ="resultsPercentList"/> --%>
			 <c:forEach var="hPercent" items="${resultsPercentList}">
				<th class="fixed01">
				<bean:write name="resultsPercentList" property="hPercent" scope="request" />
				<c:out value="${hPercent.hUnseimei}" />
				</th>
				</c:forEach>
			</tr>
		</thead>
		<tbody>

				<tr>
				<c:forEach var="hPercent" items="${resultsPercentList}">
					<td class="fixed01">
					<c:out value="${hPercent.hWariai}" />
					</td>
					</c:forEach>
				</tr>
		</tbody>
		</table>
</div>

		<div class=title>
			���{���̒a�����̂��݂����^�����ʂ̊���<br>
		<table class=tableDesign>
			<thead>
				<tr>
				<c:forEach var="percent" items="${resultsTodayList}">
					<th class="fixed01">
					<c:out value="${percent.unseimei}" />
					</th>
					</c:forEach>
				</tr>
			</thead>
			<tbody>
					<tr>
					<c:forEach var="percent" items="${resultsTodayList}">
						<td class="fixed01">
						<c:out value="${percent.wariai}" />
						</td>
					</c:forEach>
					</tr>

				</tbody>
				</table>
</div>
				<div class="button">
					<button class="btn btn--green btn--emboss btn--cubic" type=button
						onclick="history .back()">RETURN</button>
				</div>
</body>
</html>
