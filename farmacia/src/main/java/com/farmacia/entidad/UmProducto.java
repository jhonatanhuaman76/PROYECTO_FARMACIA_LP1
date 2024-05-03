package com.farmacia.entidad;

public class UmProducto {
private int cod_uni, cod_pro, factor;
private String abtr_uni, des_uni;

public UmProducto() {
}

public UmProducto(int cod_uni, int cod_pro, int factor, String abtr_uni, String des_uni) {
	this.cod_uni = cod_uni;
	this.cod_pro = cod_pro;
	this.factor = factor;
	this.abtr_uni = abtr_uni;
	this.des_uni = des_uni;
}

public int getCod_uni() {
	return cod_uni;
}

public void setCod_uni(int cod_uni) {
	this.cod_uni = cod_uni;
}

public int getCod_pro() {
	return cod_pro;
}

public void setCod_pro(int cod_pro) {
	this.cod_pro = cod_pro;
}

public int getFactor() {
	return factor;
}

public void setFactor(int factor) {
	this.factor = factor;
}

public String getAbtr_uni() {
	return abtr_uni;
}

public void setAbtr_uni(String abtr_uni) {
	this.abtr_uni = abtr_uni;
}

public String getDes_uni() {
	return des_uni;
}

public void setDes_uni(String des_uni) {
	this.des_uni = des_uni;
}

}
