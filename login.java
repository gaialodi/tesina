package Tiw2021.Tesina00;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.EntityNotFoundException;
import com.google.appengine.api.datastore.FetchOptions;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.Query.CompositeFilter;
import com.google.appengine.api.datastore.Query.CompositeFilterOperator;
import com.google.appengine.api.datastore.Query.Filter;
import com.google.appengine.api.datastore.Query.FilterOperator;
import com.google.appengine.api.datastore.Query.FilterPredicate;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

public class login {
	
	HashMap <String, String> login = new HashMap<String, String>();
	
	private UserService us;
	private DatastoreService ds;
	
	
	
	public login() {
	us = UserServiceFactory.getUserService();
	ds = DatastoreServiceFactory.getDatastoreService();
	}
	
	public void add() {
		String username = "gaia";
		String psw = "password";
		Entity e = new Entity("utenti", username); //la tabella si chiama utenti e la chiave è l'username
		e.setProperty("username", username);
		e.setProperty("password", psw); // aggiungo la proprietà (colonna?)
		e.setProperty("admin", true); //Gaia è admin
		ds.put(e);
	}
	
	public String getPw() {
		String u = us.getCurrentUser().getNickname();
		String p="";
		
		DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
		
		Filter f = new FilterPredicate("username",FilterOperator.EQUAL, u); // voglio la password dell'utente che ha fatto il login in questo momento
		Query q = new Query("utenti").setFilter(f); // voglio la query su utenti
		PreparedQuery pq = ds.prepare(q);
		
		//secondo me non serve
		//List<Entity> list = pq.asList(FetchOptions.Builder.withLimit(100));
		
		for (Entity result : pq.asIterable()) {
			  p = (String) result.getProperty("password");
			  u = (String) result.getProperty("Name");
			  System.out.println("Username: "+u+"Password: "+p);
			}
		
		
		//p = pq.toString();
		return p;
	}
	
	//lo username è getNickname oppure è username?
	public String getUs() {		
		String u = us.getCurrentUser().getNickname();
		
		DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
		Query q = new Query("utenti"); // voglio la query su utenti
		Filter f = new FilterPredicate("Name",FilterOperator.EQUAL, u); // voglio l'username
		
		
		q.setFilter(f);
		PreparedQuery pq = ds.prepare(q);
		
		//List<Entity> list = pq.asList(FetchOptions.Builder.withLimit(100));
		
		u=pq.toString();
		return u;
	}
	
	//BASTA isUserAdmin o serve anche questo mdetodo?????
	public boolean getAdmin() {
		//se utente è admin deve ritornare true altrimenti false
		
		boolean adminFunction = us.isUserAdmin(); //QUESTA SERVE???????
		boolean adminDB = false;
		
		String u = us.getCurrentUser().getNickname();
		
		DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
		Query q = new Query("utenti"); // voglio la query su utenti
		Filter f = new FilterPredicate("username",FilterOperator.EQUAL, u); // voglio l'username
		
		q.setFilter(f);
		PreparedQuery pq = ds.prepare(q);
		List<Entity> list = pq.asList(FetchOptions.Builder.withLimit(100));
		
		String adm=pq.toString();
		
		if(adm =="true") {
			adminDB=true;
		}else {
			adminDB = false;
		}
		
		
		//se nel db ho che l'uente è un admin metto admin DB == true
		//adminDB
		if (adminFunction == true && adminDB == true) {
			return true;
		}
		else {
			return false;
		}
	
	}
	
	
	//forse non serve
	public String getLoginUrl(String username, String password) throws EntityNotFoundException { //metodo per fare login
		
		//voglio prendere l'elemento con un dato username ma io NON so la password!
		if(ds != null) { //ds.get(username) != null && password==ds.get(username).toString()
			//probabilmente lo devo inviare a master.jsp e non a master.html
			if(us.isUserLoggedIn()) {
				return us.createLoginURL("/master.jsp");
			}
			return null;
		}else {
			return null;
		}
	}	
	
	//VA QUI O IN HelloAppEngine????????????
	/*public void addUser(String username, String psw) { //aggiungo url con questo metodo, ma io voglio aggiungere gli USERS
		//controllo così o con query?
		if(us.isUserLoggedIn() && us.isUserAdmin()) {
			
			Entity e = new Entity("utenti", username); //la tabella si chiama.... e la chiave è l'username
			e.setProperty("password", psw); // aggiungo la proprietà (colonna?)
			e.setProperty("admin", false); //user NON è un admin
			ds.put(e);
		}
		
	}*/
	
	public String list() { // estrae tutte le proprietà della tabella(tutti gli url)FORSE NON SERVE! perchè non voglio vedere i dati di tutti gli users!
		if(us.isUserLoggedIn() ) { //qui potrei aggiungere && us.isUserAdmin()
			Query q = new Query(us.getCurrentUser().getUserId());
			PreparedQuery pq = ds.prepare(q);
			List<Entity> list = pq.asList(FetchOptions.Builder.withLimit(1000));
			StringBuffer sb = new StringBuffer();
			for (Entity e:list) {
				sb.append("<p>");
				sb.append(us.getCurrentUser());
				sb.append(e.getProperty("passwords"));
				sb.append("</p>");
				
			}
			 
		}
		return null;//oppure potrei ritornare sb.toString()
	}
	
	public String getUser() {
		if(us.isUserLoggedIn()) {
			return us.getCurrentUser().getNickname();
		}else {
			return null;
		}
	}
	
	
	
	/*boolean log(String username, String password) {
		login.put("gaia.lodi", "pw1");
		login.put("andrea.pergreffi", "pw2");
		
		if(login.containsKey(username)) {
			String pw= login.get(username);
			if(password==pw) {
				return true;
			}else {
				return false;
			}
		} else return false;*/
		
	
	
	

}
