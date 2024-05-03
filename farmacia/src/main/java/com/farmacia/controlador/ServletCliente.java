package com.farmacia.controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.farmacia.dao.ClienteDAO;
import com.farmacia.entidad.Cliente;

/**
 * Servlet implementation class ServletCliente
 */
@WebServlet("/gestionCliente")
public class ServletCliente extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ClienteDAO cliDAO = new ClienteDAO();
	Cliente objC = new Cliente();
	
	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String accion = request.getParameter("accion");
		
		String cod = request.getParameter("codigo");
		String dni = request.getParameter("dni");
		String nombre = request.getParameter("nombre");
		String apellido = request.getParameter("apellido");
		
		String title = "Oops...", 
				text = "Algo falló", 
				icon = "error";
		
		try {
			switch(accion) {
			case "Agregar":
				objC.setDni_cli(dni);
				objC.setNom_cli(nombre);
				objC.setApe_cli(apellido);
				
				int result = cliDAO.registrarCliente(objC);
				
				if(result!=-1) {
					title = "¡cliente guardado!";
					text = "El cliente se ha registrado correctamente";
					icon = "success";					
				}else {
					title = "Oops...";
					text = "No se pudo registrar el cliente";
					icon = "error";					
				}
				break;
			case "Actualizar":
				objC.setCod_cli(Integer.parseInt(cod));
				objC.setDni_cli(dni);
				objC.setNom_cli(nombre);
				objC.setApe_cli(apellido);
				
				int res = cliDAO.modificarCliente(objC);
				if(res!=-1) {
					title = "¡cliente actualizado!";
					text = "El cliente se ha editado correctamente";
					icon = "success";					
				}else {
					title = "Oops...";
					text = "No se pudo editar el cliente";
					icon = "error";					
				}
				break;
			case "Eliminar":
				int r = cliDAO.eliminarCliente(Integer.parseInt(cod));
				
				if(r!=-1) {
					title = "¡cliente eliminado!";
					text = "El cliente se ha eliminado correctamente";
					icon = "info";					
				}else {
					title = "Oops...";
					text = "No se pudo eliminar el cliente. Ya ha sido registrado en una venta";
					icon = "error";
				}
				break;
			default:
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		request.getSession().setAttribute("title", title);
		request.getSession().setAttribute("text", text);
		request.getSession().setAttribute("icon", icon);
		
		response.sendRedirect("Clientes.jsp");

	}

}
