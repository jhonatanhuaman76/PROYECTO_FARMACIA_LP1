package com.farmacia.entidad;

public class DetalleBoleta {
private int cod_boleta, cod_lote, cod_prod, cod_uni, cant_vend_base, cant_vend_pres;
private double pre_unit_venta;

public DetalleBoleta() {
}

public DetalleBoleta(int cod_boleta, int cod_lote, int cod_prod, int cod_uni, int cant_vend_base, int cant_vend_pres,
		double pre_unit_venta) {
	this.cod_boleta = cod_boleta;
	this.cod_lote = cod_lote;
	this.cod_prod = cod_prod;
	this.cod_uni = cod_uni;
	this.cant_vend_base = cant_vend_base;
	this.cant_vend_pres = cant_vend_pres;
	this.pre_unit_venta = pre_unit_venta;
}

public int getCod_boleta() {
	return cod_boleta;
}

public void setCod_boleta(int cod_boleta) {
	this.cod_boleta = cod_boleta;
}

public int getCod_lote() {
	return cod_lote;
}

public void setCod_lote(int cod_lote) {
	this.cod_lote = cod_lote;
}

public int getCod_prod() {
	return cod_prod;
}

public void setCod_prod(int cod_prod) {
	this.cod_prod = cod_prod;
}

public int getCod_uni() {
	return cod_uni;
}

public void setCod_uni(int cod_uni) {
	this.cod_uni = cod_uni;
}

public int getCant_vend_base() {
	return cant_vend_base;
}

public void setCant_vend_base(int cant_vend_base) {
	this.cant_vend_base = cant_vend_base;
}

public int getCant_vend_pres() {
	return cant_vend_pres;
}

public void setCant_vend_pres(int cant_vend_pres) {
	this.cant_vend_pres = cant_vend_pres;
}

public double getPre_unit_venta() {
	return pre_unit_venta;
}

public void setPre_unit_venta(double pre_unit_venta) {
	this.pre_unit_venta = pre_unit_venta;
}

}
