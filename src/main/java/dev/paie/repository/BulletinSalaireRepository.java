package dev.paie.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import dev.paie.entite.BulletinSalaire;
import dev.paie.entite.Cotisation;

public interface BulletinSalaireRepository extends JpaRepository<BulletinSalaire, Integer> {

}
