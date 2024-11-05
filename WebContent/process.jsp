<%@page import="util.Constants"%>
<%@page import="java.nio.file.StandardOpenOption"%>
<%@page import="java.nio.file.Files"%>
<%@page import="java.nio.file.Paths"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.BufferedWriter"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.util.Random"%>
<%@page import="pack.mail"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="pack.DbConnector"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		boolean status = false;

		try {
			String[] edits = request.getParameterValues("edit");
			String[] views = request.getParameterValues("view");
			String[] userids = request.getParameterValues("userid");

			String fileName = request.getParameter("filename");

			Connection con = DbConnector.getConnection();

			ResultSet krs = con.createStatement()
					.executeQuery("select key_ from files where name='" + fileName + "'");

			String k = "";

			while (krs.next()) {
				k = krs.getString("key_");
			}

			Statement st1 = con.createStatement();

			for (int i = 0; i < edits.length && i < views.length && i < userids.length; i++) {

				ResultSet rs = st1.executeQuery("select * from regpage where userid='" + userids[i] + "'");

				String mails = null;

				if (rs.next()) {
					System.out.println(" exception hhh ");
					int count = 0;

					ResultSet srs = con.createStatement()
							.executeQuery("select count(*) from userfiles where filename='" + fileName
									+ "' and userid='" + userids[i] + "'");

					while (srs.next()) {
						System.out.println(" exception aaa ");
						count = srs.getInt(1);
					}

					if (count == 0) {
						System.out.println(" exception bbb ");
						con.createStatement().executeUpdate("insert into userfiles values(null,'" + userids[i]
								+ "','" + fileName + "','" + k + "','" + edits[i] + "','" + views[i] + "')");
						con.createStatement()
								.executeUpdate("update files set key_='" + k + "' where name='" + fileName + "'");
						System.out.println(" exception sss ");
					} else {
						System.out.println(" exception ccc ");
						con.createStatement()
								.executeUpdate("update userfiles set filekey='" + k + "',edit='" + edits[i]
										+ "',view='" + views[i] + "' where userid='" + userids[i]
										+ "' and filename='" + fileName + "'");
						con.createStatement()
								.executeUpdate("update files set key_='" + k + "' where name='" + fileName + "'");
					}
				}
			}

			status = true;

		} catch (Exception e) {
			System.out.println(" exception one");
			e.printStackTrace();
		}

		if (status) {
			response.sendRedirect("view.jsp?mail=public key send sucess..!");
		} else {

			response.sendRedirect("view.jsp?mailf=public key send fails..!");
		}
	%>
</body>
</html>