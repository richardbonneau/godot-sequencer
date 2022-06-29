extends Control

var id
export var step_number = 0

var is_clicked = false
var mouse_over = false

var scene_instance

func _ready():
	id = get_instance_id()

func _on_ColorRect_mouse_entered():
	mouse_over = true
func _on_ColorRect_mouse_exited():
	mouse_over = false
func _on_ColorRect_gui_input(event):
	if event is InputEventMouseButton:
		if mouse_over and event.pressed:
			if not is_clicked:
				step_selected()
			else:
				step_unselected()

func step_selected():
	color_step()
#	Instantiate a Sound Scene. Reference it in node_to_add
	scene_instance = GlobalVariables.SOUND_SCENE.instance()
	GlobalVariables.SEQUENCER_LOCATION_IN_TREE.add_child(scene_instance)
	var sound_stream = get_parent().sound_stream
	scene_instance.set_stream(sound_stream)
	
	var note_to_add = {"node_ref": scene_instance, "step_id": id, "instrument": InstrumentsManager.current_instrument }
	SequencerPlayer.add_note(note_to_add, step_number)

func step_unselected():
	uncolor_step()
	SequencerPlayer.remove_note(id, step_number)

func color_step():
	$ColorRect.color = Colors.step_picked
	is_clicked = true

func uncolor_step():
	$ColorRect.color = Colors.step_default
	is_clicked = false
