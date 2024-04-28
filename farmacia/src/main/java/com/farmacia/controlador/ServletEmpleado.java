package com.farmacia.controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.ArrayList;
import com.farmacia.entidad.Empleado;
import com.farmacia.dao.EmpleadoDAO;

@WebServlet("/gestionEmpleado")
public class ServletEmpleado extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	Empleado objEmpleado=new Empleado();
	EmpleadoDAO emplDAO=new EmpleadoDAO();
	int codEmpl;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String accion=request.getParameter("accion");
		
		try {
			switch(accion) {
			case "Listar":
				ArrayList<Empleado>lista=emplDAO.listadoEmpleado();
				request.setAttribute("lista_empleados", lista);
				request.getRequestDispatcher("empleado.jsp").forward(request, response);
				break;
			case "Agregar":
				String dni=request.getParameter("txtDNI");
				String nombre=request.getParameter("txtNombre");
				String apellido=request.getParameter("txtApellido");
				String telef=request.getParameter("txtTelef");
				String correo=request.getParameter("txtCorreo");
				String dire=request.getParameter("txtDireccion");
				//no lee la base de datos lo q se ingresa en tipo, falta averiguar
				String tipo=String.valueOf(request.getParameter("txtTipo"));
				String user=request.getParameter("txtUser");
				String pass=request.getParameter("txtPassword");
				
				objEmpleado.setDni_emp(dni);
				objEmpleado.setNom_emp(nombre);
				objEmpleado.setApe_emp(apellido);
				objEmpleado.setTelf_emp(telef);
				objEmpleado.setCorreo_emp(correo);
				objEmpleado.setDire_emp(dire);
				objEmpleado.setTipo_usu(tipo);
				objEmpleado.setNom_usu(user);
				objEmpleado.setPas_usu(pass);
				
				emplDAO.registrarEmpleado(objEmpleado);
				request.getRequestDispatcher("gestionEmpleado?accion=Listar").forward(request, response);
				break;
			case "Editar":
				codEmpl=Integer.parseInt(request.getParameter("id"));
				objEmpleado=emplDAO.buscarEmpleado(codEmpl);
				request.setAttribute("miEmpleado", objEmpleado);
				request.getRequestDispatcher("gestionEmpleado?accion=Listar").forward(request, response);
				break;
			case "Actualizar":
				String dni1=request.getParameter("txtDNI");
				String nombre1=request.getParameter("txtNombre");
				String apellido1=request.getParameter("txtApellido");
				String telef1=request.getParameter("txtTelef");
				String correo1=request.getParameter("txtCorreo");
				String dire1=request.getParameter("txtDireccion");
				//no lee la base de datos lo q se ingresa en tipo, falta averiguar
				String tipo1=String.valueOf(request.getParameter("txtTipo"));
				String user1=request.getParameter("txtUser");
				String pass1=request.getParameter("txtPassword");
				
				objEmpleado.setCod_emp(codEmpl);
				objEmpleado.setDni_emp(dni1);
				objEmpleado.setNom_emp(nombre1);
				objEmpleado.setApe_emp(apellido1);
				objEmpleado.setTelf_emp(telef1);
				objEmpleado.setCorreo_emp(correo1);
				objEmpleado.setDire_emp(dire1);
				objEmpleado.setTipo_usu(tipo1);
				objEmpleado.setNom_usu(user1);
				objEmpleado.setPas_usu(pass1);
				
				emplDAO.modificarEmpleado(objEmpleado);
				request.getRequestDispatcher("gestionEmpleado?accion=Listar").forward(request, response);
				
				break;
			default:
				throw new AssertionError();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}