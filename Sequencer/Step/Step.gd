extends Control

export var step_number = 0

var is_clicked = false
var mouse_over = false


func _on_ColorRect_gui_input(event):
	if event is InputEventMouseButton:
		if mouse_over and event.pressed:
			if not is_clicked:
				$ColorRect.color = Colors.step_picked
				is_clicked = true
				step_selected()
			else:
				$ColorRect.color = Colors.step_default
				is_clicked = false


func _on_ColorRect_mouse_entered():
	mouse_over = true

func _on_ColorRect_mouse_exited():
	mouse_over = false

func step_selected():
#	Instantiate a Sound Scene. Reference it in node_to_add
	var scene_instance = GlobalVariables.SOUND_SCENE.instance()
	GlobalVariables.SEQUENCER_LOCATION_IN_TREE.add_child(scene_instance)
	var sound = get_parent().sound
	scene_instance.set_stream(sound)
	
	var note_to_add = {"instrument":"drums", "note":"kick", "node_ref": scene_instance }
	SequencerPlayer.add_note(note_to_add, step_number)
