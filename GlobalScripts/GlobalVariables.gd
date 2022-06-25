extends Node

var SOUND_SCENE = load("res://Sequencer/Sound/Sound.tscn")

onready var SEQUENCER_LOCATION_IN_TREE = get_tree().get_root().get_node("Main/Sequencer")
onready var LABELS_ROW_LOCATION_IN_TREE = get_tree().get_root().get_node("Main/Sequencer/LabelsRows")
onready var NOTES_ROWS_LOCATION_IN_TREE = get_tree().get_root().get_node("Main/Sequencer/NotesRows")

var BEEP = load("res://Sounds/Metronome/beep.wav")
