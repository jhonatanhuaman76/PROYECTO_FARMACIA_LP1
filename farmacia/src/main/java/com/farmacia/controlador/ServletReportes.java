package com.farmacia.controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.farmacia.dao.BoletaDAO;
import com.farmacia.entidad.Boleta;
import com.google.gson.Gson;

/**
 * Servlet implementation class ServletReportes
 */
@WebServlet("/gestionReportes")
public class ServletReportes extends HttpServlet {
	private static final long serialVersionUID = 1L;
	BoletaDAO boleDAO = new BoletaDAO();
	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String reporte = request.getParameter("reporte");
		String codPro = request.getParameter("codProducto");
		String codEmp = request.getParameter("codEmpleado");
		
		try {
			switch(reporte) {
			case "rxp":
				ArrayList<Boleta> listame = boleDAO.reporteXProducto(Integer.parseInt(codPro));
				
				Gson gson = new Gson();
				String json = gson.toJson(listame);
				
				PrintWriter out = response.getWriter();
				out.print(json);
				out.flush();
				break;
			case "rxv":
				ArrayList<Boleta> listaV = boleDAO.reporteXEmpleado(Integer.parseInt(codEmp));
				
				Gson gson2 = new Gson();
				String json2 = gson2.toJson(listaV);
				
				PrintWriter out2 = response.getWriter();
				out2.print(json2);
				out2.flush();
				break;
			default:
			}
		} catch (Exception e) {
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}
	}

}
