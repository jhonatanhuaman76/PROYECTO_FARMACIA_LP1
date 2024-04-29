package com.farmacia.controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.farmacia.dao.UmProductoDAO;
import com.farmacia.entidad.UmProducto;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

/**
 * Servlet implementation class ServletUM
 */
@WebServlet("/gestionUM")
public class ServletUM extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UmProductoDAO umpDAO = new UmProductoDAO(); 
	
	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int codPro = Integer.parseInt(request.getParameter("codProducto"));
			
			ArrayList<UmProducto> listaUmp = umpDAO.listadoUmProductoxCodigoProd(codPro);
			
			// Convertir el ArrayList a JSON
			Gson gson = new Gson();
			String json = gson.toJson(listaUmp);
			
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
