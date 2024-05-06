package com.farmacia.entidad;

public class Producto {
private int cod_pro, num_cate, stock_min, stock_max, stock_total, cod_marca, m_control, total_ventas;
private String nom_pro, pres, nom_cate, nom_mayor, nom_menor;
private double pre_unit_compra, pre_unit_venta, pvmayor, pvmenor, pvprom;

public Producto() {
}

public Producto(int cod_pro, int num_cate, int stock_min, int stock_max, int cod_marca, int m_control, String nom_pro,
		String pres, double pre_unit_compra, double pre_unit_venta) {
	this.cod_pro = cod_pro;
	this.num_cate = num_cate;
	this.stock_min = stock_min;
	this.stock_max = stock_max;
	this.cod_marca = cod_marca;
	this.m_control = m_control;
	this.nom_pro = nom_pro;
	this.pres = pres;
	this.pre_unit_compra = pre_unit_compra;
	this.pre_unit_venta = pre_unit_venta;
}

public String getNom_mayor() {
	return nom_mayor;
}

public void setNom_mayor(String nom_mayor) {
	this.nom_mayor = nom_mayor;
}

public String getNom_menor() {
	return nom_menor;
}

public void setNom_menor(String nom_menor) {
	this.nom_menor = nom_menor;
}

public double getPvmayor() {
	return pvmayor;
}

public void setPvmayor(double pvmayor) {
	this.pvmayor = pvmayor;
}

public double getPvmenor() {
	return pvmenor;
}

public void setPvmenor(double pvmenor) {
	this.pvmenor = pvmenor;
}

public double getPvprom() {
	return pvprom;
}

public void setPvprom(double pvprom) {
	this.pvprom = pvprom;
}

public int getCod_pro() {
	return cod_pro;
}

public void setCod_pro(int cod_pro) {
	this.cod_pro = cod_pro;
}

public int getNum_cate() {
	return num_cate;
}

public void setNum_cate(int num_cate) {
	this.num_cate = num_cate;
}

public int getStock_min() {
	return stock_min;
}

public void setStock_min(int stock_min) {
	this.stock_min = stock_min;
}

public int getStock_max() {
	return stock_max;
}

public void setStock_max(int stock_max) {
	this.stock_max = stock_max;
}

public int getCod_marca() {
	return cod_marca;
}

public void setCod_marca(int cod_marca) {
	this.cod_marca = cod_marca;
}

public int getM_control() {
	return m_control;
}

public void setM_control(int m_control) {
	this.m_control = m_control;
}

public String getNom_pro() {
	return nom_pro;
}

public void setNom_pro(String nom_pro) {
	this.nom_pro = nom_pro;
}

public String getPres() {
	return pres;
}

public void setPres(String pres) {
	this.pres = pres;
}

public double getPre_unit_compra() {
	return pre_unit_compra;
}

public void setPre_unit_compra(double pre_unit_compra) {
	this.pre_unit_compra = pre_unit_compra;
}

public double getPre_unit_venta() {
	return pre_unit_venta;
}

public void setPre_unit_venta(double pre_unit_venta) {
	this.pre_unit_venta = pre_unit_venta;
}

public int getTotal_ventas() {
	return total_ventas;
}

public void setTotal_ventas(int total_ventas) {
	this.total_ventas = total_ventas;
}

public String getNom_cate() {
	return nom_cate;
}

public void setNom_cate(String nom_cate) {
	this.nom_cate = nom_cate;
}

public int getStock_total() {
	return stock_total;
}

public void setStock_total(int stock_total) {
	this.stock_total = stock_total;
}

}
