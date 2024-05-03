package com.farmacia.contructor;

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
	Marca Marca = new Marca();
	
	ProductoDAO proDAO= new ProductoDAO();
	CategoriaDAO catDAO= new CategoriaDAO();
	MarcaDAO marcaDAO= new MarcaDAO();
	
	int codpro;
	
	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 
		String accion=request.getParameter("accion");
		String menu=request.getParameter("menu");
		
		try {
			if(menu.equalsIgnoreCase("Menu")) {
				request.getRequestDispatcher("menu.jsp").forward(request, response);
			}
			if(menu.equalsIgnoreCase("Producto")) {
				switch(accion){
					case "ListarProducto": ArrayList<Producto>pro=proDAO.listadoProducto();
					request.setAttribute("ListaProducto", pro);
					break;
					
					case "AgregarProducto":
						int categoria=Integer.parseInt(request.getParameter("txtcategoria"));
						String producto=request.getParameter("txtpro");
						double puc=Double.parseDouble(request.getParameter("txtPUC"));
						double puv=Double.parseDouble(request.getParameter("txtPUV"));
						int stockmin=Integer.parseInt(request.getParameter("txtSMin"));
						int stockmax=Integer.parseInt(request.getParameter("txtSMax"));
						
						String presentacion=request.getParameter("txtpresentacion");
						int M_controlado=Integer.parseInt(request.getParameter("txtMC"));
						
						//enviar lo que tiene las variables al objeto de tipo pro, cat, marca
						produ.setNum_cate(categoria);
						produ.setNom_pro(producto);
						produ.setPre_unit_compra(puc);
						produ.setPre_unit_venta(puv);
						produ.setStock_min(stockmin);
						produ.setStock_max(stockmax);		
						produ.setPres(presentacion);
						produ.setM_control(M_controlado);
						
						 // Registrar el producto
					    
					    
						request.getRequestDispatcher("gestionProducto?menu=Producto&accion=ListarProducto").forward(request, response);
					
						
						
						
						
						
				}//fin del Switch
			}//fin del if "Producto"
			
		} catch (Exception e) {
			// TODO: handle exception
		}//fin del catch
		
	}

}
