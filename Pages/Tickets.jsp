<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <title>Comprar Tickets</title>
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
  <main>

  </main>

  <div class="grid-content">

    <div id="oradores" class="item-1">

        <div class="content-card2">
            <div class="card-1 border">
                <h2>Estudiante </h2>
                <p>Tienen un descuento </p>
                <b>80%</b>
                <p>*Presentar documentacion</p>
            </div>
    
            <div class="card-2 border">
                <h2>Trainee </h2>
                <p>Tienen un descuento </p>
                <b>50%</b>
                <p>*Presentar documentacion</p>
            </div>
    
            <div class="card-3 border">
                <h2>Junior</h2>
                <p>Tienen un descuento </p>
                <b>15%</b>
                <p>*Presentar documentacion</p>
            </div>

        </div>    
    </div>

    <div id="conviertete" class="item-4">
        <div class="title">
            <h6>VENTA </h6>
            <h2>VALOR DEL TICKET $200</h2>
            
        </div>
        
        <form  action="Update.jsp">
            <input type="text" id="nombre" name= "nombre"  value="<%= request.getParameter("nombre")%>" placeholder="Nombre" size="32px"  required>
            <input type="text" id="apellido" name= "apellido" value="<%= request.getParameter("apellido")%>" placeholder="Apellido" size="32px" required>
            <br>
            <input type="text" id="mail" name="mail" value="<%= request.getParameter("mail")%>" placeholder="@hotmail.com" size="70px" required>
           <div class="filas">
            <div class="columnas">
              <label for="cantidad">Cantidad</label>
           
            <input type="number" id="cantidad" name="cantidad" value="<%= request.getParameter("cantidad")%>" placeholder="Cantidad" required>
            </div>
            
            <div class="columnas">
              <label for="categoria" width="50%">Categoria</label>
           
             
              <select  id="categoria" name="categoria" width="50%">
                      <option selected><%= request.getParameter("categoria")%></option>
                      <option value="0">Sin categoría</option>
                      <option value="1">Estudiante</option>
                      <option value="2">Traineer</option>
                      <option value="3">Junior</option>
      
              </select>
            </div>

           </div>

           
           
            <br>
            <h4 class="monto" id="totalPagar">$Total a pagar </h4>
            <br>
            <brdiv class="enLinea">
              <button class="boton botonDecorado" id="btnClear"  onclick="location.href='Delete.jsp'" type="button">Delete</button>
              <button class="boton botonDecorado" id="btnConfirmar"  type="button">Confirmar</button>
              </br>
       
              <button class="boton botonDecorado" id="btnResumen" type="submit">Modificar</button>
              </br>
       
              <button class="boton botonDecorado" id="btnResumen" type="button" onclick="location.href='MostrarCompras.jsp'">Mostrar Compra</button>
            </div>
            
        </form>
        
       
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

  <script src="../JS/confirmar.js"></script>
  
  
</body>

</body>
</html>