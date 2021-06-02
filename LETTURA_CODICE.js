//google.charts.load('current', {'packages':['corechart']});
//google.charts.setOnLoadCallback(drawVisualization);
let data=localStorage.getItem("Eventi_letti")

const reader=new FileReader()
var i =0
var eventi=[]   //array di oggetti contenente i dati del file

class evento{
	constructor(AS,Scuola,Comune,Indirizzo,Grado,Titolo_Progetto,Periodo,Formatore,numero_ore,numero_studenti_coinvolti,età_partecipanti,Parola_chiave)
	{
		this.AS = AS; //colonna0
		this.Scuola = Scuola; //colonna1
		this.Comune = Comune; //colonna 2
		this.Indirizzo = Indirizzo; //colonna 3
		this.Grado = Grado; //colonna4
		this.Titolo_Progetto = Titolo_Progetto; //colonna5
		this.Periodo=Periodo; //colonna 6 (6 e 7 del file)
		this.Formatore = Formatore; //colonna 7
		this.numero_ore = numero_ore; //colonna 8
		this.numero_studenti_coinvolti = numero_studenti_coinvolti; //colonna 9
		this.età_partecipanti = età_partecipanti; //colonna 10(12 e 13 del file)
		this.Parola_chiave = Parola_chiave; //colonna 11
	}
	
}  //costruttore della classe evento

reader.onload = function()
{
		const lines=reader.result.split('\n').map(function(lines){
		return lines.trim().split(';');
	})
	console.log(lines[1][0]);
	console.log(lines[1][1]);
	console.log(lines[1][2]);
	console.log(lines[1][3]);
	console.log(lines[1][4]);
	console.log(lines[1][5]);
	console.log(lines[1][6]);
	console.log(lines[1][7]);
	console.log(lines[1][8]);
	console.log(lines[1][9]);
	console.log(lines[1][10]);
	console.log(lines[1][11]);
	console.log(lines[1][12]);
	console.log(lines[1][13]);

	
	for(i=0;i<lines.length;i++)
	{
		e = new evento(
			lines[i][0], //colonna 0 - AS
			lines[i][1], //colonna 1 - scuola
			lines[i][2],
			lines[i][3],
			lines[i][4],
			lines[i][5],
			lines[i][6]+" a "+lines[i][7],
			lines[i][8],
			lines[i][9],
			lines[i][10],
			lines[i][11]+" a "+lines[i][12],
			lines[i][13]
		);
		eventi.push(e);
	}
	
	console.log(eventi[0].AS+"\n"+eventi[10].AS)
    console.log(eventi.length)
	//run_event();
	numero_partecipanti();
	ore_svolte();
	eventi_svolti();
	tema();
	scuola_virtuosa();
	drawVisualization();
}

const filePicker = document.getElementById('picker');
filePicker.onchange = function r(){
	let file = this.files[0];
	reader.readAsText(file);
}

function run_event() {
	numero_partecipanti();
	ore_svolte();
	eventi_svolti();
	tema();
	scuola_virtuosa();
	drawVisualization();
}

function eventi_svolti() {
	let c = document.getElementById("contatore_eventi");
	let num_ev =eventi.length;  //il numero di eventi svolti dovrebbe essere proprio la lunghezza del vettore in quanto ogni oggetto è un evento
	c.innerText = num_ev;
}

function numero_partecipanti() {
	let c = document.getElementById("numero_studenti");
	let num_stud = 0;
	for(i = 0; i < eventi.length; i++)
		num_stud += Number(eventi[i].numero_studenti_coinvolti);
	
	c.innerText = num_stud;
}

function ore_svolte(){
	let s=document.getElementById("ore");
	let num_ore= 0;
	for(i = 0; i < eventi.length; i++)
		num_ore += Number(eventi[i].numero_ore);
		
	s.innerText= num_ore
}

function tema(){
let a=document.getElementById("tema_trattato");
	let tema= 0;
	let cont=0
	let chiave=""
	for(i = 0; i < eventi.length; i++){
		cont=0;
			for(n=0 ; n<eventi.length; n++){
				if(eventi[i].Parola_chiave==eventi[n].Parola_chiave){
				cont+=1
				}
			
			}
			if(cont>tema)  //questo if controlla se il tema corrente è stato trattato più volte del tema piu trattato dall'iterazione precedente
			{
				tema=cont
				chiave=eventi[i].Parola_chiave
			}
		
		}
		
	a.innerText= chiave
}

