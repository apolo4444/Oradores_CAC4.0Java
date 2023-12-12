<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import= "jsp.connection.DBConnection" %> 
 <%@ page import="java.sql.*" %>>  
<!DOCTYPE html>
<html>
<head>
  <title>Oradores</title>
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

<div class="grid-content">

    <div id="oradores" class="item-4">

	<div class="title">
	<h1>Tabla de los Oradores</h1>
	</div>
	
	<table class="table">
		<thead>
		<tr>
			<th scope="col">INDICE</th>
			<th scope="col">NOMBRE</th>
			<th scope="col">EMAIL</th>
			<th scope="col">SEMINARIO</th>
		</tr>
		</thead>
		<tbody>
		
		<%

	Connection cn=null;
	Statement stm=null;
	ResultSet rs=null;


	int id=0;	
	String nombre=""; 
	String mail= ""; 
	String charla="";
	String query= "SELECT * FROM orador";
	
		
	DBConnection conexion=new DBConnection();
	cn=conexion.conectar();

	 try {
         stm=cn.createStatement();
         rs=stm.executeQuery(query);

         while(rs.next()){
             id=rs.getInt(1);
             nombre=rs.getString(2);
             mail= rs.getString(3);
             charla= rs.getString(4);

             out.print("<tr>");
             out.print("<td>"+id+"</td>"); 
             out.print("<td>"+nombre+"</td>"); 
             out.print("<td>"+mail+"</td>"); 
             out.print("<td>"+charla+"</td>"); 
             out.print("</tr>");
           
         }

     } catch (SQLException throwables) {
         throwables.printStackTrace();
     }

     try {
         if (rs != null) {
             rs.close();
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
	
 <!-- Bootstrap JavaScript Libraries -->
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
    integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous">
  </script>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"
    integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz" crossorigin="anonymous">
  </script>

</body>
</html>