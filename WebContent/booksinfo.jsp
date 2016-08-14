<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="valuebean.BookSingle"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
	ArrayList bookslist = (ArrayList) session.getAttribute("bookslist");
%>
<style type="text/css">
a {
	text-decoration: none;
}
.title{
	font-size:20px;
	font-weight:bold;
}
.addbook,.salesinfo{
	display:inline-block;
	width:70px;
	height:35px;
	text-align:center;
	line-height:35px;
	border-radius:5px;
	background-color:#B2B7BC;
}
.bookImg{
	height:50px;
	width:auto;
}
</style>
<table border="1" width="900" rules="none" cellspacing="0"
	cellpadding="0">
	<tr height="50">
		<td colspan="9" align="center" class="title">����鼮��Ϣ����</td>
	</tr>
	<tr align="center" height="30" bgcolor="lightgrey">
		<td>����</td>
		<td>����</td>
		<td>����</td>
		<td>����</td>
		<td>������</td>
		<td>ͼƬ</td>
		<td>���ۣ�Ԫ/����</td>
		<td>���</td>
		<td>����</td>
	</tr>
	<%
		int cpage = 1; //��ǰҳ
		int startline = 1; //ÿҳ�ĵ�һ��
		int pagesize = 6; //ÿҳ��ʾ������
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
	<tr height="100">
		<td colspan="9" align="center">û���鼮��Ϣ����ʾ��</td>
	</tr>
	<%
		} else {
			int dpagesize = 0;
			if (cpage < pagecount) {
				dpagesize = startline + pagesize - 1;
			} else if (cpage == pagecount) {
				dpagesize = count - 1;
			}
			for (int i = startline; i <= dpagesize; i++) {
				BookSingle single = (BookSingle) bookslist.get(i);
	%>
	<tr height="60" align="center">
		<td><a href="updatebooks.jsp?id=<%=i %>"><%=single.getBookId()%></a></td>
		<td><%=single.getTypeName()%></td>
		<td><%=single.getBookName()%></td>
		<td><%=single.getBookAuthor()%></td>
		<td><%=single.getBookPublish()%></td>
		<td><img src="d:\\booksImg\<%=single.getBookImg()%>" class="bookImg"></img></td>
		<td><%=single.getBookPrice()%></td>
		<td><%=single.getBookCount()%></td>
		<td><a href="dobooks.jsp?action=delete&id=<%=i%>">ɾ��</a></td>
	</tr>
	<%
		}
	%>
	<tr height="50" align="center">
		<td>��<%=cpage%>ҳ
		</td>
		<td>��<%=pagecount%>ҳ
		</td>
		<td><a href="booksinfo.jsp?cpage=<%=cpage - 1%>">��һҳ</a></td>
		<td><a href="booksinfo.jsp?cpage=<%=cpage + 1%>">��һҳ</a></td>
		<td colspan="5">
			<form action="booksinfo.jsp" method="post">
				ת����<input type="text" name="cpage" size="3" maxlength="3"/>ҳ <input
					type="submit" value="ȷ��"/>
			</form>
		</td>
	</tr>
	<%
		}
	%>
	<tr height="50">
		<td align="center" colspan="9">
			<a class="addbook" href="addbooks.jsp">���ͼ��</a>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<a class="salesinfo" href="salesinfo.jsp">������Ϣ</a>
		</td>
	</tr>
</table>
<%
	session.setAttribute("bookslist", bookslist);
%>