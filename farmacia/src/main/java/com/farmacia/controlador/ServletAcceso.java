package com.farmacia.controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.farmacia.entidad.Empleado;
import com.farmacia.dao.EmpleadoDAO;

@WebServlet("/gestionAcceso")
public class ServletAcceso extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	Empleado objEmpleado=new Empleado();
	EmpleadoDAO objEmpleadoDAO=new EmpleadoDAO();
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String accion=request.getParameter("accion");
		String login, password;
		String nom, ape, correo, user;
		
		
		
		if(accion.equalsIgnoreCase("Ingresar")) {
			login=request.getParameter("txtUsuario");
			password=request.getParameter("txtPassword");
			//enviar al objeto usuario lo q viene del servicio
			objEmpleado=objEmpleadoDAO.acceder(login, password);
			
			//Validar objUser
			if(objEmpleado.getNom_usu()!=null) {
				request.setAttribute("empleado", objEmpleado);
				
				//Direccionar
				request.getRequestDispatcher("Inicio.jsp").forward(request, response);

			}
			else {
				String title = "ERROR", 
						text = "Usuario o contraseña incorrecto", 
						icon = "error";
				
				request.getSession().setAttribute("title", title);
				request.getSession().setAttribute("text", text);
				request.getSession().setAttribute("icon", icon);
				
				request.getRequestDispatcher("Login.jsp").forward(request, response);
			}
		}else if(accion.equalsIgnoreCase("Recuperar")) {
			nom=request.getParameter("nombre");
			ape=request.getParameter("apellido");
			correo=request.getParameter("correo");
			user=request.getParameter("nombreUsuario");
			
			objEmpleado=objEmpleadoDAO.recuperarClave(nom, ape, correo, user);
			
			if(objEmpleado.getNom_emp()!=null) {
				request.setAttribute("empleado", objEmpleado);
				
				String title1 = "USUARIO VALIDADO", 
						text1 = "Contraseña: "+objEmpleado.getPas_usu(), 
						icon1 = "success";
				
				request.getSession().setAttribute("title1", title1);
				request.getSession().setAttribute("text1", text1);
				request.getSession().setAttribute("icon1", icon1);
				
				request.getRequestDispatcher("Login.jsp").forward(request, response);
			}else {
				String title1 = "ERROR", 
						text1 = "No está registrado en la base de datos", 
						icon1 = "error";
				
				request.getSession().setAttribute("title1", title1);
				request.getSession().setAttribute("text1", text1);
				request.getSession().setAttribute("icon1", icon1);
				
				request.getRequestDispatcher("Login.jsp").forward(request, response);
			}
		}
		else {
			request.getRequestDispatcher("Login.jsp").forward(request, response);
			
		}
		
	}

}
