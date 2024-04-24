package com.farmacia.entidad;

public class Proveedor {
private int cod_prov;
private String ruc_prov, nom_prov, telf_prov, dire_prov, correo_prov, web_prov;

public Proveedor() {
}

public Proveedor(int cod_prov, String ruc_prov, String nom_prov, String telf_prov, String dire_prov, String correo_prov,
		String web_prov) {
	this.cod_prov = cod_prov;
	this.ruc_prov = ruc_prov;
	this.nom_prov = nom_prov;
	this.telf_prov = telf_prov;
	this.dire_prov = dire_prov;
	this.correo_prov = correo_prov;
	this.web_prov = web_prov;
}

public int getCod_prov() {
	return cod_prov;
}

public void setCod_prov(int cod_prov) {
	this.cod_prov = cod_prov;
}

public String getRuc_prov() {
	return ruc_prov;
}

public void setRuc_prov(String ruc_prov) {
	this.ruc_prov = ruc_prov;
}

public String getNom_prov() {
	return nom_prov;
}

public void setNom_prov(String nom_prov) {
	this.nom_prov = nom_prov;
}

public String getTelf_prov() {
	return telf_prov;
}

public void setTelf_prov(String telf_prov) {
	this.telf_prov = telf_prov;
}

public String getDire_prov() {
	return dire_prov;
}

public void setDire_prov(String dire_prov) {
	this.dire_prov = dire_prov;
}

public String getCorreo_prov() {
	return correo_prov;
}

public void setCorreo_prov(String correo_prov) {
	this.correo_prov = correo_prov;
}

public String getWeb_prov() {
	return web_prov;
}

public void setWeb_prov(String web_prov) {
	this.web_prov = web_prov;
}

}
