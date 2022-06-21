extends Node

var SOUND_SCENE = load("res://Sequencer/Sound/Sound.tscn")
onready var SEQUENCER_LOCATION_IN_TREE = get_tree().get_root().get_node("Main/Sequencer")

var BEEP = load("res://Sounds/Metronome/beep.wav")
