extends Node

var total = 0
var mesa 

var doc = "C:/Users/USUARIO/Desktop/pizzacore/Registro.csv"

var documento

func _ready():
	documento = _leer()

func _escribir():
	
	var file = File.new()
	
	file.open(doc, 2)
	
	if documento.size() == 0:
		var titulos = ["Mesa", "Total", "Hora", "fecha", "semana"]
		file.store_csv_line(titulos, ";")
	else:
		for i in documento.size():
			var datos = documento[i]
			file.store_csv_line(datos, ";")
	
	var time = OS.get_datetime()
	var hora = String(time.hour) +":"+ String(time.minute)
	var fecha = String(time.day) +"/"+String(time.month) +"/"+ String(time.year)
	var semana = String(time.weekday)
	var mesas = mesa
	var totales = total
	
	
	var datos = [mesas, totales, hora, fecha, semana]
	file.store_csv_line(datos, ";")
	
	file.close()

func _leer():
	
	var file = File.new()
	
	file.open(doc, 1)
	
	var contenido = file.get_as_text()
	
	contenido = contenido.split("\n")
	
	contenido = Array(contenido)
	
	contenido.erase("")
	
	var datos = []
	
	for dato in contenido:
		dato = dato.split(";")
		dato = Array(dato)
		dato.erase("")
		datos.append(dato)
	
	
	file.close()
	
	return datos
