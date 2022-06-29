extends Node

var current_instrument

var available_notes = {
	"percussion": [
		"kick","snare","hihat_closed","hihat_open","ride","tom1","tom2","tom3","crash1","crash2","crash3","cowbell"
	],
	"melodic":[
		"C","C#","D","D#","E","F","F#","G","G#","A","A#","B"
	]
}

var instruments = {
	"Drums": {
		"notes_types":"percussion",
		"notes": available_notes.percussion,
	},
	"Bass": {
		"notes_types":"melodic",
		"notes":available_notes.melodic,
		"sound_stream": load("res://Sounds/Bass/bass.wav")
	}
}

func change_instrument(new_instrument):
	current_instrument = new_instrument
	var notes = instruments[new_instrument].notes
	var notes_type = instruments[new_instrument].notes_types
	
	for i in GlobalVariables.LABELS_ROW_LOCATION_IN_TREE.get_child_count():
		#Rename Labels
		var label = GlobalVariables.LABELS_ROW_LOCATION_IN_TREE.get_child(i)
		label.text = notes[i]
		
		#Change the associated notes and pitch on the StepRows
		var step_row = GlobalVariables.NOTES_ROWS_LOCATION_IN_TREE.get_child(i)
		step_row.note = notes[i]
		if notes_type == "percussion":
			step_row.sound_stream = set_percussion_sound(notes[i])
		elif notes_type == "melodic":
			step_row.sound_stream = instruments[new_instrument].sound_stream.duplicate()
			step_row.sound_stream.mix_rate = set_instrument_pitch(i)
		
		# Color the steps for the new instrument
		for j in step_row.get_child_count():
			var step = step_row.get_child(j)
			# If we hit a separator, skip that iteration
			if step is ColorRect: continue
			# Uncolor Every step
			step.uncolor_step()
		
		# Color the steps for notes of that particular instrument that are played
		var active_notes_for_this_row = SequencerPlayer.current_notes[i]
		for active_note in active_notes_for_this_row:
			if active_note.instrument != current_instrument: continue
			var step = instance_from_id(active_note.step_id)
			step.color_step()

func set_instrument_pitch(note_index):
	var pitch = 1 + (0.05 * note_index)
	print(pitch)
	return pitch * 44100.0

func set_percussion_sound(note):
	return load("res://Sounds/Drums/"+note+".wav")
