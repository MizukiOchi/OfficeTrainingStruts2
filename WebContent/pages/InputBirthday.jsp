<%--(1)page�f�B���N�e�B�u���g�p���AJSP�t�@�C���̑������w��--%>
<%@ page contentType="text/html; charset=Shift_JIS" %>
<%--(2)taglib�f�B���N�e�B�u���g�p���AJSP�t�@�C���Ŏg�p����^�O���C�u�������w�肷��B
�����ł́AStruts�ł��炩���ߗp�ӂ���Ă���Struts�^�O���C�u�����̂����Astruts-html.tld�̎g�p���w�肷��B
prefix�����ɂ��Astruts-html.tld���g�p����ꍇ�́A�^�O��html���w�肷��B--%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>

<html>
<head>
<meta charset="UTF-8">
<title>���݂���</title>
</head>
<body>

<div class="InputBirthday">
<p class="explain">Input Your Birthday Here��</p>

<%--�G���[���b�Z�[�W�̏��� --%>
<html:errors/>  <%-- (3)<html:error/>�^�O�̓G���[����������Ă���ꍇ�́A�G���[���b�Z�[�W��\�����A�G���[����������Ă��Ȃ��ꍇ�́A�����\���������^�O�B--%>
<html:form action="/fortuneResults" focus="birthday"> <%-- (4) <html:form>�^�O��HTML��<form>�^�O�Ƃقړ��l�̐U����������^�O�Baction������submit�{�^���������ꂽ���̑J�ڐ���w��Bfocus�����͂���JSP�t�@�C�����J���ꂽ���ɂǂ̃t�H�[�����ڂ����߂ɑI���\�ɂ��邩���w�肷��B--%>
	<html:text property="birthday" size="8" /> <%-- (5) <html:text>�^�O��HTML��<input type=text>�^�O�Ƃقړ��l�̐U����������^�O�Bproperty������HTML��name�����Asize������HTML��size�����Ɠ��l�̓���������B--%>
	<html:submit property="submit" value="���M"/>
</html:form>
</body>
</html>