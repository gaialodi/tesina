<html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Tiw2021.Tesina00.HelloAppEngine" %>
<%@ page import ="java.util.*" %>
<%@ page import= "com.google.appengine.api.users.*" %>
<%@ page import="Tiw2021.Tesina00.*" %>
<%@ page import="Tiw2021.Tesina00.login" %>
<%@ page import="Tiw2021.Tesina00.DATI" %>

	
<head>
<title>Prefettura e adolescenza</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@200;300;400&display=swap" rel="stylesheet">
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css" />
<link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css"
   integrity="sha512-xodZBNTC5n17Xt2atTPuE1HxjVMSvLVW9ocqUKLsCC5CXdbqCmblAshOMAS6/keqq/sMZMZ19scR4PsZChSR7A=="
   crossorigin=""/>
<script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js"
   integrity="sha512-XQoYMqMTK8LvdxXYG3nZ448hOEQiglfqkJs1NOQV44cWnUrBc8PkAOcXy20w0vlaXaVUearIOBhiXZ5V3ynxwA=="
   crossorigin=""></script>

<!-- #log modifica la barra di login
.navbar modifica la barra di navigazione (in alto)
.body modifica tutto quello che c'è sotto alla barra di navigazione -->
	
<style>

.navbar-brand {
	cursor: pointer;
}

.navbar {
  padding-top: 15px;
  padding-bottom: 15px;
  border: 0;
  border-radius: 0;
  margin-bottom: 0;
  font: montserrat;
  font-size: 12px;
  letter-spacing: 5px;
  background-color: #00326E;
  color: white;
  }


.body{
background-color:MistyRose;
margin-right:2px solid;
padding-right:2px solid;
}

.tbn{
border-right:1px solid !important;
}

.counter_wrapper,
.counter_wrapper_below {
  display: -webkit-box;
  display: -ms-flexbox;
  display: -webkit-flex;
  display: flex;
  flex-direction: row;
  -webkit-box-pack: center;
  -ms-flex-pack: center;
  -webkit-justify-content: center;
  justify-content: center;
  -webkit-box-align: center;
  -ms-flex-align: center;
  -webkit-align-items: center;
  align-items: center;
  width: 100%;
  margin: auto;
}

.counter_wrapper_below {
  width: 680px;
  height: 190px;
  margin-top: 10px;
  margin-bottom: 10px;
}

.col_1,
.col_2,
.col_3,
.col_4,
.col_5_top,
.col_6_top,
.col_7_top {
  width: 14%;
  text-align: center;
  background-color:MistyRose;
  vertical-align: top;
}

.col_5,
.col_6,
.col_7 {
  width: 33%;
  text-align: center;
  background-color: #f7f6f2;
  vertical-align: top;
}

.filetto_verticale_top {
  border-right: 1px solid rgba(31, 34, 38, 0.5);
}

.filetto_verticale_top_dotted {
  border-right: 1px dotted rgba(31, 34, 38, 0.5);
}

hr.filetto_verticale {
  border-top: 1px solid rgba(31, 34, 38, 0.5);
  height: 100px;
}

#num_1,
#variazione_1,
#total_1 {
  color: #f38384;
}

#num_3,
#variazione_3,
#total_3 {
  color: #19b290;
font-size: 20px;
}

#num_4,
#variazione_4,
#total_4 {
  color: #ef4e63;
}

#num_5_top,
#variazione_5_top,
#total_5_top {
  color: #f38384;
}

#num_6_top,
#variazione_6_top,
#total_6_top {
  color: #f38384;
}

#num_7_top,
#variazione_7_top,
#total_7_top {
  color: #f38384;
}

#num_5_top,
#num_6_top,
#num_7_top {
  font-weight: 400;
}

#num_5,
#variazione_5,
#total_5 {
  color: #ef4e63;
}

#num_6,
#variazione_6,
#total_6 {
  color: #aa0438;
}

#num_7,
#variazione_7,
#total_7 {
  color: #f38384;
}

.timer {
  font-family: "SoleSans", Arial, Helvetica, sans-serif;
  font-weight: 800;
  font-style: normal;
  line-height: 0.8;
  letter-spacing: normal;
  color: rgba(15, 15, 15, 0.8);
  margin: 15px 0;
  font-size: 25px;
}

.timer_below {
  font-family: "SoleSans", Arial, Helvetica, sans-serif;
  font-weight: 800;
  font-style: normal;
  line-height: 0.8;
  letter-spacing: normal;
  color: rgba(15, 15, 15, 0.8);
  margin: 15px 0;
  font-size: 50px;
}

.count-text {
  font-family: "SoleSans", Arial, Helvetica, sans-serif;
  font-weight: 400;
  font-stretch: normal;
  font-style: normal;
  letter-spacing: normal;
  color: rgba(15, 15, 15, 0.8);
  margin: 0px;
  font-size: 14px;
}

.count-text_var {
  font-family: "SoleSans", Arial, Helvetica, sans-serif;
  font-weight: 400;
  font-stretch: normal;
  font-style: normal;
  line-height: 1.1;
  letter-spacing: normal;
  color: rgba(15, 15, 15, 0.8);
  margin: 0px;
  font-size: 16px;
  margin-bottom: 15px;
}

