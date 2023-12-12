<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import= "jsp.connection.DBConnection" %> 
 <%@ page import="java.sql.*" %>>  
<!DOCTYPE html>
<html>
<head>

  <title>Login</title>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Bootstrap CSS v5.2.1 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">

    <link rel="stylesheet" href="../CSS/style.css">
    <link rel="stylesheet" href="../CSS/style2.css">
    <link rel="shortcut icon" href="../Assets/Images/codoacodo.png" type="image/x-icon">

</head>
<body>

<%

	String usuario= request.getParameter("usuario"); 
	String contraseña= request.getParameter("contraseña");
	
	String query=null;
	
	boolean exito=false;
	
	//String query= "INSERT INTO tickets (nombre,apellido,mail,cantidad,categoria) VALUES ('"+nombre+"', '"+apellido+"','"+mail+"',"+cantidad+",'"+categoria+"')";

	
	DBConnection conexion=new DBConnection();
	Connection cn=conexion.conectar();
	Statement stm=null;
	ResultSet rs=null;
	
	try{
		stm=cn.createStatement();
		//stm.executeUpdate(query);
		rs=stm.executeQuery("Select nombre, contraseña from usuarios");
		
		while(rs.next()){
			if(usuario.equals(rs.getString(1)) && contraseña.equals(rs.getString(2))){
				
				exito=true;
				
			}else{
				exito=false;
			}
			System.out.println(usuario+"="+rs.getString(1));
			System.out.println(contraseña+"="+rs.getString(2));
		}
		
		
		
	}catch(Exception e){
		e.printStackTrace();
	}
	System.out.println(exito);	
	if(exito){

		%>
		<jsp:include page="tickets.html"></jsp:include> 
		<% 
	}else{
		%>
		<jsp:include page="../index.html"></jsp:include>
		<%--<%@include file="../index.html" %> --%>
		<% 
	}
	
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

</body>
</html>