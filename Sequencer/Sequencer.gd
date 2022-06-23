extends Control

export var bpm = 240
var time = 0.0

onready var current_step = 0
onready var play_head_positions = get_play_head_position()

func get_play_head_position():
	var steps = []
	
	for child in $NotesRows/StepRow1.get_children():
		if "Step" in child.name: steps.append(child)
	
	return steps



func _process(delta):
	var bpm_in_seconds = 60.0/bpm
	time += delta
	if(time >= bpm_in_seconds):
		time -= bpm_in_seconds
		current_step += 1
		if current_step > 16: current_step = 1
		play_step()

func play_step():
#	$player.play()
	move_play_head()
	SequencerPlayer.play_step(current_step)

func move_play_head():
	$PlayHead.set_position(play_head_positions[current_step - 1].get_global_position())

