package dev.paie.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import dev.paie.entite.Cotisation;
import dev.paie.repository.CotisationRepository;

@RequestMapping("/api")
@RestController
public class JsonControler {
	@Autowired CotisationRepository cotisationRepository;
	
	@RequestMapping(path = "/cotisations", method = RequestMethod.GET)
	public List<Cotisation> listeCotisation() {
		return cotisationRepository.findAll();
	}
	
	@RequestMapping(path = "/cotisations/{code}", method = RequestMethod.GET)
	public ResponseEntity listeCotisationByCode(@PathVariable String code) {
		Cotisation result = cotisationRepository.findByCode(code);
		if(result == null ){
			Map<String, String> erreurs = new HashMap<>();
			erreurs.put("message", "Code de cotisations non trouvé");
			return ResponseEntity.status(HttpStatus.NOT_FOUND).body(erreurs);
		}
		return ResponseEntity.status(HttpStatus.OK).body(cotisationRepository.findByCode(code));
	}
	
	@RequestMapping(path = "/cotisations", method = RequestMethod.POST)
	public  void inserer(@RequestBody  Cotisation cotisation) {
		 cotisationRepository.save(cotisation);
	}
	
	@RequestMapping(path = "/cotisations/{code}", method = RequestMethod.PUT)
	public void putCotisationByCode(@PathVariable String code,@RequestBody Cotisation cotisation) {
		
		cotisation.setId(cotisationRepository.findByCode(code).getId());
		cotisationRepository.save(cotisation);
	}
	
	@RequestMapping(path = "/cotisations/{code}", method = RequestMethod.DELETE)
	public void deleteCotisationByCode(@PathVariable String code) {
		
		cotisationRepository.delete(cotisationRepository.findByCode(code));
	}
	
}