<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="valuebean.BookSingle"%>
<%@ page import="toolbean.MyTools"%>
<%@ page import="toolbean.Connectdb"%>
<%@ page import="javax.swing.JOptionPane"%>
<%@ page import="java.util.*,com.jspsmart.upload.*" errorPage="" %>
<%
	Connectdb dobooks = new Connectdb();
	String action = request.getParameter("action");
	if (action == null)
		action = "";
	if (action.equals("delete")) { //ɾ����Ʒ
		ArrayList bookslist = (ArrayList) session
				.getAttribute("bookslist");
		int myid = MyTools.strToint(request.getParameter("id"));
		BookSingle single = (BookSingle) bookslist.get(myid);
		String bookId = single.getBookId();
		String sql = "delete from books_table where bookId='" + bookId + "'";
		dobooks.executeUpdate(sql);
		response.sendRedirect("getbooks.jsp");
	} else if (action.equals("update")) { //������Ʒ��Ϣ
		String bookId = request.getParameter("bookId");
		String bookType = request.getParameter("bookType");
		String bookName = MyTools.toChinese(request.getParameter("bookName"));
		String bookAuthor = MyTools.toChinese(request.getParameter("bookAuthor"));
		String bookPublish = MyTools.toChinese(request.getParameter("bookPublish"));
		float bookPrice = Float.parseFloat(request.getParameter("bookPrice"));
		int bookCount = Integer.parseInt(request.getParameter("bookCount"));
		String sql = "update books_table set bookId='" + bookId + "',bookType='" + bookType 
				+ "',bookName='" + bookName + "',bookAuthor='" + bookAuthor 
				+ "',bookPublish='" + bookPublish +"',bookPrice=" + bookPrice + ",bookCount=" + bookCount
				+ " where bookId='" + bookId + "'";
		dobooks.executeUpdate(sql);
		response.sendRedirect("getbooks.jsp");
	} else if (action.equals("add")) { //������Ʒ
		// �½�һ��SmartUpload����
		SmartUpload su = new SmartUpload();
		// �ϴ���ʼ��
		su.initialize(pageContext);
		// �趨�ϴ�����
		// 1.����ÿ���ϴ��ļ�����󳤶ȡ�
		su.setMaxFileSize(10000000);
		// 2.�������ϴ����ݵĳ��ȡ�
		su.setTotalMaxFileSize(20000000);	
		// �ϴ��ļ�
		su.upload();
		// ���ϴ��ļ�ȫ�����浽ָ��Ŀ¼
		//int count = su.save("//booksImg");
		int count = su.save("d:"+"\\"+"booksImg");
		com.jspsmart.upload.File file = su.getFiles().getFile(0);
		
		ArrayList bookslist = (ArrayList) session
				.getAttribute("bookslist");
		String bookId = su.getRequest().getParameter("bookId");
		String bookType = su.getRequest().getParameter("bookType");
		String bookName = su.getRequest().getParameter("bookName");
		String bookAuthor = su.getRequest().getParameter("bookAuthor");
		String bookPublish = su.getRequest().getParameter("bookPublish");
		String bookImg = file.getFileName();
		float bookPrice = Float.parseFloat(su.getRequest().getParameter("bookPrice"));
		int bookCount = Integer.parseInt(su.getRequest().getParameter("bookCount"));
		for (int i = 0; i < bookslist.size(); i++) {
			BookSingle single = (BookSingle) bookslist.get(i);
			if (bookId.equals(single.getBookId())) {
%>
			<script type="text/javascript">
				alert("��������鼮�����Ѵ��ڣ�");
				window.location.href="addbooks.jsp";
			</script>
<%
				return;
			}
		}
		String sql = "insert into books_table values('" + bookId + "','" + bookName + "','" + bookType + "','" 
		+ bookAuthor + "','" + bookPublish + "','" + bookImg + "'," + bookPrice + "," + bookCount + ")";
		dobooks.executeUpdate(sql);
		response.sendRedirect("addbooks.jsp");
	} else {
		response.sendRedirect("booksinfo.jsp");
	}
%>