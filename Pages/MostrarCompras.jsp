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

	
	String nombre= ""; 
	String apellido= "";
	String mail= ""; 
	int cantidad=0;
	int id_categoria=0;
	String categoria="";
	
	/* switch(id_categoria){
	
	case 1: 
		categoria="Estudiante";
		break;
	case 2: 
		categoria="Trainee";
		break;
	case 3:	
		categoria="Junior";
		break;
		
	default: 
		categoria="Sin categoria";
		break;
	
	} */
	

	DBConnection conexion=new DBConnection();
	Connection cn=conexion.conectar();
	PreparedStatement ps= cn.prepareStatement("Select * from tickets");
	ResultSet rs=ps.executeQuery(); 
	
	
%>


<table>

	<thead>
		<tr>
		
		<td>Id</td>
		<td>Nombre</td>
		<td>Apellido</td>
		<td>Email</td>
		<td>Cantidad</td>
		<td>Categoria</td>
			
		</tr>
		
		</thead>
	
	<tbody>
	
	<%
	
	int id_ticket=0;
	
	 while(rs.next()){
         id_ticket=rs.getInt(1);
         nombre=rs.getString(2);
         apellido=rs.getString(3);
         mail= rs.getString(4);
         cantidad=rs.getInt(5);
     	 categoria=rs.getString(6);
     	
     	
     	

         out.print("<tr>");
         out.print("<td>"+id_ticket+"</td>"); 
         out.print("<td>"+nombre+"</td>");
         out.print("<td>"+apellido+"</td>");
         out.print("<td>"+mail+"</td>"); 
         out.print("<td>"+cantidad+"</td>");
         out.print("<td>"+categoria+"</td>"); 
         out.print("</tr>");
       
     }
	 
	 try {
	        
	        if(cn!=null){
	            cn.close();
	        }
	    }catch (SQLException throwables) {
	            throwables.printStackTrace();
	        }
	
	%>		
	</tbody>


</table>

</body>
</html>