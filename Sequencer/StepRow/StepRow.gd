extends HBoxContainer

export var note = ""
export(AudioStreamSample) var sound_stream

func _ready():
	rename_label()

func rename_label():
#	Grab the label that has the same index as this StepRow index
	var this_node_index = get_index()
	var label_with_same_index = GlobalVariables.LABELS_ROW_LOCATION_IN_TREE.get_child(this_node_index)
	
	label_with_same_index.text = note
