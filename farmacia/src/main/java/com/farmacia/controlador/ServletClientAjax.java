package com.farmacia.controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.farmacia.dao.ClienteDAO;
import com.farmacia.entidad.Cliente;
import com.farmacia.entidad.UmProducto;
import com.google.gson.Gson;

/**
 * Servlet implementation class ServletClientAjax
 */
@WebServlet("/gestionClienteAjax")
public class ServletClientAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ClienteDAO cliDAO = new ClienteDAO();
	Cliente objC = new Cliente();

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String dni = request.getParameter("dni");
			String nombre = request.getParameter("nombre");
			String apellido = request.getParameter("apellido");
			
			objC.setDni_cli(dni);
			objC.setNom_cli(nombre);
			objC.setApe_cli(apellido);
			
			int resultado = cliDAO.registrarCliente(objC);
			ArrayList<Cliente> listame= cliDAO.listadoCliente();
			
			// Convertir el ArrayList a JSON
			Gson gson = new Gson();
			String json = gson.toJson(listame);
			
			// Enviar el JSON al cliente
			PrintWriter out = response.getWriter();
			out.print(json);
			out.flush();
		} catch(NumberFormatException e) {
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			e.getMessage();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

}
