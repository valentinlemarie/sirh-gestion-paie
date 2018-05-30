package dev.paie.entite;

import java.time.LocalDate;
import java.util.List;
import java.util.TimeZone;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;


public class Collegues {
	
	String matricule;

	
	public String getMatricule() {
		return matricule;
	}
	public void setMatricule(String matricule) {
		this.matricule = matricule;
	}
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return getMatricule();
	}
}
