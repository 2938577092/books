<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="valuebean.BookSingle"%>
<!-- ͨ��������ʶ����ȡShopCar��ʵ�� -->
<jsp:useBean id="myCar" class="toolbean.ShopCar" scope="session" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>ͼ����Ϣ</title>
<link rel="stylesheet" type="text/css" href="css/shopcar.css"/>
</head>
<body>
<%
	ArrayList buylist = myCar.getBuylist(); //��ȡʵ���������洢�������Ʒ�ļ���
	float total = 0; //�����洢Ӧ�����
%>
	<div class="header">
		<h2 class="title">���ﳵ</h2>
		<span class="info">ͼ����Ϣ</span>
		<span class="price">�۸�</span>
		<span class="count">����</span>
	</div>
	<div class="main">
	<%
		if (buylist == null || buylist.size() == 0) {
	%>
	<h3 class="null">���Ĺ��ﳵΪ�գ�</h3>
	<%
		} else {
			for (int i = 0; i < buylist.size(); i++) {
				BookSingle single = (BookSingle) buylist.get(i);
				String bookId = single.getBookId(); //��ȡ��Ʒ�ı��
				String bookName = single.getBookName(); //��ȡ��Ʒ����
				String bookAuthor = single.getBookAuthor();
				String bookPublish = single.getBookPublish();
				String bookImg = single.getBookImg();
				float bookPrice = single.getBookPrice(); //��ȡ��Ʒ�۸�
				int bookNum = single.getBookNum(); //��ȡ��������				
				float money = ((int) ((bookPrice * bookNum + 0.05f) * 10)) / 10f; //���㵱ǰ��Ʒ�ܼۣ���������������
				total += money; //����Ӧ�����
	%>
	<div class="book">
		<img src="d:\\booksImg\<%=bookImg%>" alt="<%=bookImg%>"/>
		<div class="bookinfo">
			<p>
				<span class="bookName">��<%=bookName %>��</span>
				<span class="price">��<%=bookPrice*bookNum %></span>
				<span class="num"><%=bookNum %></span>
			</p>
			<p><span class="bookAuthor">���ߣ�&nbsp;<%=bookAuthor %></span></p>
			<p><span class="bookPublish">�����磺<%=bookPublish %></span></p>
			<p>
				<span class="bookPrice">���ۣ�&nbsp;<%=bookPrice %></span>
				<a class="delete" href="docar.jsp?action=remove&bookId=<%=single.getBookId()%>">�Ƴ�</a>
			</p>
		</div>
	</div>
	<%
		}
		}
	%>
	<div class="footer">
		<p class="footer-1">
			<span class="money">Ӧ������<%=total %></span>
			<a class="pay" href="docar.jsp?action=pay">����</a>
		</p>
		<p class="footer-2">
			<a class="clear" href="docar.jsp?action=clear">��չ��ﳵ</a>
			<a class="shop" href="fenyeShow.jsp">��������</a>
		</p>
	</div>
<% session.setAttribute("buylist", buylist);%>
	</div>
</body>
</html>