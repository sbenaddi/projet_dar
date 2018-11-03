package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bo.Comment;
import model.bo.Utilisateur;
import model.dao.CommentDao;
import model.dao.UtilisateurDao;

/**
 * Servlet implementation class CommentServlet
 */

public class CommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private RequestDispatcher jsp;

	public static final String CHAMP_NAME = "name";
	public static final String CHAMP_DESCRIPTION = "description";
	public static final String CHAMP_MARK = "mark";

	public CommentServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/*
	 * public void init(ServletConfig config) throws ServletException { // TODO
	 * Auto-generated method stub
	 * System.out.println("!!!!!!!!!!!!! init Servlet comment"); ServletContext
	 * context = config.getServletContext(); jsp =
	 * context.getRequestDispatcher("/WEB-INF/jsp/accueil.jsp"); }
	 */
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		CommentDao commentDao = new CommentDao();
		List<Comment> comments = commentDao.find();
		request.setAttribute("listeComments", comments);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/index1.jsp");
		dispatcher.forward(request, response);
		/*Comment comment = CommentDao.find(request.getParameter("name"),request.getParameter("description"));
        request.setAttribute("comment", comment); 
        request.getRequestDispatcher("/WEB-INF/accueil.jsp").forward(request, response);
	*/
		}
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		System.out.println("!!!!!!!!!!!!! init Servlet Comment");
		ServletContext context = config.getServletContext();
		jsp = context.getRequestDispatcher("/WEB-INF/jsp/test.jsp");
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action =request.getParameter("action");
       if("searchusername".equals(action)) {
    	   System.out.println("test");
    	   HttpSession session = request.getSession();
   		   Utilisateur user = (Utilisateur) session.getAttribute("currentUser");
   		response.setContentType("text/plain charset=utf-8");
   		PrintWriter out = response.getWriter();
   		
   		out.println(user.getName());
       }
	
       else {
    		String name = request.getParameter(CHAMP_NAME);
    		String description = request.getParameter(CHAMP_DESCRIPTION);
    		Integer mark = Integer.parseInt(request.getParameter(CHAMP_MARK));

    		CommentDao commentDao = new CommentDao();
    		commentDao.saveDetails(name, description, mark);
    		request.setAttribute(CHAMP_NAME, name);
    		 
       
	     /*
	     if(comment == null) {
	    	 RequestDispatcher dispatcher = request.getRequestDispatcher("/hello.jsp");
	    	 dispatcher.forward(request, response);
	     }else {
	    	 request.setAttribute("name", comment.getName()); 
	    	 request.setAttribute("description",comment.getDescription());

	    	 RequestDispatcher dispatcher = request.getRequestDispatcher("/accueil.jsp");
	 		dispatcher.forward(request, response);
	     }*/
		
		request.setAttribute(CHAMP_DESCRIPTION, description);
		request.setAttribute(CHAMP_MARK, mark);
		request.setAttribute(CHAMP_NAME,name); 
      
		RequestDispatcher dispatcher = request.getRequestDispatcher("/tellus.jsp");
		dispatcher.forward(request, response);
       }
	}			
	protected void doPut(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doDelete(HttpServletRequest, HttpServletResponse)
	 */
	protected void doDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
	}
}
