package dev.paie.service;

import java.util.List;
import java.util.Map;

import dev.paie.entite.BulletinSalaire;
import dev.paie.entite.Cotisation;
import dev.paie.entite.ResultatCalculRemuneration;

public interface CalculerRemunerationService {
    ResultatCalculRemuneration calculer(BulletinSalaire bulletin);
    Map<BulletinSalaire,ResultatCalculRemuneration> bulletin();
    List<Cotisation> listeCotisationImpo(BulletinSalaire bulletinSalaire);
    List<Cotisation> listeCotisationNonImpo(BulletinSalaire bulletinSalaire);
}
