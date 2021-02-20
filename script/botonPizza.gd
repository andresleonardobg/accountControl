extends Panel

export var price = 0
export var nombre = ""
var cantidad = 0

func _process(delta):
	$Nombre.text = nombre
	$Total.text = str(cantidad)

func _on_Suma_pressed():
	Global.total += price
	cantidad += 1

func _on_Resta_pressed():
	
	if Global.total == 0:
		Global.total = 0
	else:
		Global.total -= price
		
	if cantidad == 0:
		cantidad = 0
	else:
		cantidad -= 1
