package com.farmacia.entidad;

public class FacturaProveedor {
private int cod_factura, cod_prov, cod_emp;
private String fecha_em, metodo_pago;

public FacturaProveedor() {
}

public FacturaProveedor(int cod_factura, int cod_prov, int cod_emp, String fecha_em, String metodo_pago) {
	this.cod_factura = cod_factura;
	this.cod_prov = cod_prov;
	this.cod_emp = cod_emp;
	this.fecha_em = fecha_em;
	this.metodo_pago = metodo_pago;
}

public int getCod_factura() {
	return cod_factura;
}

public void setCod_factura(int cod_factura) {
	this.cod_factura = cod_factura;
}

public int getCod_prov() {
	return cod_prov;
}

public void setCod_prov(int cod_prov) {
	this.cod_prov = cod_prov;
}

public int getCod_emp() {
	return cod_emp;
}

public void setCod_emp(int cod_emp) {
	this.cod_emp = cod_emp;
}

public String getFecha_em() {
	return fecha_em;
}

public void setFecha_em(String fecha_em) {
	this.fecha_em = fecha_em;
}

public String getMetodo_pago() {
	return metodo_pago;
}

public void setMetodo_pago(String metodo_pago) {
	this.metodo_pago = metodo_pago;
}

}
