<%@page import="sun.misc.Signal"%>
<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="valuebean.BookSingle"%>
<%@ page import="java.sql.*"%>
<%@ page import="toolbean.Connectdb"%>
<%
		//String sql = "select * from books_table";
		String sql = "select books_table.bookId,type_table.typeName,books_table.bookName,"+
				"books_table.bookAuthor,books_table.bookPublish,books_table.bookImg,books_table.bookPrice,books_table.bookCount "+
				"from books_table,type_table where books_table.bookType=type_table.bookType";
		Connectdb baseConnection = new Connectdb();
		ResultSet rs = baseConnection.executeQuery(sql);//ִ��SQL��䲢ȡ�ý����
	%>
<% ArrayList <BookSingle> bookslist = new ArrayList <BookSingle> (); //�����洢��Ʒ
		while(rs.next()){
			//����һ��GoodsSingle���������װ��Ʒ��Ϣ			
			BookSingle single = new BookSingle();
			single.setBookId(rs.getString("bookId"));//��װ�鼮�����Ϣ
			single.setTypeName(rs.getString("typeName"));
			//single.setBookType(rs.getString("bookType"));//��װ�鼮������Ϣ
			single.setBookName(rs.getString("bookName")); //��װ�鼮������Ϣ
			single.setBookAuthor(rs.getString("bookAuthor"));
			single.setBookPublish(rs.getString("bookPublish"));
			single.setBookImg(rs.getString("bookImg"));
			single.setBookPrice(rs.getFloat("BookPrice")); //��װ�鼮�۸���Ϣ
			single.setBookCount(rs.getInt("bookCount")); //��װ��Ʒ�Ŀ����Ϣ
			bookslist.add(single); //������Ʒ��goodslist���϶�����
	}%>
<%
	session.setAttribute("bookslist", bookslist); //������Ʒ�б�session��
	response.sendRedirect("booksinfo.jsp"); //��ת��booksinfo.jspҳ����ʾ��Ʒ
%>