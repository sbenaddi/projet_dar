package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bo.Utilisateur;
import model.dao.UtilisateurDao;
import model.service.UtilsService;

public class LoginServlet extends HttpServlet {
	public static final String CHAMP_PASSWORD = "password";
	public static final String CHAMP_EMAIL = "email";
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private UtilsService utilsService = new UtilsService();

	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		System.out.println("!!!!!!!!!!!!! init Servlet Login");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("GET LoginServlet");
		request.setAttribute(CHAMP_EMAIL, "email");
		request.setAttribute("name", utilsService.hash("souka"));

		RequestDispatcher dispatcher = request.getRequestDispatcher("/test.jsp");
		dispatcher.forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String action = request.getParameter("action");
		HttpSession session = request.getSession();
		if("logOut".equals(action)) {
			session.setAttribute("currentUser", null);
		}else {
			UtilisateurDao utildao = new UtilisateurDao();
			Utilisateur user = utildao.getUserByUserId(email);
			if(user != null && utilsService.verifyHash(password, user.getPassword())) {
				session.setAttribute("currentUser", user);
				request.setAttribute(CHAMP_EMAIL, email);
				request.setAttribute("name", user.getName());
				request.setAttribute("id", user.getId());
				request.setAttribute("user", user);
				RequestDispatcher dispatcher = request.getRequestDispatcher("/test.jsp");
				dispatcher.forward(request, response);
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher("/erreur.jsp");
				dispatcher.forward(request, response);
			}
		}
	}

}