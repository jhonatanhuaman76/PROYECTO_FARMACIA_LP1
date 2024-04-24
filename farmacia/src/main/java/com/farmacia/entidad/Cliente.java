package com.farmacia.entidad;

public class Cliente {
private int cod_cli;
private String dni_cli, nom_cli, ape_cli;

public Cliente() {
}

public Cliente(int cod_cli, String dni_cli, String nom_cli, String ape_cli) {
	this.cod_cli = cod_cli;
	this.dni_cli = dni_cli;
	this.nom_cli = nom_cli;
	this.ape_cli = ape_cli;
}

public int getCod_cli() {
	return cod_cli;
}

public void setCod_cli(int cod_cli) {
	this.cod_cli = cod_cli;
}

public String getDni_cli() {
	return dni_cli;
}

public void setDni_cli(String dni_cli) {
	this.dni_cli = dni_cli;
}

public String getNom_cli() {
	return nom_cli;
}

public void setNom_cli(String nom_cli) {
	this.nom_cli = nom_cli;
}

public String getApe_cli() {
	return ape_cli;
}

public void setApe_cli(String ape_cli) {
	this.ape_cli = ape_cli;
}
}
