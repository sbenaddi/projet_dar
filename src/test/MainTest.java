package test;

import org.junit.FixMethodOrder;
import org.junit.runners.MethodSorters;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

import model.bo.Utilisateur;
import model.dao.UtilisateurDao;
import model.service.UtilsService;

/**
 * 
 */

/**
 * @author Admin
 *
 */
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class MainTest {
	
	private UtilsService utilsService = new UtilsService();
	private UtilisateurDao userDao = new UtilisateurDao();

	/* Initialisation des donnes*/
	
	private String name = "Admin";
	private String email = "admin@yopmail.com";
	private String password = "12345";
	private String hashpassword = null;
	private String about = "Le langage Java reprend en grande partie la syntaxe du langage C++. Néanmoins, Java a été épuré des concepts les plus subtils du C++ et à la fois les plus déroutants";
	private String interest = "Le langage Java reprend en grande partie la syntaxe du langage C++";
	private String occupation = "Java reprend en grande";
	private String numberphone = "06 19 06 06 06";

	@Test
	public void test01HashPassword() {
		
		/* Test de la methode du hashage*/
		
		hashpassword = utilsService.hash(password);
		assertNotNull(hashpassword);
	}
	
	@Test
	public void test02SaveUser() {
		
		/*Test de la methode pour enregistrer un utilisateur */
		
		Utilisateur utilisateur = new Utilisateur();
		utilisateur.setName(name);
		utilisateur.setEmail(email);
		utilisateur.setPassword(utilsService.hash(password));
		utilisateur.setAbout(about);
		utilisateur.setInterest(interest);
		utilisateur.setOccupation(occupation);
		utilisateur.setNumberphone(numberphone);
		boolean result = userDao.saveUser(utilisateur);
		assertTrue(result);
	}

	@Test
	public void test03GetUserByUserId() {
		
		/* Test de filtrage d'utilisateur DAO*/
		
		Utilisateur utilisateur = userDao.getUserByUserId(email);
		assertEquals(email,utilisateur.getEmail());
	}
	

}
