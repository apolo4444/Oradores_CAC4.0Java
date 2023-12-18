<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import= "jsp.connection.DBConnection" %> 
 <%@ page import="java.sql.*" %>>  
<!DOCTYPE html>
<html>
<head>
  <title>Compras Hechas</title>
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

<header>
    <div class="logo">
        <img src="../Assets/Images/codoacodo.png" alt="Imagen por defecto">
        <h2>Conf BS AS</h2>
    </div>
    <nav>
        <a href="../index.html">La Conferencia</a>
        <a href="../index.html">Los Oradores</a>
        <a href="../index.html">El lugar y la fecha</a>
        <a href="../index.html">Conviertete en Orador</a>
        <a class="tickets" href="../index.html">Regresar</a>
    </nav>
  </header>

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

<div class="grid-content">

    <div id="oradores" class="item-4">

<div class="title">
	<h1>Tabla de Compras</h1>
	</div>

<table class="table">

	<thead>
		<tr>
		
		<th scope="col">Id</th>
		<th scope="col">Nombre</th>
		<th scope="col">Apellido</th>
		<th scope="col">Email</th>
		<th scope="col">Cantidad</th>
		<th scope="col">Categoria</th>
			
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

</div>
</div>


<footer>
    <nav>
        <a href="#">Preguntas frecuentes</a>
        <a href="#">Contactanos</a>
        <a href="#">Prensa</a>
        <a href="#">Conferencias</a>
        <a href="#">Terminos y condiciones</a>
        <a href="#">Privacidad</a>
        <a href="#">Estudiantes</a>
    </nav>
  </footer>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
    integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous">
  </script>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"
    integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz" crossorigin="anonymous">
  </script>


</body>
</html>