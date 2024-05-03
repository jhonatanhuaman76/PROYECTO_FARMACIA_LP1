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
		
		String accion = request.getParameter("accion");
		String codPro = request.getParameter("producto");
		String stock = request.getParameter("stock");
		String fechaVenc = request.getParameter("fecha_venc");
		String fechaFab = request.getParameter("fecha_fab");
		String condTran = request.getParameter("cond_tran");
		String codLote = request.getParameter("cod");
		
		String title = "Oops...", 
				text = "Algo falló", 
				icon = "error";
		
		try {
			switch(accion) {
			case "Agregar":
				Lote d = new Lote();
				d.setCod_pro(Integer.parseInt(codPro));
				d.setStock(Integer.parseInt(stock));
				d.setFecha_venc(fechaVenc);
				d.setFecha_fab(fechaFab);
				d.setCond_trans(condTran);
				
				int result = loteDAO.registrarLote(d);
				
				if(result!=-1) {
					title = "¡Lote guardado!";
					text = "El lote se ha registrado correctamente";
					icon = "success";					
				}else {
					title = "Oops...";
					text = "No se pudo registrar el lote";
					icon = "error";					
				}
				break;
			case "Eliminar":
				int res = loteDAO.eliminarLote(Integer.parseInt(codLote));
				
				if(res!=-1) {
					title = "¡Lote eliminado!";
					text = "El lote se ha eliminado correctamente";
					icon = "info";
				}else {
					title = "Oops...";
					text = "No es posible eliminar el lote. Ya ha sido registrado en una venta o compra";
					icon = "error";
				}
				break;
			default:
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		request.getSession().setAttribute("title", title);
		request.getSession().setAttribute("text", text);
		request.getSession().setAttribute("icon", icon);
		
		response.sendRedirect("Inventario.jsp");
		
	}

}
