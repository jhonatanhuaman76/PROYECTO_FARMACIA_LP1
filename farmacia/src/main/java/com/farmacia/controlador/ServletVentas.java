package com.farmacia.controlador;

import java.io.IOException;
import java.time.LocalDate;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.farmacia.dao.BoletaDAO;
import com.farmacia.dao.DetalleBoletaDAO;
import com.farmacia.dao.LoteDAO;
import com.farmacia.entidad.Boleta;
import com.farmacia.entidad.DetalleBoleta;

/**
 * Servlet implementation class ServletVentas
 */
@WebServlet("/gestionVentas")
public class ServletVentas extends HttpServlet {
	private static final long serialVersionUID = 1L;
	BoletaDAO boleDAO = new BoletaDAO();
	DetalleBoletaDAO deboleDAO = new DetalleBoletaDAO();
	LoteDAO loteDAO = new LoteDAO();
       
	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = "Oops...";
		String text = "No se pudo registrar la venta";
		String icon = "error";
		
		try {
			int codEmp = 1;// Cambiar luego cuando el login esté creado
			int codCli = Integer.parseInt(request.getParameter("cliente"));
			String metodoPago = request.getParameter("metodo_pago");
			String fechaEmision = LocalDate.now().toString();
			
			String[] cantidadesPresStr = request.getParameterValues("cantidadPres[]");
			String[] cantidadesBaseStr = request.getParameterValues("cantidadBase[]");
			String[] nroLotesStr = request.getParameterValues("nroLote[]");
			String[] preciosStr = request.getParameterValues("precio[]");
			String[] unidadesStr = request.getParameterValues("unidad[]");
			
			int[] cantidadesPres = Arrays.stream(cantidadesPresStr).mapToInt(Integer::parseInt).toArray();
			int[] cantidadesBase = Arrays.stream(cantidadesBaseStr).mapToInt(Integer::parseInt).toArray();
			int[] nroLotes = Arrays.stream(nroLotesStr).mapToInt(Integer::parseInt).toArray();
			double[] precios = Arrays.stream(preciosStr).mapToDouble(Double::parseDouble).toArray();
			int[] unidades = Arrays.stream(unidadesStr).mapToInt(Integer::parseInt).toArray();
			
			// Registrando la boleta de venta
			Boleta b = new Boleta();
			b.setCod_cli(codCli);
			b.setCod_emp(codEmp);
			b.setMetodo_pago(metodoPago);
			b.setFecha_em(fechaEmision);
			
			int codigoBoleta = boleDAO.registrarBoleta(b);
			
			if(codigoBoleta==-1)
				return;
			
			// Registrando detalle de la boleta de venta
			for(int i=0; i < nroLotes.length; i++) {
				DetalleBoleta db = new DetalleBoleta();
				db.setCod_boleta(codigoBoleta);
				db.setCod_lote(nroLotes[i]);
				db.setCod_prod(loteDAO.buscarLote(nroLotes[i]).getCod_pro());
				db.setCod_uni(unidades[i]);
				db.setCant_vend_base(cantidadesBase[i]);
				db.setCant_vend_pres(cantidadesPres[i]);
				db.setPre_unit_venta(precios[i]);
				
				deboleDAO.registrarDetalleBoleta(db);
				
			}
			
			title = "¡Venta exitosa!";
			text = "La venta se ha realizado correctamente";
			icon = "success";
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		request.getSession().setAttribute("title", title);
		request.getSession().setAttribute("text", text);
		request.getSession().setAttribute("icon", icon);
		
		response.sendRedirect("Vender.jsp");
	}

}
