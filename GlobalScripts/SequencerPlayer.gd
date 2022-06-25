extends Node

# Plays the notes that the user selected
# 16 arrays. Each representing a step in the sequencer.
var current_step = 0
var current_notes = [
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
	for note in current_notes[step_number-1]:
		note.node_ref.play()

func add_note(note, step_number):
	current_notes[step_number-1].append(note)

func remove_note(step_id, step_number):
	var new_notes = current_notes.duplicate()
	new_notes[step_number-1] = []
	
	for note in current_notes[step_number-1]:
		if note.step_id != step_id: new_notes[step_number-1].append(note)
		else: note.node_ref.queue_free()
	
	current_notes = new_notes

