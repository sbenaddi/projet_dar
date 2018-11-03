package controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.commons.io.IOUtils;
import org.json.JSONArray;

import model.bo.Utilisateur;
import model.dao.AnnonceDao;

/**
 * Servlet implementation class Servlet_Annonce
 */
public class AnnonceServlet extends HttpServlet {

	/**
	 * Default constructor.
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);
		HttpSession session = request.getSession();
		Utilisateur user = (Utilisateur)session.getAttribute("currentUser"); 
		String email = user.getEmail();
		System.out.println(user.getEmail());

		AnnonceDao annonce = new AnnonceDao();
		String action = request.getParameter("action");
		System.out.println("je suis dans la servlet" + action);
		switch (action) {
		case "update": {
			// modifier
			Long id = Long.parseLong(request.getParameter("id"));
			String title = request.getParameter("title");
			String location = request.getParameter("location");
			String content = request.getParameter("content");

			annonce.updateAnnonce(id, content, title, location);

			RequestDispatcher dispatcher = request.getRequestDispatcher("/myannonce.jsp");
			dispatcher.forward(request, response);
			break;

		}
		case "add_annonce": {
			System.out.println("je suis dans add annonce");
			String content = request.getParameter("content");
			String title = request.getParameter("title");
			String location = request.getParameter("location");
			String categorie = request.getParameter("categorie");
			Part filePart[]=new Part[3];
			List<byte[]>photos=new <byte[]>ArrayList();
			String name[]= {"file1","file2","file3"};
			
			 InputStream fileContent=null;
			for(int i=0;i<3;i++) {
				filePart[i]= request.getPart(name[i]);
				 if(!(Paths.get(filePart[i].getSubmittedFileName()).getFileName().toString().equals(""))) {
					 fileContent= filePart[i].getInputStream();
						
					    photos.add(IOUtils.toByteArray(fileContent));	
				 }
					 
				   
				    }
			System.out.println(photos.size());
		
		   
			//System.out.println("le putain de mail"+fileName);

			annonce.addAnnonce(email, content, title, location, categorie,photos);

		
			System.out.println("add_annonce servlet" + content + " " + title + " " + location + " " + categorie);
			
		/*	response.setContentType("application/json;charset=UTF-8");
			
			JSONArray jsonArray = new JSONArray(posts);

			String jsonStr = jsonArray.toString();
			response.setHeader("Cache-Control", "no-cache");

			PrintWriter out = response.getWriter();
			out.write(jsonStr);*/
			RequestDispatcher dispatcher = request.getRequestDispatcher("/annonce.jsp");
			dispatcher.forward(request, response);
			break;

		}
		case "supprimer": {
			System.out.println("je suis dans delete");
			Long id = Long.parseLong(request.getParameter("id"));
			annonce.deleteAnnonce(id);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/annonce.jsp");
			dispatcher.forward(request, response);
			/*
			 * response.setContentType("application/json;charset=UTF-8"); List<Annonce>
			 * posts = annonce.displayAnnonce(); JSONArray jsonArray = new JSONArray(posts);
			 * 
			 * String jsonStr = jsonArray.toString(); System.out.println(jsonStr);
			 * PrintWriter out = response.getWriter(); out.println(jsonStr);
			 */
			break;

		}
		case "display_all": {

			response.setContentType("application/json;charset=UTF-8");


			List<Object> posts = annonce.displayAnnonce();
			JSONArray jsonArray = new JSONArray(posts);

			String jsonStr = jsonArray.toString();
			// System.out.println(jsonStr);
			PrintWriter out = response.getWriter();
			out.println(jsonStr);

			/*
			 * JsonConverter converter = new JsonConverter(); String output =
			 * converter.convertToJson(posts); // Assuming your json object is
			 * **jsonObject**, perform the following, it will return your json object
			 * out.print(output); out.flush(); out.print(output);
			 */
			break;

		}
		case "display_mine": {
			response.setContentType("application/json;charset=UTF-8");

			List<Object> posts = annonce.display_mine(email);
			JSONArray jsonArray = new JSONArray(posts);

			String jsonStr = jsonArray.toString();
			System.out.println(jsonStr);
			PrintWriter out = response.getWriter();
			out.println(jsonStr);

			break;
		}
		case "search_annonce":{
			
			System.out.println("je suis dans la recherche");
			String categorie = request.getParameter("by_categorie");
			String adresse = request.getParameter("by_adress");
			String word = request.getParameter("by_keyword");
			System.out.println(word+"**"+categorie+"**"+adresse);
			// email=request.getParameter("email");
			
			response.setContentType("application/json;charset=UTF-8");
			List<Object> posts = annonce.searchAnnonce(categorie,adresse,word);
			JSONArray jsonArray = new JSONArray(posts);

			String jsonStr = jsonArray.toString();
			response.setHeader("Cache-Control", "no-cache");

			PrintWriter out = response.getWriter();
			out.write(jsonStr);

			break;
		}
		default: {
			System.out.println("khraaaaaaaaa");
		}
		}
	}
	

}
