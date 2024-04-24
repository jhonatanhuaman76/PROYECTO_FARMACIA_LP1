package com.farmacia.entidad;

public class Lote {
private int nro_lote, cod_pro, stock;
private String fecha_venc, fecha_fab, cond_trans;

public Lote() {
}

public Lote(int nro_lote, int cod_pro, int stock, String fecha_venc, String fecha_fab, String cond_trans) {
	this.nro_lote = nro_lote;
	this.cod_pro = cod_pro;
	this.stock = stock;
	this.fecha_venc = fecha_venc;
	this.fecha_fab = fecha_fab;
	this.cond_trans = cond_trans;
}

public int getNro_lote() {
	return nro_lote;
}

public void setNro_lote(int nro_lote) {
	this.nro_lote = nro_lote;
}

public int getCod_pro() {
	return cod_pro;
}

public void setCod_pro(int cod_pro) {
	this.cod_pro = cod_pro;
}

public int getStock() {
	return stock;
}

public void setStock(int stock) {
	this.stock = stock;
}

public String getFecha_venc() {
	return fecha_venc;
}

public void setFecha_venc(String fecha_venc) {
	this.fecha_venc = fecha_venc;
}

public String getFecha_fab() {
	return fecha_fab;
}

public void setFecha_fab(String fecha_fab) {
	this.fecha_fab = fecha_fab;
}

public String getCond_trans() {
	return cond_trans;
}

public void setCond_trans(String cond_trans) {
	this.cond_trans = cond_trans;
}

}