function scuola_virtuosa(){
let a=document.getElementById("scuola");
	let scuola= 0;
	let cont=0
	let chiave=""
	for(i = 0; i < eventi.length; i++){
		cont=0;
			for(n=0 ; n<eventi.length; n++){
				if(eventi[i].Scuola==eventi[n].Scuola){
					cont+=1
				}
			
			}
			if(cont>scuola)  //questo if controlla se il tema corrente è stato trattato più volte del tema piu trattato dall'iterazione precedente
			{
				tema=cont
				chiave=eventi[i].Scuola
			}
	}
	a.innerText= chiave
}

//function rimuovi_duplicati(data) {
	//return data.filter((value, index) => data.indexOf(value) === index);	// Presa da stackoverflow
//}

google.charts.setOnLoadCallback(drawVisualization);
function drawVisualization() {
		
	   //google.charts.load('current', {'packages':['corechart']});
       //google.charts.setOnLoadCallback(drawVisualization);
	   let anni = [];
	   
		for(let evento=0; evento < eventi.length; evento++) { //INSERISCO gli anni 
			if(anni.indexOf(eventi[evento].AS) == -1){
				anni.push(eventi[evento].AS)
			}
			
		}
		
		console.log(anni);
		
		//creo le variabili
		let studenti = []
		let ore = []
		let eventiTot = []
		
		//per ogni anno inserisco uno 0 nell'array (es. se ho 5 anni avrò un vettore lungo 5)
		for(let anno=0; anno < anni.length; anno++) {
			studenti.push(0)
			ore.push(0)
			eventiTot.push(0)
		}
		
		for(let evento=0; evento < eventi.length; evento++) {
		//eventi[evento].AS è l'anno scolastico dell'evento corrente
			studenti[anni.indexOf(eventi[evento].AS)] += Number(eventi[evento].numero_studenti_coinvolti)
			ore[anni.indexOf(eventi[evento].AS)] += Number(eventi[evento].numero_ore)
			eventiTot[anni.indexOf(eventi[evento].AS)] += 1
		}
		console.log(eventi);
		
		// Anni = 		[2018/2019, 2019/2020]
		// Studenti = 	[240, 553]
		// Ore = 		[21, 22]
		// Eventi = 	[1, 4]

//GRAFICO 1
        var data = new google.visualization.DataTable();
        data.addColumn('string','Anni');
        data.addColumn('number', 'Numero studenti');

		
	
		for(let anno=0; anno < anni.length; anno++) {
			data.addRow([anni[anno], studenti[anno]])
			}	
			// 2018/2019, 240
			// 2019/2020, 553
			
        var options = {
          title : 'Numero Studenti',
          pieHole: 0.5,
          vAxis: {title: 'Numero Studenti'},
          hAxis: {title: 'Year'},
          seriesType: 'bars',
          series: {5: {type: 'line'}},
          chartArea:{left:40,right:20,top:50,width:'80%',height:'80%'},
        }
        
        var chart1 = new google.visualization.PieChart(document.getElementById('chart1_div'));
        chart1.draw(data, options);
        
//GRAFICO 2
        var data2 = new google.visualization.DataTable();
        data2.addColumn('string','Anni');
		data2.addColumn('number', 'Ore Svolte');
		
		for(let anno=0; anno < anni.length; anno++) {
			data2.addRow([anni[anno], ore[anno]])
			}	
			// 2018/2019, 21
			// 2019/2020, 22
			
        var options2 = {
          title : 'Ore svolte',
          vAxis: {title: 'Ore'},
          hAxis: {title: 'Year'},
          seriesType: 'bars',
          series: {5: {type: 'line'}},
          chartArea:{left:40,right:20,top:50,bottom:50,width:'100%',height:'100%'},
        }
        //oppure line chart
        var chart2 = new google.visualization.ColumnChart(document.getElementById('chart2_div'));
        chart2.draw(data2, options2);

//GRAFICO 3
        var data3 = new google.visualization.DataTable();
        data3.addColumn('string','Anni');
		data3.addColumn('number', 'Eventi totali');
		
		for(let anno=0; anno < anni.length; anno++) {
			data3.addRow([anni[anno], eventiTot[anno]])
			}	
			// 2018/2019, 1
			// 2019/2020, 4
			
        var options3 = {
          title : 'Eventi svolti',
          is3D: true,
          vAxis: {title: 'Eventi'},
          hAxis: {title: 'Year'},
          seriesType: 'bars',
          series: {5: {type: 'line'}},
          chartArea:{left:40,right:20,top:50,bottom:50,width:'100%',height:'100%'}
        }
        
        var chart3 = new google.visualization.PieChart(document.getElementById('chart3_div'));
        chart3.draw(data3, options3);
 }



