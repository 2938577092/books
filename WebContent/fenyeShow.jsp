<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="valuebean.BookSingle"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>ͼ����Ϣ</title>
<link rel="stylesheet" type="text/css" href="css/fenyeShow.css"/>
</head>
<body>
<%
	ArrayList bookslist = (ArrayList) session.getAttribute("bookslist");
%>
	<div class="header">
		<h2 class="title">��ӭ����ͼ��</h2>
		<div class="option">
			<span>ͼ�����</span>
			<a class="all" href="index.jsp?click=all">ȫ��</a>
			<a class="computer" href="index.jsp?click=computer">�������</a>
			<a class="literature" href="index.jsp?click=literature">��ѧ��</a>
			<a class="history" href="index.jsp?click=history">��ʷ��</a>
			<a class="philosophy" href="index.jsp?click=philosophy">��ѧ��</a>
			<a class="other" href="index.jsp?click=other">����</a>
			<a class="shopcar" href="shopcar.jsp">�鿴���ﳵ</a>
		</div>
	</div>
	<div class="main">
	<%
		int cpage = 1; //��ǰҳ
		int startline = 1; //ÿҳ�ĵ�һ��
		int pagesize = 15; //ÿҳ��ʾ������
		int count = bookslist.size(); //�ܹ��ж���������
		int pagecount = (count + pagesize - 1) / pagesize; //�ܹ�����ҳ
	%>
	<%
		String strcpage = request.getParameter("cpage");
		if (strcpage == null || strcpage == "") {
			cpage = 1;
		} else {
			cpage = Integer.parseInt(strcpage);
			if (cpage < 1)
				cpage = 1;
			if (cpage > pagecount)
				cpage = pagecount;
		}
		startline = (cpage - 1) * pagesize;
	%>
	<%
		if (bookslist == null || bookslist.size() == 0) {
	%>
		<h3 class="null">û����Ʒ����ʾ��</h3>
	<%
		} else {
			int dpagesize = 0;
			if (cpage < pagecount) {
				dpagesize = startline + pagesize - 1;
			} else if (cpage == pagecount) {
				dpagesize = count - 1;
			}
	%>
		<div class="content">
	<%
			for (int i = startline; i <= dpagesize; i++) {
				BookSingle single = (BookSingle) bookslist.get(i);
	%>
	<div class="book">
		<a href="detail.jsp?cpage=cpage&id=<%=i%>"><img src="d:\\booksImg\<%=single.getBookImg() %>" alt="�鼮ͼƬ" /></a>
		<span class="bookName">��<%=single.getBookName() %>��</span>
		<span class="bookAuthor">���ߣ�<%=single.getBookAuthor() %></span>
		<span class="bookPublish">�����磺<%=single.getBookPublish() %></span>
		<em class="bookPrice">�۸񣺣�<%=single.getBookPrice() %></em>
		<em class="bookCount">��棺<%=single.getBookCount() %></em>
		<a href="docar.jsp?action=buy&id=<%=i%>&num=1" class="dogood">����</a>
	</div>
	<%
		}
	%>
	</div>
	<table class="mytable">
	<tr height="50" align="center">
		<td width="60">��<%=cpage%>ҳ
		</td>
		<td width="60">��<%=pagecount%>ҳ
		</td>
		<td width="60"><a href="fenyeShow.jsp?cpage=<%=cpage - 1%>">��һҳ</a></td>
		<td width="60"><a href="fenyeShow.jsp?cpage=<%=cpage + 1%>">��һҳ</a></td>
		<td align="center" width="180">
			<form action="fenyeShow.jsp" method="post">
				ת����<input type="text" name="cpage" size=3 maxlength="3"/>ҳ <input
					type="submit" value="ȷ��"/>
			</form>
		</td>
	</tr>
	</table>
	<%
		}
	%>
		<div class="management">
			<a href="login.jsp">��̨��¼</a>
		</div>
	</div>
</body>
</html>
