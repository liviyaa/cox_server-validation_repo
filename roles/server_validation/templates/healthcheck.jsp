<%@ page session="false" %><%@ page import="java.io.File,java.util.Enumeration"%><%
final File h = new File("{{ version_war_copy_result.dest }}version.war/healthcheck.txt");
final File v = new File("{{ version_war_copy_result.dest }}version.war/version.txt");
final File s = new File("{{ version_war_copy_result.dest }}version.war/started.txt");

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
Package Created: {{ created_dt }}
Packaged By:     {{ created_by }}
Release Version: {{ project_version }}
Hostname: {{ ansible_hostname }}

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

