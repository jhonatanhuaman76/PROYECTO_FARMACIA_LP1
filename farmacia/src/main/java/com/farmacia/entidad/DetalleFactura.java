package com.farmacia.entidad;

public class DetalleFactura {
private int nro_lote, nro_factura, cod_pro, cod_uni, cant_recib_base, cant_recib_pres;
private double pre_unit_compra;

public DetalleFactura() {
}

public DetalleFactura(int nro_lote, int nro_factura, int cod_pro, int cod_uni, int cant_recib_base, int cant_recib_pres,
		double pre_unit_compra) {
	this.nro_lote = nro_lote;
	this.nro_factura = nro_factura;
	this.cod_pro = cod_pro;
	this.cod_uni = cod_uni;
	this.cant_recib_base = cant_recib_base;
	this.cant_recib_pres = cant_recib_pres;
	this.pre_unit_compra = pre_unit_compra;
}

public int getNro_lote() {
	return nro_lote;
}

public void setNro_lote(int nro_lote) {
	this.nro_lote = nro_lote;
}

public int getNro_factura() {
	return nro_factura;
}

public void setNro_factura(int nro_factura) {
	this.nro_factura = nro_factura;
}

public int getCod_pro() {
	return cod_pro;
}

public void setCod_pro(int cod_pro) {
	this.cod_pro = cod_pro;
}

public int getCod_uni() {
	return cod_uni;
}

public void setCod_uni(int cod_uni) {
	this.cod_uni = cod_uni;
}

public int getCant_recib_base() {
	return cant_recib_base;
}

public void setCant_recib_base(int cant_recib_base) {
	this.cant_recib_base = cant_recib_base;
}

public int getCant_recib_pres() {
	return cant_recib_pres;
}

public void setCant_recib_pres(int cant_recib_pres) {
	this.cant_recib_pres = cant_recib_pres;
}

public double getPre_unit_compra() {
	return pre_unit_compra;
}

public void setPre_unit_compra(double pre_unit_compra) {
	this.pre_unit_compra = pre_unit_compra;
}

}
