package com.farmacia.entidad;

public class UnidadMedida {
private int cod_uni;
private String abtr_uni, des_uni;

public UnidadMedida() {
}

public UnidadMedida(int cod_uni, String abtr_uni, String des_uni) {
	this.cod_uni = cod_uni;
	this.abtr_uni = abtr_uni;
	this.des_uni = des_uni;
}

public int getCod_uni() {
	return cod_uni;
}

public void setCod_uni(int cod_uni) {
	this.cod_uni = cod_uni;
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
