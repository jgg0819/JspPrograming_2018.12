<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="members.UserDto"%>
<%@ page import="members.UserDao"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	String userID=null;
	String userPassword=null;
	
	Connection conn1=null;
	PreparedStatement pstmt1=null;
	ResultSet rs=null;
	
	if(request.getParameter("userid")!=null)
	{
		userID=(String)request.getParameter("userid");
	}
	if(request.getParameter("passwd1")!=null)
	{
		userPassword=(String)request.getParameter("passwd1");
	}
	
	if(userID==null || userPassword==null)
	{
		PrintWriter script=response.getWriter();
		script.println("<script>");
		script.println("alert('아이디 비밀번호를 확인해주세요.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return ;
	}
	
	UserDao userDAO=new UserDao();
	boolean check=userDAO.loginCheck(userID,userPassword);
	if(check==true)
	{
		rs=userDAO.rs;
		String username=rs.getString("usernm");
		session.setAttribute("G_MEMID",userID);
		session.setAttribute("G_MEMNM", username);	
		PrintWriter script=response.getWriter();
		script.println("<script>");
		script.println("alert('로그인 성공');");
		script.println("location.href='index.html';");
		script.println("</script>");
		script.close();
		return ;
	}else
	{
		PrintWriter script=response.getWriter();
		script.println("<script>");
		script.println("alert('등록된 사용자가 없습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
	}
%>
	