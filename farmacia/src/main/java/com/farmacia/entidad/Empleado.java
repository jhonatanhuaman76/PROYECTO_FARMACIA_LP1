package com.farmacia.entidad;

public class Empleado {
private int cod_emp;
private String dni_emp, nom_emp, ape_emp, telf_emp, correo_emp, dire_emp, tipo_usu, nom_usu, pas_usu;

public Empleado() {
}

public Empleado(int cod_emp, String dni_emp, String nom_emp, String ape_emp, String telf_emp, String correo_emp,
		String dire_emp, String tipo_usu, String nom_usu, String pas_usu) {
	this.cod_emp = cod_emp;
	this.dni_emp = dni_emp;
	this.nom_emp = nom_emp;
	this.ape_emp = ape_emp;
	this.telf_emp = telf_emp;
	this.correo_emp = correo_emp;
	this.dire_emp = dire_emp;
	this.tipo_usu = tipo_usu;
	this.nom_usu = nom_usu;
	this.pas_usu = pas_usu;
}

public int getCod_emp() {
	return cod_emp;
}

public void setCod_emp(int cod_emp) {
	this.cod_emp = cod_emp;
}

public String getDni_emp() {
	return dni_emp;
}

public void setDni_emp(String dni_emp) {
	this.dni_emp = dni_emp;
}

public String getNom_emp() {
	return nom_emp;
}

public void setNom_emp(String nom_emp) {
	this.nom_emp = nom_emp;
}

public String getApe_emp() {
	return ape_emp;
}

public void setApe_emp(String ape_emp) {
	this.ape_emp = ape_emp;
}

public String getTelf_emp() {
	return telf_emp;
}

public void setTelf_emp(String telf_emp) {
	this.telf_emp = telf_emp;
}

public String getCorreo_emp() {
	return correo_emp;
}

public void setCorreo_emp(String correo_emp) {
	this.correo_emp = correo_emp;
}

public String getDire_emp() {
	return dire_emp;
}

public void setDire_emp(String dire_emp) {
	this.dire_emp = dire_emp;
}

public String getTipo_usu() {
	return tipo_usu;
}

public void setTipo_usu(String tipo_usu) {
	this.tipo_usu = tipo_usu;
}

public String getNom_usu() {
	return nom_usu;
}

public void setNom_usu(String nom_usu) {
	this.nom_usu = nom_usu;
}

public String getPas_usu() {
	return pas_usu;
}

public void setPas_usu(String pas_usu) {
	this.pas_usu = pas_usu;
}

}
