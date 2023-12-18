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
	String apellido= request.getParameter("apellido");
	String mail= request.getParameter("mail"); 
	int cantidad=Integer.parseInt(request.getParameter("cantidad"));
	int id_categoria=Integer.parseInt(request.getParameter("categoria"));
	String categoria=null;
	
	 switch(id_categoria){
	
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
	
	} 
	
	
	
	
	String query=""; 
	
	//String query= "INSERT INTO tickets (nombre,apellido,mail,cantidad,categoria) VALUES ('"+nombre+"', '"+apellido+"','"+mail+"','"+cantidad+"','"+categoria+"')";

	out.print(nombre+apellido+mail+cantidad+categoria);
	
	DBConnection conexion=new DBConnection();
	Connection cn=conexion.conectar();
	Statement stm=null;
	ResultSet rsid=null;


	
	try{
		stm=cn.createStatement();
		rsid=stm.executeQuery("SELECT MAX(id_ticket) From tickets");
		
		out.println(rsid);
		
		while(rsid.next()){
			
			int id=rsid.getInt(1);
			query="UPDATE tickets SET `nombre`='"+nombre+"',`apellido`='"+apellido+"',`mail`='"+mail+"',`cantidad`="+cantidad+",`categoria`='"+categoria+"'WHERE id_ticket="+id;
			stm.executeUpdate(query);
		}
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
try {
	
	if (rsid != null) {
        rsid.close();
    }
        
        if(stm!=null){
            stm.close();
        }
        if(cn!=null){
            cn.close();
        }
    }catch (SQLException throwables) {
            throwables.printStackTrace();
        }

	out.print("Se cargaron los datos");
	

	response.sendRedirect("./tickets.html");
%>



</body>
</html>