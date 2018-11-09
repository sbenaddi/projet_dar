package model.service;

import org.mindrot.jbcrypt.BCrypt;

public class UtilsService {
	
	/*Hashage du mot de passe */
	
   public String hash(String password) {
        return BCrypt.hashpw(password, BCrypt.gensalt(8));
    }
	
	public boolean verifyHash(String password, String hash) {
		boolean result = BCrypt.checkpw(password, hash);
		System.out.println(result);
        return result;
    }

}
	