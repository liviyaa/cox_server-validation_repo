<%@ page session="false" %><%@ page import="java.io.File,java.util.Enumeration"%><%
final File h = new File("/opt/jboss-eap-6.1/standalone/deployments/version.war/healthcheck.txt");
final File v = new File("/opt/jboss-eap-6.1/standalone/deployments/version.war/version.txt");
final File s = new File("/opt/jboss-eap-6.1/standalone/deployments/version.war/started.txt");

if ( h.exists() || !v.exists() )
{
   response.setStatus(500);
   return;
}
else
{
   response.setContentType("text/plain");
}

if ( s.exists() )
{
%>Started: <%= (new java.util.Date(s.lastModified())).toString() %><%
}
%>
Package Created: Wed Sep 28 09:51:06 EDT 2016
Packaged By:     postgres
Release Version: 5.11-CD1

<%= request.getMethod() %> <%= request.getRequestURI() %><%
   if ( request.getQueryString() != null )
   {
      %>?<%= request.getQueryString() %><%
   }
%>

<%
   for (Enumeration e = request.getHeaderNames(); e.hasMoreElements(); )
   {
      final String ename = (String) e.nextElement();
      for (Enumeration ee = request.getHeaders(ename); ee.hasMoreElements(); )
      {
         final String evalue = (String) ee.nextElement();
         %><%= ename %>: <%= evalue %>
<%
      }
   }
%>

