package dev.paie.web.controller;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.ZonedDateTime;
import java.util.TimeZone;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mysql.fabric.xmlrpc.Client;

import dev.paie.entite.BulletinSalaire;
import dev.paie.entite.RemunerationEmploye;
import dev.paie.repository.BulletinSalaireRepository;
import dev.paie.repository.EntrepriseRepository;
import dev.paie.repository.GradeRepository;
import dev.paie.repository.PeriodeRepository;
import dev.paie.repository.ProfilRemunerationRepository;
import dev.paie.repository.RemunerationEmployeRepository;
import dev.paie.service.CalculerRemunerationService;
import dev.paie.service.CalculerRemunerationServiceSimple;

@Controller
@RequestMapping("/bulletin")
public class BulletinSalaireController {

	@Autowired
	PeriodeRepository periodeRepository;
	@Autowired
	EntrepriseRepository entrepriseRepository;
	@Autowired
	RemunerationEmployeRepository remunerationEmployeRepository;
	
	
	// Service de calcul des valeurs salaire
	 @Autowired 
	 private CalculerRemunerationService remunerationService ;
	
	@Autowired
	BulletinSalaireRepository bulletinSalaireRepository;

	@RequestMapping(method = RequestMethod.GET, path = "/lister")
	public String setupFormList(Model model) {
		// Liaison du modèle et de l'objet.
		model.addAttribute("calcul",remunerationService.bulletin());
		// Renvoi du nom logique de la vue formulaire.
		return "bulletin/listerBulletin";
	}

	@RequestMapping(path = "/lister/{id}", method = RequestMethod.GET)
    public String bulletin(@PathVariable String id, Model model) {	
		BulletinSalaire bulletin = bulletinSalaireRepository.findOne(Integer.parseInt(id));
		BigDecimal travail = bulletin.getRemunerationEmploye().getGrade().getTauxBase();
		BigDecimal jour = bulletin.getRemunerationEmploye().getGrade().getNbHeuresBase();
		BigDecimal paye = travail.multiply(jour);
		model.addAttribute("bulletinFiche",bulletin);
		model.addAttribute("calcul",remunerationService.calculer(bulletin));
		model.addAttribute("cotisationNonImpo",remunerationService.listeCotisationNonImpo(bulletin));
		model.addAttribute("cotisationImpo",remunerationService.listeCotisationImpo(bulletin));
		model.addAttribute("base", bulletin.getPrimeExceptionnelle().add(paye));
		model.addAttribute("paye",paye);
		return "bulletin/bulletin";
    }
	
	@RequestMapping(method = RequestMethod.GET, path = "/creer")
	public String setupForm(Model model) {
		// Liaison du modèle et de l'objet.
		model.addAttribute("bulletin", new BulletinSalaire());
		model.addAttribute("periodeList", periodeRepository.findAll());
		model.addAttribute("remuneration", remunerationEmployeRepository.findAll());

		// Renvoi du nom logique de la vue formulaire.
		return "bulletin/creerBulletin";
	}

	@RequestMapping(method = RequestMethod.POST, path = "/creer")
	public String submitForm(@ModelAttribute("bulletin") BulletinSalaire salaire) {
		salaire.setDateCreation(ZonedDateTime.now());
		bulletinSalaireRepository.save(salaire);
		return "redirect:/mvc/bulletin/lister";
	}
}