.count-text_total {
  font-family: "SoleSans", Arial, Helvetica, sans-serif;
  font-weight: 600;
  font-stretch: normal;
  font-style: normal;
  line-height: 1.1;
  letter-spacing: normal;
  color: rgba(15, 15, 15, 0.8);
  margin: 0px;
  font-size: 16px;
}

</style>

<!-- GRAFICO -->
<script type="text/javascript">

		//Diagramma per vedere gli ANNI e quanti eventi ogni anno
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawVisualization);
      let data=localStorage.getItem("Eventi_letti")
      //for(let i=0;i<data.length;i++)
    	 // {
    	 // document.write(data[i].Scuola)
    	 // }

      function drawVisualization() {
        // Some raw data (not necessarily accurate)
        var data = google.visualization.arrayToDataTable([
          ['Year', 'Bolivia', 'Ecuador', 'Madagascar', 'Papua New Guinea', 'Rwanda', 'Average'],
          ['2004/05',  165,      938,         522,             998,           450,      614.6],
          ['2005/06',  135,      1120,        599,             1268,          288,      682],
          ['2006/07',  157,      1167,        587,             807,           397,      623],
          ['2007/08',  139,      1110,        615,             968,           215,      609.4],
          ['2008/09',  136,      691,         629,             1026,          366,      569.6]
        ]);

        var options = {
          title : 'Monthly Coffee Production by Country',
          vAxis: {title: 'Quantity'},
          hAxis: {title: 'Year'},
          seriesType: 'bars',
          series: {5: {type: 'line'}},
          chartArea:{left:20,right:20,top:0,width:'50%',height:'75%'}
        };

        var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
       
        chart.draw(data, options);
      }
      
    </script>

<script>

//funzione di login
	
	//localStorage.setItem("Username","Marco")
	//localStorage.setItem("Password","1234")

	//Admin=(localStorage.getItem("Username"))
	//Pw=(localStorage.getItem("Password"))

	//var access=false
	
	function hide(){
	$(document).ready(function(){
		$("#log").css("visibility","hidden")
		//$("#log").hide()
	})
	}
	
	function check(){
		x=document.getElementById("User").value
		   y=document.getElementById("Password").value
		    if(x==Admin||y==Pw)
		    {
			   console.log("Login successful")
		       access=true
		    }
		$(document).ready(function(){
			$("#log").css("visibility","hidden")
			//$("#log").show()
		})
	}
	
	var lat=44.7007475271964;
	var long=10.633781921287271;
	
	function mappa(){
		var map = new L.map('map').setView([44.7007, 10.6337], 13);

		L.tileLayer('https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}', {
		    attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
		    maxZoom: 18,
		    id: 'mapbox/streets-v11',
		    tileSize: 512,
		    zoomOffset: -1,
		    accessToken: 'your.mapbox.access.token'
		}).addTo(map);

		L.marker([lat, long]).addTo(map)
		    .bindPopup('Istituto ScaruffiLeviTricolore.<br>Tutti i tuoi eventi sono qui')
		    .openPopup();
		
	}

</script>

</head>

<body style="background-color:MistyRose;">
<body>
	<%
	//login login0 = new login(); 
	//String user = login0.getUs(); //quello che metto nel form in login0
	//String pw =login0.getPw();
	//user = request.getParameter("username");
	// pw = request.getParameter("password");
	//if(user != null){ //qui dovrei controllare la password ma come si faaaaaaaa
	String user=(String)session.getAttribute("username");
	String usDB=(String)session.getAttribute("usDB");
	String pwDB=(String)session.getAttribute("pwDB");
	boolean adminDB=(boolean)session.getAttribute("admDB");
	String queryPrep = (String) session.getAttribute("prepQuery"); // così prendo la query che ho preparato trasformata in una stringa
	DATI d = new DATI();;
	String ore = request.getParameter("2018/2019");
	//ore=request.getParameter(name)
	%>
	
	<div id="main">
	<input id="picker" type="file">
	<script src="LETTURA_CODICE.js" ></script>

	<nav class="navbar navbar-inverse navbar-default">
  	<div class="container">
   	 <div class="navbar-header ">
   	 </div>
   	 <ul class="nav navbar-nav navbar-left">
   	   <li><a href="#">Home</a></li>
 	 </ul>
    	 <ul class="nav navbar-nav navbar-right text-gray">
      		<li><a href="#Dati">DATI</a></li>
      		<li><a href="#Grafici">GRAFICI</a></li>
    		<li><a href="#Eventi">EVENTI</a></li>
      		<li><a href="#Map">MAPPA</a></li>
    	</ul>
  	</div>
	</nav>
	
	<h6>Stringa che esce dalla query: name:<%=usDB%> pw:<%=pwDB%> admin:<%=adminDB%></h6>
	<h6>Query convertita in stringa: <%=queryPrep %></h6>
	<h6>username inserito:<%=user%>
	COSA STAMPA???: <%=d.getOre(ore)%></h6>
	
	<div class="container-fluid text-center">
	<p> <font size="10"> <FONT COLOR="#ff1a1a"> <font face=Arial> <h3> BENVENUTO <%=user%> NELLA PAGINA DELLA PREFETTURA! </h3> </font>  </FONT> </FONT>  </p>
	<img src="stemmareggio.jpeg"  width="200" height="200">
	<p><FONT COLOR="#ff1a1a">Se sei un utente registrato puoi fare il login cliccando il pulsante in alto a sinistra per inserire o consultare dati sugli eventi nella provincia di Reggio Emilia</p>
		<p>Qui puoi inserire o consultare dati sugli eventi nella provincia di Reggio Emilia</p>
		<%if(adminDB==true){ %>
		<p>per aggiungere un utente vai in fondo alla pagina</p>
		<%}%>
	</div>

