<%@page import="sun.misc.Signal"%>
<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="valuebean.BookSingle"%>
<%@ page import="java.sql.*"%>
<%@ page import="toolbean.Connectdb"%>
<%
		String sql;
	try{
		String click = "all";
		click = request.getParameter("click");
		if(click.equals("all")){
			sql = "select * from books_table";
		}else if(click.equals("computer")){
			sql = "select * from books_table where booktype='0001'";
		}else if(click.equals("literature")){
			sql = "select * from books_table where booktype='0002'";
		}else if(click.equals("history")){
			sql = "select * from books_table where booktype='0003'";
		}else if(click.equals("philosophy")){
			sql = "select * from books_table where booktype='0004'";
		}else if(click.equals("other")){
			sql = "select * from books_table where booktype='0005'";
		}else{
			sql = "select * from books_table";
		}
	}catch(Exception e){
		sql = "select * from books_table";
	}
		Connectdb baseConnection = new Connectdb();
		ResultSet rs = baseConnection.executeQuery(sql);//ִ��SQL��䲢ȡ�ý����
%>
<% 		ArrayList <BookSingle> bookslist = new ArrayList <BookSingle> (); //�����洢��Ʒ
		while(rs.next()){
			//����һ��GoodsSingle���������װ��Ʒ��Ϣ			
			BookSingle single = new BookSingle();
			single.setBookId(rs.getString("bookId"));//��װ�鼮�����Ϣ
			//single.setTypeName(rs.getString("typeName"));
			single.setBookType(rs.getString("bookType"));//��װ�鼮������Ϣ
			single.setBookName(rs.getString("bookName")); //��װ�鼮������Ϣ
			single.setBookAuthor(rs.getString("bookAuthor"));
			single.setBookPublish(rs.getString("bookPublish"));
			single.setBookImg(rs.getString("bookImg"));
			single.setBookPrice(rs.getFloat("BookPrice")); //��װ�鼮�۸���Ϣ
			single.setBookCount(rs.getInt("bookCount")); //��װ��Ʒ�Ŀ����Ϣ
			single.setBookNum(1);  //��װ����������Ϣ
			bookslist.add(single); //������Ʒ��goodslist���϶�����
	}%>
<%
	session.setAttribute("bookslist", bookslist); //������Ʒ�б�session��
	response.sendRedirect("fenyeShow.jsp"); //��ת��show.jspҳ����ʾ��Ʒ
%>