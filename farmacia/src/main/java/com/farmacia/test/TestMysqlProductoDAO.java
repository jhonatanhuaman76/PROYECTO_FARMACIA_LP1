package com.farmacia.test;

import com.farmacia.dao.LoteDAO;
import com.farmacia.dao.ProductoDAO;
import com.farmacia.entidad.Lote;
import com.farmacia.entidad.Producto;

public class TestMysqlProductoDAO {

	public static void main(String[] args) {
		ProductoDAO proDAO = new ProductoDAO();
		LoteDAO loteDAO = new LoteDAO();
		
		for(Producto p: proDAO.listadoProducto())
			System.out.println(p.getCod_pro());
	}

}
