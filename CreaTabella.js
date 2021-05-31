const reader=new FileReader()
var i =0
var eventi=[]   //array di oggetti contenente i dati del file

class evento{
	constructor(AS,Scuola,Comune,Grado,Titolo_Progetto,Periodo,Formatore,numero_ore,numero_studenti_coinvolti,età_partecipanti,Parola_chiave)
	{
		this.AS = AS;
		this.Scuola = Scuola;
		this.Comune = Comune;
		this.Grado = Grado;
		this.Titolo_Progetto = Titolo_Progetto;
		this.Periodo=Periodo;
		this.Formatore = Formatore;
		this.numero_ore = numero_ore;
		this.numero_studenti_coinvolti = numero_studenti_coinvolti;
		this.età_partecipanti = età_partecipanti;
		this.Parola_chiave = Parola_chiave;
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
	
	for(i=1;i<lines.length;i++)
	{
		e = new evento(
			lines[i][0],
			lines[i][1],
			lines[i][2],
			lines[i][4],
			lines[i][5],
			lines[i][6]+"al"+lines[i][7],
			lines[i][8],
			lines[i][9],
			lines[i][10],
			lines[i][11]+"a"+lines[i][12],
			lines[i][13],
		);
		eventi.push(e);
	}
	
	//console.log(eventi[0].AS+"\n"+eventi[1].AS)
    //console.log(eventi.length)
	run_event();
}


const filePicker = document.getElementById('picker');
filePicker.onchange = function(){
	let file = this.files[0];
	reader.readAsText(file);
}

function run_event() {
	numero_partecipanti();
	ore_svolte();
	eventi_svolti();
	tema();
	scuola_virtuosa();
	data_visualization();
	
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
	for(i = 0; i < eventi.length; i++)
		{
		cont=0;
			for(n=0 ; n<eventi.length; n++)
			{
				if(eventi[i].Parola_chiave==eventi[n].Parola_chiave)
				{
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
	for(i = 0; i < eventi.length; i++)
		{
		cont=0;
			for(n=0 ; n<eventi.length; n++)
			{
				if(eventi[i].Scuola==eventi[n].Scuola)
				{
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

function rimuovi_duplicati(data) {
	return data.filter((value, index) => data.indexOf(value) === index;	// Presa da stackoverflow
}
function drawVisualization() {
		
	   google.charts.load('current', {'packages':['corechart']});
       google.charts.setOnLoadCallback(drawVisualization);
	   let anni = [];
	   
		for(let evento=0; i < eventi.length; i++) {
			anni.push(eventi[evento].AS)
		}
		
		anni = rimuovi_duplicati(anni)
		
		let studenti = []
		let ore = []
		let eventi = []
		
		for(let anno=0; anno < anni.length; anno++) {
			studenti.push(0)
			ore.push(0)
			eventi.push(0)
		}
		
		for(let evento=0; evento < eventi.length; evento++) {
			studenti[anno.indexOf(eventi[evento].AS)] += eventi[evento].numero_studenti_coinvolti
			ore[anno.indexOf(eventi[evento].AS)] += eventi[evento].numero_ore
			eventi[anno.indexOf(eventi[evento].AS)] += 1
		}
		
		// Anni = 		[2018/2019, 2019/2020]
		// Studenti = 	[240, 553]
		// Ore = 		[21, 22]
		// Eventi = 	[1, 4]
        let data = google.visuali
		let years = new Arrayzation.arrayToDataTable([
          ['Year', 'Studenti coinvolti', 'Numero ore', 'Eventi svolti'],    
        ]);

        var options = {
          title : 'Monthly Coffee Production by Country',
          vAxis: {title: 'Quantity'},
          hAxis: {title: 'Year'},
          seriesType: 'bars',
          series: {5: {type: 'line'}},
          chartArea:{left:20,right:20,top:0,width:'50%',height:'75%'},
        }
        

        var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
       
        chart.draw(data, options);
      }
