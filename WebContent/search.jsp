<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="pack.DbConnector"%>

<!DOCTYPE HTML>
<html>

<head>
<title></title>
<meta name="description" content="website description" />
<meta name="keywords" content="website keywords, website keywords" />
<meta http-equiv="content-type"
	content="text/html; charset=windows-1252" />
<link rel="stylesheet" type="text/css"
	href="http://fonts.googleapis.com/css?family=Tangerine&amp;v1" />
<link rel="stylesheet" type="text/css"
	href="http://fonts.googleapis.com/css?family=Yanone+Kaffeesatz" />
<link rel="stylesheet" type="text/css" href="style/style.css" />
</head>

<body>
	<div id="main">
		<div id="header">
			<div id="logo">
		
				<div class="slogan">A Practical Attribute-Based Document Collection Hierarchical Encryption Scheme in Cloud Computing</div>
			</div>
			<div id="menubar">
				<ul id="menu">
					<!-- put class="current" in the li tag for the selected page - to highlight which page you're on -->

					<li class="current"><a href="userpage.jsp">Home</a></li>
					<li><a href="logout.jsp">Logout</a></li>

				</ul>
			</div>
		</div>
		<div id="site_content">
			<div id="content">
				<!-- insert the page content here -->

				<%
					String my = session.getAttribute("me").toString();
				%>
				<h1>
					Welcome to
					<%=my%></h1>

				<table class="imagetable">
					<tr>
						<th>File Name</th>
						<th>Get File Key</th>
						<th>File Owner</th>

					</tr>
					<%
						String f = null;
						String k = null;
						String owner = null;

						String txt = request.getParameter("search");

						txt = "%" + txt + "%";

						Connection conn = DbConnector.getConnection();
						Statement st = conn.createStatement();

						ResultSet rst = st
								.executeQuery("select * from files where name like '" + txt
										+ "' or title like '" + txt + "' or keyword like '"
										+ txt + "' or cat like'" + txt
										+ "' order by rank_ desc");
						
						while (rst.next()) {
							f = rst.getString("name");
							k = rst.getString("key_");
							owner = rst.getString("userid");

							String name = null;

							ResultSet myrs = conn.createStatement()
									.executeQuery(
											"select name from regpage where userid='"
													+ owner + "'");

							while (myrs.next()) {
								name = myrs.getString("name");
							}
					%>
					<tr>
						<td><%=f%></td>
						<td><a href="userfileview.jsp?key=<%=k%>&owner=<%=owner%>">Click</a></td>
						<td><%=name%></td>

					</tr>

					<%
						}
					%>

				</table>

			</div>
		</div>
		<div id="footer">
			<p>
				<p>batch 09<br/> Mahatma Gandhi University, nalgonda</p>
			</p>
		</div>
	</div>
</body>
</html>
