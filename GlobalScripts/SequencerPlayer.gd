extends Node

# Plays the notes that the user selected
# 16 arrays. Each representing a step in the sequencer.
var current_step = 0
var notes = [
	[],
	[],
	[],
	[],
	[],
	[],
	[],
	[],
	[],
	[],
	[],
	[],
	[],
	[],
	[],
	[],
]


func play_step(step_number):
	for note in notes[step_number-1]:
		note.node_ref.play()

func add_note(note, step_number):
	notes[step_number-1].append(note)

func remove_note(step_id, step_number):
	var new_notes = notes.duplicate()
	new_notes[step_number-1] = []
	
	for note in notes[step_number-1]:
		if note.step_id != step_id: new_notes[step_number-1].append(note)
	
	notes = new_notes

