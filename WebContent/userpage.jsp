<!DOCTYPE HTML>
<html>

<head>
<title>A Practical Attribute-Based Document Collection Hierarchical Encryption Scheme</title>
<meta name="description" content="website description" />
<meta name="keywords" content="website keywords, website keywords" />
<meta http-equiv="content-type"
	content="text/html; charset=windows-1252" />
<link rel="stylesheet" type="text/css" href="style/style.css" />
</head>

<body>
	<div id="main">
		<div id="header">
			<div id="logo">
				<div id="logo_text">
					<br /> <br /> <font size="5"><a href="index.html"><span
							class="logo_colour">A Practical Attribute-Based Document Collection Hierarchical Encryption Scheme in Cloud Computing
								</span></a></font>
				</div>
			</div>
			<div id="menubar">
				<ul id="menu">
					
					<li class="selected"><a href="userpage.jsp">Home</a></li>
					<li><a href="logout.jsp">Logout</a></li>
					
				</ul>
			</div>
		</div>
		<div id="content_header"></div>
		<div id="site_content">
			<div id="sidebar_container">
				<br /> <br /> <br /> <br />
				<div class="sidebar">
					<div class="sidebar_top"></div>
					<div class="sidebar_item">
						<h3>Useful Links</h3>
						<ul>
							<li><a href="userpage.jsp">Home</a></li>
							<li><a href="logout.jsp">Logout</a></li>
						</ul>
					</div>
					<div class="sidebar_base"></div>
				</div>
			</div>
			<div id="content">
				<div class="form_settings">
					
					<%
						String my = session.getAttribute("me").toString();

						if (request.getParameter("dwn") != null) {
					%>
					<h3>Success fully download</h3>
					<%
						} else {
					%>
					<h3>
						<center>Welcome to
						<%=my%></center></h3>
					<%
						}
					%>
					
					<br/>
					<form action="search.jsp" name="ff" method="get"
						onsubmit="return check()">
						<p>
							<span>Enter Search key:</span><input class="contact" type="text"
								name="search" />
						</p>

						<p style="padding-top: 15px">
							<span>&nbsp;</span><input class="submit" type="submit"
								name="contact_submitted" value="submit" />
						</p>
					</form>
				</div>
			</div>
		</div>
		<br/><br/><br/><br/><br/>
		<div id="content_footer"></div>
		<div id="footer">
			<p>batch 09 <br/> Mahatma Gandhi University, nalgonda</p>
		</div>
	</div>
</body>
</html>
