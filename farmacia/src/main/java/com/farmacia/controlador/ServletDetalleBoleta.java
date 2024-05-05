package com.farmacia.controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.farmacia.dao.DetalleBoletaDAO;
import com.farmacia.entidad.DetalleBoleta;
import com.google.gson.Gson;

/**
 * Servlet implementation class ServletDetalleBoleta
 */
@WebServlet("/gestionDetalleBoleta")
public class ServletDetalleBoleta extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DetalleBoletaDAO dbDAO = new DetalleBoletaDAO();
	
	
	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String codBoleta = request.getParameter("codBoleta");
		
		try {
			ArrayList<DetalleBoleta> listame = dbDAO.listarDetalleBoletaXCodigoBoleta(Integer.parseInt(codBoleta));
			
			Gson gson = new Gson();
			String json = gson.toJson(listame);
			
			PrintWriter out = response.getWriter();
			out.print(json);
			out.flush();
		} catch (Exception e) {
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}
	}

}
