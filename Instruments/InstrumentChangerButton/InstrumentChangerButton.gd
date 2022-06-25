extends Button

export var new_instrument  = ""

func _ready():
	text = new_instrument


func _on_InstrumentChangerButton_pressed():
	InstrumentsManager.change_instrument(new_instrument)
