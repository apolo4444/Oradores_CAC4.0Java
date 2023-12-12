<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import= "jsp.connection.DBConnection" %> 
 <%@ page import="java.sql.*" %>>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%

	String nombre= request.getParameter("nombre"); 
	String mail= request.getParameter("email"); 
	String charla=request.getParameter("charla");
	
	String query= "INSERT INTO orador (nombre,mail,tema) VALUES ('"+nombre+"', '"+mail+"','"+charla+"')";

	out.print(nombre+mail+charla);
	
	DBConnection conexion=new DBConnection();
	Connection cn=conexion.conectar();
	Statement stm=null;
	
	try{
		stm=cn.createStatement();
		stm.executeUpdate(query);
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	out.print("Se cargaron los datos");
	
	try {
        
        if(stm!=null){
            stm.close();
        }
        if(cn!=null){
            cn.close();
        }
    }catch (SQLException throwables) {
            throwables.printStackTrace();
        }

	

%>

<jsp:include page="tickets.html"></jsp:include>

</body>
</html>