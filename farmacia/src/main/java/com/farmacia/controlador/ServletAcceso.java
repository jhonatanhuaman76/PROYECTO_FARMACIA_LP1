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
				request.getSession().setAttribute("empleado", objEmpleado);
				
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
			
			System.out.println(nom);
			System.out.println(ape);
			System.out.println(correo);
			System.out.println(user);
			
			objEmpleado = objEmpleadoDAO.recuperarClave(nom, ape, correo, user);
			
			if(objEmpleado.getNom_emp()!=null) {
				request.setAttribute("empleado", objEmpleado);
				
				String title1 = "USUARIO VALIDADO", 
						text1 = "Contraseña: "+objEmpleado.getPas_usu(), 
						icon1 = "success";
				
				request.getSession().setAttribute("title", title1);
				request.getSession().setAttribute("text", text1);
				request.getSession().setAttribute("icon", icon1);
				
				request.getRequestDispatcher("Login.jsp").forward(request, response);
			}else {
				String title1 = "ERROR", 
						text1 = "No está registrado en la base de datos", 
						icon1 = "error";
				
				request.getSession().setAttribute("title", title1);
				request.getSession().setAttribute("text", text1);
				request.getSession().setAttribute("icon", icon1);
				
				request.getRequestDispatcher("Login.jsp").forward(request, response);
			}
		}
		else {
			request.getSession().removeAttribute("empleado");
			request.getRequestDispatcher("Login.jsp").forward(request, response);
		}
		
	}

}
