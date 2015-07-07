<%@page import="entity.AerodrumMaster"%>
<%@page import="entity.ClassMaster"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="entity.FlightMaster"%>
<%@page import="org.hibernate.Session"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>AirLines | Check Status</title>
<meta charset="utf-8">
<link rel="stylesheet" href="css/reset.css" type="text/css" media="all">
<link rel="stylesheet" href="css/layout.css" type="text/css" media="all">
<link rel="stylesheet" href="css/style.css" type="text/css" media="all">
<script type="text/javascript" src="js/jquery-1.4.2.js" ></script>
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/cufon-replace.js"></script>
<script type="text/javascript" src="js/Myriad_Pro_italic_600.font.js"></script>
<script type="text/javascript" src="js/Myriad_Pro_italic_400.font.js"></script>
<script type="text/javascript" src="js/Myriad_Pro_400.font.js"></script>
<!--[if lt IE 9]>
<script type="text/javascript" src="js/ie6_script_other.js"></script>
<script type="text/javascript" src="js/html5.js"></script>
<![endif]-->
</head>
<body id="page4">
<!-- START PAGE SOURCE -->
<div class="body1">
  <div class="main">
    <header>
      <div class="wrapper">
        <h1><a href="index.jsp" id="logo">AirLines</a><span id="slogan">International Travel</span></h1>
        <div class="right">
          <nav>
            <ul id="top_nav">
              <li><a href="index.jsp"><img src="images/img1.gif" alt=""></a></li>
              <li><a href="#"><img src="images/img2.gif" alt=""></a></li>
              <li class="bg_none"><a href="#"><img src="images/img3.gif" alt=""></a></li>
            </ul>
          </nav>
          <nav>
            <ul id="menu">
              <li><a href="index.jsp">Home</a></li>
              <li ><a href="bookings.jsp">Bookings</a></li>
              <li id="menu_active"><a href="checkstatus.jsp">Check status</a></li>
              <li ><a href="getfare.jsp">Get fare</a></li>
			  <li><a href="contacts.jsp">contacts</a></li>
            </ul>
          </nav>
        </div>
      </div>
    </header>
  </div>
</div>
<div class="main">
  <div id="banner">
    <div class="text1"> COMFORT<span>Guaranteed</span>
     
    </div>
  </div>
</div>
<div class="main">
  <section id="content">
	<div class="book">
	<a href="#" style="float:left;"class="button1 current">CHECK FLIGHT STATUS</a>
	<a href="pnrstatus.jsp" style="float:left;"class="button1">CHECK PNR STATUS</a>
	</div>
      <%
      String fno=request.getParameter("flightno");
                        if(fno==null)
                        {
       %>
      <form action="checkstatus.jsp" method="get">
	  <div class="cancel" > <!--style="display:none;"--> 
		<div class="up">
			<span><b>ENTER FLIGHT NO:</b></span>
			<input type="text" name="flightno" class="border"/>
		</div>
		<input type="submit" value="CHECK STATUS" style="float:left;" class="button2"/>
	  </div>
      </form>
                <% }  
                        else
                        {
                            int flightno=Integer.parseInt(fno);
                            Session s = daolayer.HibernateDAOLayer.getSession();
                            Criteria c = s.createCriteria(FlightMaster.class);
                            c.add(Restrictions.eq("flightNumber", flightno));
                            List <FlightMaster> list=c.list();
                    %>
	  <div class="pnr" ><!--style="display:none;"-->
		<br>
			<span><b>FLIGHT DETAILS OF <%= flightno %> ARE:</b></span>
			<table>
				<tr>
					<td>Flight Name:</td>
                                        <td><%= list.get(0).getFlightName() %></td>
				</tr>
				<tr>
					<td>Departure City:</td>
					<td>
                                            <% 
                                                AerodrumMaster source = list.get(0).getSourceId(); 
                                                out.println(source.getAerodrumName());
                                            %>
                                        </td>
				</tr>
				<tr>
					<td>Destination City:</td>
                                        <td>
                                            <% 
                                                AerodrumMaster destination = list.get(0).getDestinationId(); 
                                                out.println(destination.getAerodrumName());
                                            %>
                                        </td>
				</tr>
				<tr>
					<td>Date:</td>
					<td></td>
				</tr>
				<tr>
					<td>Arrival Time:</td>
					<td><%= list.get(0).getArrivalTime() %></td>
				</tr>
				<tr>
					<td>Departure Time:</td>
					<td><%= list.get(0).getDepartureTime() %></td>
				</tr>
				<tr>
					<td>No. of seats available:</td>
					<td></td>
				</tr>
				<tr>
					<td colspan=2><a href="#" style="float:left;"class="button2"><< BACK</a></td>
				</tr>
			</table>
                    <% } %>
	  </div>
  </section>
</div>
<div class="body2">
  <div class="main">
    <footer>
	  <div class="footerlink">
		<p class="lf">Copyright &copy; 2015 - All Rights Reserved</p>
		<p class="rf">Designed and Developed by <a href="http://www.facebook.com/sakshimaskara07">Sakshi Maskara</a> & <a href="http://www.facebook.com/skyrohithigh">Rohit Sharma</a></p>
		<div style="clear:both;"></div>
	  </div>
	</footer>
  </div>
</div>
<script type="text/javascript"> Cufon.now(); </script>
<!-- END PAGE SOURCE -->
</body>
</html>