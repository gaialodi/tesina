package Tiw2021.Tesina00;

import java.io.BufferedReader;
import java.io.FileReader;
import java.util.List;
import java.io.IOException;
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



public class DATI
{
  private UserService us;
  private DatastoreService ds;

  //public DATI()
 // {
   // us=UserServiceFactory.getUserService();
    //ds=DatastoreServiceFactory.getDatastoreService();

  //}
  public static void main(String[] args) {
		load();
	}

  public static void load(){
try{
   BufferedReader br = new BufferedReader(new FileReader("WEB-INF/Dati_Progetto_Unimore.csv"));
   String line;
   br.readLine(); //salta un RIGA nel file
   br.readLine(); //salta un RIGA nel file
   int i=0;
   while((line=br.readLine())!=null)
   {
	   String[] e=line.split(";");
	   String AS=e[0].trim();
	   String Scuola=e[1].trim();
	   String Comune=e[2].trim();
	   String Grado=e[4].trim();
	   String Titolo_Progetto=e[5].trim();
	   String Periodo=e[6]+"a"+e[7].trim();
	   String Formatore=e[8].trim();
	   String numero_ore=e[9].trim();
	   String numero_studenti_coinvolti=e[10].trim();
	   String età_partecipanti=e[11]+"a"+e[12].trim();
	   String Parola_chiave=e[13].trim();
	   
	   System.out.println(numero_ore);
	   
	  /* Entity x=new Entity("eventi",Titolo_Progetto);
	   x.setProperty("codice", i);
	   x.setProperty("AS",AS);
	   x.setProperty("Scuola",Scuola);
	   x.setProperty("Comune",Comune);
	   x.setProperty("Grado",Grado);
	   x.setProperty("Titolo_Progetto",Titolo_Progetto);
	   x.setProperty("Periodo",Periodo);
	   x.setProperty("Formatore",Formatore);
	   x.setProperty("numero_ore",numero_ore);
	   x.setProperty("numero_studenti_coinvolti",numero_studenti_coinvolti);
	   x.setProperty("età_partecipanti",età_partecipanti);
	   x.setProperty("Parola_chiave",Parola_chiave);
	   
	   //ds.put(x);*/
	   i++;
   }
   br.close();
   
   }catch(Exception e)
 {
	 e.printStackTrace();
 }
 }
  
  //query per prendere i dati dal datastore
  
  /*public Integer getOre(Integer i) {
	  Integer n_ore=0;
	  int oreEvento=0;
	   ds = DatastoreServiceFactory.getDatastoreService();
	   Filter f = new FilterPredicate("codice",FilterOperator.EQUAL, i);
	   Query q= new Query ("eventi");
	   q.setFilter(f);
	  
	   PreparedQuery pq = ds.prepare(q);
	   List<Entity> list = pq.asList(FetchOptions.Builder.withLimit(100));
	   
	   for (Entity e: list) {
			  oreEvento = (int) e.getProperty("numero_ore");
			  n_ore+=oreEvento;
			  System.out.println(oreEvento);
		}
	  
	   return n_ore;
	   
	   
	  for(int j=0; j<i; j++) {
		  int oreEvento=0;
		   ds = DatastoreServiceFactory.getDatastoreService();
		   Filter f = new FilterPredicate("codice",FilterOperator.EQUAL, j);
		   Query q= new Query ("eventi");
		   q.setFilter(f);
		  
		   PreparedQuery pq = ds.prepare(q);
		   List<Entity> list = pq.asList(FetchOptions.Builder.withLimit(100));
		   for (Entity result : pq.asIterable()) {
				  oreEvento = (int) result.getProperty("numero_ore");
			}
		   n_ore+=oreEvento;
		   System.out.println(oreEvento);
	  }
	return n_ore;*/
	   
  }