<article id="Dati">
<div class="container-fluid text-center" >
<p><font size="6"> <FONT COLOR=" #000080"> <font face="Arial"><h3>DATI RACCOLTI</h3></font></font></font></p>
<FONT COLOR="  #000080">

<!-- CONTATORE -->
	<div class="counter_wrapper">
		<div class="counter col_4 filetto_verticale_top">
			<p class="count-text" id="count_text_4">EVENTI<br>SVOLTI
			</p>
			<h2 class="timer count-number" id="num_4"><span id="contatore_eventi" ></span></h2>
			
		</div>

		<div class="counter col_2 filetto_verticale_top">
			<p class="count-text" id="count_text_2">STUDENTI<br>PARTECIPANTI<br></p>
			<h2 class="timer count-number" id="num_2"><span id="numero_studenti" ></span></h2>
			</p>
		</div>

		<div class="counter col_3 filetto_verticale_top">
			<p class="count-text" id="count_text_3">SCUOLA<br>VIRTUOSA<br></p>
			<h2 class="timer count-number" id="num_3"><span id="scuola" ></span></h2>
		</div>

		<div class="counter col_1 filetto_verticale_top_dotted">
			<p class="count-text" id="count_text_1">TEMA<br>PRINCIPALE
			</p>
			<h2 class="timer count-number" id="num_1"><span id="tema_trattato" ></span></h2>
		</div>

		<div class="counter col_6_top filetto_verticale_top_dotted">
			<p class="count-text" id="count_text_6_top">ORE<br>SVOLTE</p>
			<h2 class="timer count-number" id="num_6_top"><span id="ore" ></span></h2>
		</div>
	</div>
	<!-- FINE A CONTATORE -->

<br>
</div>
<br>
</article>


<article id="Grafici">
<div class="container-fluid text-center">
<p><font size="6"> <FONT COLOR=" #000080"> <font face="Arial"><h3>CHARTS</h3></font></font></font></p>
<div class="row">
	<div id="tbn" class="col-sm-12 textcenter">	 	
		<div id="chart_div" style="width: 1000px; height: 500px; "></div>
	</div>
</div>
</article>


</div>

<article id="Eventi">
<div class="container-fluid text-center" style=" height: 200px;">
<p><font size="6"> <FONT COLOR=" #000080"> <font face="Arial"><h3>EVENTI</h3></font></font></font></p>
</div>
</article>


<article id="Map">

	<div class="container-fluid text-center">
	<p><font size="6"> <FONT COLOR=" #000080"> <font face="Arial"><h3>MAPPA</h3></font></font></font></p>

		<button onclick="mappa()">Visualizza la mappa</button>
		<div id="map" style="position: relative; top: 0; left: 0; width: 100%; height: 100%;">
		
		</div>
		
		<!-- <button onclick="mappa()">Visualizza la mappa</button>
		c'è il modo di visualizzare la mappa direttamente senza fare click? come si mette id? -->
	</div>
	
</article>


<article id="CercaEvento">
<div class="container-fluid text-center" style=" height: 200px;">
<p><font size="6"> <FONT COLOR=" #000080"> <font face="Arial"><h5>Cerca per parole chiave</h5></font></font></font></p>
<p><h5>Cerca per parole chiave</h5></p>

</div>
</article>

<!-- VISIBILE SOLO AGLI AMMINISTRATORI -->
<%if(adminDB==true){ %>
<article id="Aggiungi utente">
<div class="container-fluid text-center" style=" height: 200px;">

<p><font size="6"> <FONT COLOR=" #000080"> <font face="Arial"><h5>Aggiungi utente</h5></font></font></font></p>

<h5>Inserisci i dati dell'utente che vuoi aggiunere</h5>
<!-- DEVO MANDARLO A login.java, facendo una servlet di quello -->
<form method="post" id="newUser" action="/helloTesina01">
<label for="username" style="width:80px"><b>Username</b></label>
<input type="text" id="User" placeholder="Enter Username" name="username" required><br/>
<label for="psw" style="width:80px;"><b> Password </b></label>
<input type="password" id="Password" placeholder="Enter Password" name="password" required><br/>
<button type="submit">Aggiungi</button>
</form>
</div>
</article>
<%}%>

</body>
</html>
