package com.farmacia.controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.farmacia.entidad.Proveedor;
import com.farmacia.dao.ProveedorDAO;

@WebServlet("/gestionProveedor")
public class ServletProveedor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	Proveedor objProveedor=new Proveedor();
	ProveedorDAO objProveedorDAO=new ProveedorDAO();
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String accion=request.getParameter("accion");
		
		String cod = request.getParameter("codigo");
		String ruc = request.getParameter("ruc");
		String nombre = request.getParameter("nombre");
		String telef = request.getParameter("telefono");
		String dire = request.getParameter("direccion");
		String correo = request.getParameter("correo");
		String web = request.getParameter("web");
		
		String title = "Oops...", 
				text = "Algo fall�", 
				icon = "error";
		try {
			switch(accion) {
			case "Agregar":
				objProveedor.setRuc_prov(ruc);
				objProveedor.setNom_prov(nombre);
				objProveedor.setTelf_prov(telef);
				objProveedor.setDire_prov(dire);
				objProveedor.setCorreo_prov(correo);
				objProveedor.setWeb_prov(web);
				
				int result = objProveedorDAO.registrarProveedor(objProveedor);
				
				if(result!=-1) {
					title = "¡Proveedor  guardado!";
					text = "El proveedor se ha registrado correctamente";
					icon = "success";					
				}else {
					title = "Oops...";
					text = "No se pudo registrar el proveedor";
					icon = "error";					
				}
				break;
			case "Actualizar":
				objProveedor.setCod_prov(Integer.parseInt(cod));
				objProveedor.setRuc_prov(ruc);
				objProveedor.setNom_prov(nombre);
				objProveedor.setTelf_prov(telef);
				objProveedor.setDire_prov(dire);
				objProveedor.setCorreo_prov(correo);
				objProveedor.setWeb_prov(web);
				
				int res = objProveedorDAO.modificarProveedor(objProveedor);
				if(res!=-1) {
					title = "¡Proveedor  actualizado!";
					text = "El proveedor se ha editado correctamente";
					icon = "success";					
				}else {
					title = "Oops...";
					text = "No se pudo editar el proveedor";
					icon = "error";					
				}
				break;
			case "Eliminar":
				int r = objProveedorDAO.eliminarProveedor(Integer.parseInt(cod));
				
				if(r!=-1) {
					title = "¡Proveedor  eliminado!";
					text = "El proveedor se ha eliminado correctamente";
					icon = "info";					
				}else {
					title = "Oops...";
					text = "No se pudo eliminar el proveedor. Ya ha sido registrado en una compra";
					icon = "error";
				}
				break;
			default:
				throw new AssertionError();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		request.getSession().setAttribute("title", title);
		request.getSession().setAttribute("text", text);
		request.getSession().setAttribute("icon", icon);
		
		response.sendRedirect("Proveedor.jsp");
	}

}
