extends ColorRect

var is_clicked = false
var mouse_over = false

func _on_ColorRect_gui_input(event):
	if event is InputEventMouseButton:
		if mouse_over and event.pressed:
			if not is_clicked:
				color = Colors.step_picked
				is_clicked = true
			else:
				color = Colors.step_default
				is_clicked = false


func _on_ColorRect_mouse_entered():
	mouse_over = true

func _on_ColorRect_mouse_exited():
	mouse_over = false
