package com.farmacia.controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.farmacia.entidad.Producto;
import com.farmacia.entidad.Categoria;
import com.farmacia.entidad.Marca;
import java.util.ArrayList;

import com.farmacia.dao.MarcaDAO;
import com.farmacia.dao.ProductoDAO;
import com.farmacia.dao.CategoriaDAO;

/**
 * Servlet implementation class ServletProducto
 */
@WebServlet("/gestionProducto")
public class ServletProducto extends HttpServlet {
	private static final long serialVersionUID = 1L;

	//Declarando y creando Obejtos
	Producto produ = new Producto();
	Categoria cat = new Categoria();
	
	
	ProductoDAO proDAO= new ProductoDAO();
	CategoriaDAO catDAO= new CategoriaDAO();
	
	
	
	
	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 
		String accion=request.getParameter("accion");

		
		String codi= request.getParameter("codigo");
		String categoria=request.getParameter("txtcategoria");
		String producto=request.getParameter("txtpro");
		String puc=request.getParameter("txtPUC");
		String puv=request.getParameter("txtPUV");
		String stockmin=request.getParameter("txtSMin");
		String stockmax=request.getParameter("txtSMax");
		String presentacion=request.getParameter("txtpresentacion");
		String M_controlado=request.getParameter("txtMC");
		
		String title = "Oops...", 
				text = "Algo fall�", 
				icon = "error";
		
		try {
			
				switch(accion){
					
					case "Agregar":
						//enviar lo que tiene las variables al objeto de tipo pro, cat, marca
						produ.setNum_cate(Integer.parseInt(categoria));
						produ.setNom_pro(producto);
						produ.setPre_unit_compra(Double.parseDouble(puc));
						produ.setPre_unit_venta(Double.parseDouble(puv));
						produ.setStock_min(Integer.parseInt(stockmin));
						produ.setStock_max(Integer.parseInt(stockmax));		
						produ.setPres(presentacion);
						produ.setM_control(Integer.parseInt(M_controlado));
						int result = proDAO.registrarProducto(produ);
						System.out.println(codi);
						if(result!=-1) {
							title = "¡Producto  guardado!";
							text = "El Producto se ha registrado correctamente";
							icon = "success";					
						}else {
							title = "Oops...";
							text = "No se pudo registrar el Producto";
							icon = "error";					
						}
					break;
					
					case "Actualizar":
						//enviar lo que tiene las variables al objeto de tipo pro, cat, marca
						produ.setCod_pro(Integer.parseInt(codi));
						produ.setNum_cate(Integer.parseInt(categoria));
						produ.setNom_pro(producto);
						produ.setPre_unit_compra(Double.parseDouble(puc));
						produ.setPre_unit_venta(Double.parseDouble(puv));
						produ.setStock_min(Integer.parseInt(stockmin));
						produ.setStock_max(Integer.parseInt(stockmax));		
						produ.setPres(presentacion);
						produ.setM_control(Integer.parseInt(M_controlado));
						int resul = proDAO.modificarProducto(produ);
						
						if(resul!=-1) {
							title = "¡Producto  guardado!";
							text = "El Producto se ha Actualizado correctamente";
							icon = "success";					
						}else {
							title = "Oops...";
							text = "No se pudo Actualizar el Producto";
							icon = "error";					
						}
					break;
						
					case "Eliminar":
						int r = proDAO.eliminarProducto(Integer.parseInt(codi));
						
						if(r!=-1) {
							title = "¡Empleado  eliminado!";
							text = "El empleado se ha eliminado correctamente";
							icon = "info";					
						}else {
							title = "Oops...";
							text = "No se pudo eliminar el producto. Ya ha sido registrado en una venta";
							icon = "error";
						}
						break;
					
						
						
						
				default:
						throw new AssertionError();
						
				}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.getSession().setAttribute("title", title);
		request.getSession().setAttribute("text", text);
		request.getSession().setAttribute("icon", icon);
		
		response.sendRedirect("Producto.jsp");
	}

}
