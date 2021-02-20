extends Control

var following = false
var draggin_start_position = Vector2()

func _process(delta):
	if following:
		OS.set_window_position(OS.window_position + get_global_mouse_position() - draggin_start_position)

func _on_TomarPedido_pressed():
	$"Tomar pedido".visible = true


func _on_Cerrar_pressed():
	get_tree().quit()


func _on_Minimizar_pressed():
	OS.set_window_minimized(true)


func _on_TitleBar_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			following = !following
			draggin_start_position = get_local_mouse_position()
