function VentaConfirmada(){
	window.location="tickets.html";
	
	//window.open("tickets.html"); la abre en otra pestaña
}

const conf=document.getElementById("btnConfirmar");
conf.addEventListener("click",VentaConfirmada);