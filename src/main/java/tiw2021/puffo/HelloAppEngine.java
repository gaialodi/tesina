package tiw2021.puffo;

import java.io.IOException;
import java.util.List;
import java.util.Properties;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.FetchOptions;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.Query.Filter;
import com.google.appengine.api.datastore.Query.FilterOperator;
import com.google.appengine.api.datastore.Query.FilterPredicate;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;
import com.google.appengine.api.utils.SystemProperty;

@WebServlet(name = "HelloAppEngine", value = {"/helloTesina00"}) // , 
public class HelloAppEngine extends HttpServlet {
	
	String userGiusta="demo"; 
	String passGiusta="demo";

  @Override
  public void doGet(HttpServletRequest request, HttpServletResponse response)
      throws IOException {
	  
	  DATI o = new DATI();
	    o.load();
response.sendRedirect("master.jsp");
    Properties properties = System.getProperties();

    response.setContentType("text/plain");
    response.getWriter().println("Hello App Engine - Standard using "
        + SystemProperty.version.get() + " Java " + properties.get("java.specification.version"));
  }
  
  public void doPost(HttpServletRequest request, HttpServletResponse response)
	      throws IOException { 
	  	
	    //response.sendRedirect("/master.jsp");  //Questo dovrebbe essere il nostro master
	    //String ore = o.getOre(1).toString();
	  
		boolean adminDB = false;
		String userDB ="gaia";
		String passDB="pw";
		//ricevere i parametri: ho fatto una servlet con username e password
		String usernInserita = request.getParameter("username"); //metto nome del campo che cerco di intercettare
		String passwInserita = request.getParameter("password"); //metto nome del campo che cerco di intercettare
		  
		login log00 = new login();
		log00.add();
		//log00.addUser(usern, passw); //questo utente NON è un admin
	    
	  //recupero la sessione corrente
	    HttpSession oldSession = request.getSession(false);
	    if(oldSession!=null) {
	    	oldSession.invalidate(); //invalida la sessione se esiste
		}
	    HttpSession currentSession = request.getSession(); //creo nuova sessione ( di defalut fa true
		
	  	//CODICE GETADMIN dal database		
		DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
		Query q = new Query("utenti"); // voglio la query su utenti
		Filter f = new FilterPredicate("username",FilterOperator.EQUAL, usernInserita); // voglio l'username
		
		q.setFilter(f);
		PreparedQuery pq = ds.prepare(q);
		List<Entity> list = pq.asList(FetchOptions.Builder.withLimit(100));
		
		String prepQuery=pq.toString();//così posso stampare tutta la query direttamente
		
		//se nel db ho che l'uente è un admin metto admin DB == true
		//adminDB
		for (Entity result : pq.asIterable()) {
			  passDB = (String) result.getProperty("password");
			  userDB = (String) result.getProperty("username");
			  adminDB=(boolean) result.getProperty("admin");
			}
		
		currentSession.setAttribute("username", usernInserita);
		currentSession.setAttribute("usDB", userDB);
		currentSession.setAttribute("pwDB", passDB);
		currentSession.setAttribute("admDB", adminDB);
		//currentSession.setAttribute("ore", ore);
		currentSession.setMaxInactiveInterval(5*60); //max 5 min di inattività
		//DATI o = new DATI();
		  //o.();
		  //int oreTot= o.getOre(14);
		  //currentSession.setAttribute("oreTot", oreTot);
	    
		
		//GET utente che ha fatto login nella pagina
		Filter f1 = new FilterPredicate("username",FilterOperator.EQUAL, userGiusta);
		Query q1 = new Query("utenti").setFilter(f1); // voglio la query su utenti
		PreparedQuery pq1 = ds.prepare(q1);
		
		//secondo me non serve
		//List<Entity> list = pq.asList(FetchOptions.Builder.withLimit(100));
		
		for (Entity result : pq1.asIterable()) {
			  String passGiusta = (String) result.getProperty("password");
			  String userGiusto = (String) result.getProperty("Name");
			  boolean adminGiusto = (boolean) result.getProperty("admin");
		}
		
		//p = pq.toString();
		 response.getWriter().println(passGiusta);		
		 response.getWriter().println(userGiusta);
	  
		  // da riga 26 a 39 VA QUI O IN login.java??'
		  //UserService us=UserServiceFactory.getUserService();
		  //DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
		  	  
		  if(userGiusta.equals(usernInserita) && passGiusta.equals(passwInserita)) {
			  // autenticazione è andata a buon fine
			  response.sendRedirect("master.jsp");
			  //response.sendRedirect("login1.jsp");
		  }else {
			  //se l'autenticazione fallisce
			  response.sendRedirect("loginErrato.jsp");
		  }
		  	  
		 
  }
  
  
  
  

  public static String getInfo() {
    return "Version: " + System.getProperty("java.version")
          + " OS: " + System.getProperty("os.name")
          + " User: " + System.getProperty("user.name");
  }
 

  }