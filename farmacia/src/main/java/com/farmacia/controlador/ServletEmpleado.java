package com.farmacia.controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.farmacia.entidad.Empleado;
import com.farmacia.dao.EmpleadoDAO;

@WebServlet("/gestionEmpleado")
public class ServletEmpleado extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	Empleado objEmpleado=new Empleado();
	EmpleadoDAO objEmpleadoDAO=new EmpleadoDAO();
	//int codEmpl;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String accion=request.getParameter("accion");
		
		String cod = request.getParameter("codigo");
		String dni = request.getParameter("dni");
		String nombre = request.getParameter("nombre");
		String apellido = request.getParameter("apellido");
		String telef = request.getParameter("telefono");
		String correo = request.getParameter("correo");
		String dire = request.getParameter("direccion");
		String tipoUser = request.getParameter("tipoUsuario");
		String nomUser = request.getParameter("nombreUsuario");
		String pasUser = request.getParameter("password");
		
		String title = "Oops...", 
				text = "Algo fall�", 
				icon = "error";
		
		try {
			switch(accion) {
			case "Agregar":
				objEmpleado.setDni_emp(dni);
				objEmpleado.setNom_emp(nombre);
				objEmpleado.setApe_emp(apellido);
				objEmpleado.setTelf_emp(telef);
				objEmpleado.setCorreo_emp(correo);
				objEmpleado.setDire_emp(dire);
				objEmpleado.setTipo_usu(tipoUser);
				objEmpleado.setNom_usu(nomUser);
				objEmpleado.setPas_usu(pasUser);
				
				int result = objEmpleadoDAO.registrarEmpleado(objEmpleado);
				
				if(result!=-1) {
					title = "¡Empleado  guardado!";
					text = "El empleado se ha registrado correctamente";
					icon = "success";					
				}else {
					title = "Oops...";
					text = "No se pudo registrar el empleado";
					icon = "error";					
				}
				break;
			case "Actualizar":
				objEmpleado.setCod_emp(Integer.parseInt(cod));
				objEmpleado.setDni_emp(dni);
				objEmpleado.setNom_emp(nombre);
				objEmpleado.setApe_emp(apellido);
				objEmpleado.setTelf_emp(telef);
				objEmpleado.setCorreo_emp(correo);
				objEmpleado.setDire_emp(dire);
				objEmpleado.setTipo_usu(tipoUser);
				objEmpleado.setNom_usu(nomUser);
				objEmpleado.setPas_usu(pasUser);
				
				int res = objEmpleadoDAO.modificarEmpleado(objEmpleado);
				if(res!=-1) {
					title = "¡Empleado  actualizado!";
					text = "El empleado se ha editado correctamente";
					icon = "success";					
				}else {
					title = "Oops...";
					text = "No se pudo editar el empleado";
					icon = "error";					
				}
				break;
			case "Eliminar":
				int r = objEmpleadoDAO.eliminarEmpleado(Integer.parseInt(cod));
				
				if(r!=-1) {
					title = "¡Empleado  eliminado!";
					text = "El empleado se ha eliminado correctamente";
					icon = "info";					
				}else {
					title = "Oops...";
					text = "No se pudo eliminar el empleado. Ya ha sido registrado en una venta";
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
		
		response.sendRedirect("Empleado.jsp");
	}

}