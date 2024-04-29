package com.farmacia.controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.farmacia.dao.LoteDAO;
import com.farmacia.entidad.Lote;

/**
 * Servlet implementation class ServletLote
 */
@WebServlet("/gestionLote")
public class ServletLote extends HttpServlet {
	private static final long serialVersionUID = 1L;
	LoteDAO loteDAO = new LoteDAO();
	
	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = "Oops...";
		String text = "No se pudo registrar el lote";
		String icon = "error";
		
		try {
			int codPro = Integer.parseInt(request.getParameter("producto"));
			int stock = Integer.parseInt(request.getParameter("stock"));
			String fechaVenc = request.getParameter("fecha_venc");
			String fechaFab = request.getParameter("fecha_fab");
			String condTran = request.getParameter("cond_tran");
			
			Lote d = new Lote();
			d.setCod_pro(codPro);
			d.setStock(stock);
			d.setFecha_venc(fechaVenc);
			d.setFecha_fab(fechaFab);
			d.setCond_trans(condTran);
			
			loteDAO.registrarLote(d);
			
			title = "¡Lote guardado!";
			text = "El lote se ha registrado correctamente";
			icon = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		request.getSession().setAttribute("title", title);
		request.getSession().setAttribute("text", text);
		request.getSession().setAttribute("icon", icon);
		
		response.sendRedirect("Inventario.jsp");
		
	}

}
