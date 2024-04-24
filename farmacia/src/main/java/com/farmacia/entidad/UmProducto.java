package com.farmacia.entidad;

public class UmProducto {
private int cod_uni, cod_pro, factor;

public UmProducto() {
}

public UmProducto(int cod_uni, int cod_pro, int factor) {
	this.cod_uni = cod_uni;
	this.cod_pro = cod_pro;
	this.factor = factor;
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

}
