package com.farmacia.entidad;

public class Categoria {
private int num_cate;
private String nom_cate;

public Categoria() {
}

public Categoria(int num_cate, String nom_cate) {
	this.num_cate = num_cate;
	this.nom_cate = nom_cate;
}

public int getNum_cate() {
	return num_cate;
}

public void setNum_cate(int num_cate) {
	this.num_cate = num_cate;
}

public String getNom_cate() {
	return nom_cate;
}

public void setNom_cate(String nom_cate) {
	this.nom_cate = nom_cate;
}

}
