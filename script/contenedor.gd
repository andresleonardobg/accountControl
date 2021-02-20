extends Control

var mesas = 11

func _ready():
	$Total.text = "Total: " + str(Global.total)
	
	for mesa in mesas:
		if mesa == 0:
			$Panel/OptionButton.add_item(str("ninguna"))
		else:
			$Panel/OptionButton.add_item(str(mesa))

func _process(delta):
	$Total.text = str(Global.total)
	$ConfirmarRegistro/RichTextLabel.text = "Total de la compra: " + str(Global.total)

func _on_OptionButton_item_selected(index):
	if index == null:
		$Mesa.text = "ninguna"
		Global.mesa = "ninguna"
	else:
		$Mesa.text = str(index)
		Global.mesa = index


func _on_Button_pressed():
	self.visible = false


func _on_Registrar_pressed():
	if Global.total != 0:
		$ConfirmarRegistro.popup()


func _on_ConfirmarRegistro_confirmed():
	Global._escribir()
	Global.documento = Global._leer()
	get_tree().reload_current_scene()
	Global.total = 0
	Global.mesa = "ninguna"
