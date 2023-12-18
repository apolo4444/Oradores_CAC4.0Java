package Model;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EnviarCorreo {

	static final String FROM = "alumno@gmail.com";
	static final String FROMNAME = "NombreRemitente";
/**/static final String TO = "docente@bue.gov.ar";
	static final String SMTP_USERNAME = "MailDelRemitente";
	static final String SMTP_PASSWORD = "PassDelRemitente";
	static final String CONFIGSET = "ConfigSet";
	static final String HOST = "smtp.gmail.com";//smtp.live.com
	static final int PORT = 587;//465//25
	static final String SUBJECT = "Asunto del mail";
/**/static final String BODY = String.join(System.getProperty("line.separator"),
			"Prueba de envio de correo dese JavaMail",
			"<h1>Hola amigo</h1>",
			"<p>Este es un correo de prueba</p>");

	public static void main(String[] args) throws Exception {
		
		// Crear los objetos de la clase Properties 
		//para cargar la configuración de conexión de la información del servidor.
		Properties props = System.getProperties();
		props.put("mail.transport.protocol", "smtp");
		props.put("mail.smtp.port", PORT);
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.auth", "true");
		
		// Se crea una sesión del objeto Email con las propiedades anteriormente citadas
		Session session = Session.getDefaultInstance(props);
		
		// Crear el cuerpo del mensaje, definirlo, y crear las dependencias para su transporte 
		//usando las constantes declaradas en el clase principal.
		MimeMessage msg = new MimeMessage(session);

		// Agregar quien envía el correo
		msg.setFrom(new InternetAddress(FROM, FROMNAME));

		// Los destinatarios
		//InternetAddress[] internetAddresses = { new InternetAddress("correo1@gmail.com"),
		//		     new InternetAddress("correo2@gmail.com"),
		//		     new InternetAddress("correo3@gmail.com") };

		// Agregar los destinatarios al mensaje
		msg.setRecipient(Message.RecipientType.TO, new InternetAddress(TO));

		// Agregar el asunto al correo
		msg.setSubject(SUBJECT);

		// Creo la parte del mensaje
		/*
		 * MimeBodyPart mimeBodyPart = new MimeBodyPart();
		 * mimeBodyPart.setText(tfMensaje.getText());
		 * 
		 * MimeBodyPart mimeBodyPartAdjunto = new MimeBodyPart();
		 * mimeBodyPartAdjunto.attachFile(tfRutaAdjunto.getText());
		 * 
		 * Crear el multipart para agregar la parte del mensaje anterior Multipart
		 * multipart = new MimeMultipart(); 
		 * multipart.addBodyPart(mimeBodyPart);
		 * multipart.addBodyPart(mimeBodyPartAdjunto);
		 * 
		 * Agregar el multipart al cuerpo del mensaje
		 * msg.setContent(multipart);
		 */
		msg.setContent(BODY, "text/html");
		msg.setHeader("X-SES-CONFIGURATION-SET", CONFIGSET);

		Transport trsport = session.getTransport();
		
		try {
			System.out.println("Enviando...");
			// A continuación hay que conectar con el servidor de correo configurado 
			//por lo que se asigna al método connect de la variable transport 
			//los datos del servidor de correo, usuario y contraseña.
			trsport.connect(HOST, SMTP_USERNAME, SMTP_PASSWORD);
			trsport.sendMessage(msg, msg.getAllRecipients());
			System.out.println("¡Email Enviado!");
		} catch (Exception ex) {
			System.out.println("El email no se ha podido enviar.");
			System.out.println("Error message: " + ex.getMessage());
		}
		// Cerramos la conexión de transport para evitar un error de envio 
		finally {
			trsport.close();
		}

	}
}
