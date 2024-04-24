package com.farmacia.entidad;

public class Boleta {
private int cod_boleta, cod_cli, cod_emp;
private String metodo_pago, fecha_em;

public Boleta() {
}

public Boleta(int cod_boleta, int cod_cli, int cod_emp, String metodo_pago, String fecha_em) {
	this.cod_boleta = cod_boleta;
	this.cod_cli = cod_cli;
	this.cod_emp = cod_emp;
	this.metodo_pago = metodo_pago;
	this.fecha_em = fecha_em;
}

public int getCod_boleta() {
	return cod_boleta;
}

public void setCod_boleta(int cod_boleta) {
	this.cod_boleta = cod_boleta;
}

public int getCod_cli() {
	return cod_cli;
}

public void setCod_cli(int cod_cli) {
	this.cod_cli = cod_cli;
}

public int getCod_emp() {
	return cod_emp;
}

public void setCod_emp(int cod_emp) {
	this.cod_emp = cod_emp;
}

public String getMetodo_pago() {
	return metodo_pago;
}

public void setMetodo_pago(String metodo_pago) {
	this.metodo_pago = metodo_pago;
}

public String getFecha_em() {
	return fecha_em;
}

public void setFecha_em(String fecha_em) {
	this.fecha_em = fecha_em;
}

}
