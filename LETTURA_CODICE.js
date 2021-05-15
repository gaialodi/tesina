const reader=new FileReader()
var i =0
var eventi=[]   //array di oggetti contenente i dati del file

class evento{
	constructor(AS,Scuola,Comune,Grado,Titolo,Progetto,Periodo,Formatore,numero_ore,numero_studenti_coinvolti,età_partecipanti,Parola_chiave)
	{
		this.AS = AS;
		this.Scuola = Scuola;
		this.Comune = Comune;
		this.Grado = Grado;
		this.Titolo = Titolo;
		this.Progetto = Progetto;
		this.Periodo = Periodo;
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
		return lines.split(';')
	})
	//console.log(lines[0][0]);
	
	for(i=0;i<lines.length;i++)
	{
		e = new evento(
			lines[i][0],
			lines[i][1],
			lines[i][2],
			lines[i][3],
			lines[i][4],
			lines[i][5],
			lines[i][6],
			lines[i][7],
			lines[i][8],
			lines[i][9],
			lines[i][10],
			lines[i][11],
			lines[i][12]
		);
		eventi.push(e);
	}
	
	console.log(eventi[0].AS+"\n"+eventi[1].AS)
    console.log(eventi.length)
	run_event();
}


const filePicker = document.getElementById('picker');
filePicker.onchange = function(){
	let file = this.files[0];
	reader.readAsText(file);
}

function run_event() {
	numero_partecipanti();
	ore_svolte()
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
let n=document.getElementById("Parola_chiave");
	let num_ore= 0;
	for(i = 0; i < eventi.length; i++)
		num_ore += Number(eventi[i].numero_ore);
		
	s.innerText= num_ore

}




