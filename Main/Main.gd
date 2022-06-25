# v0.1, still WIP
# Released under GPLv3 License. For more info view LICENSE file

extends Control

var interval = 30000 #samples
var interval_sec = 0.25
var tempo = 100
func _ready():

	interval_sec = 60.0/tempo

	var stream = $player.stream
	var stream_data = stream.data

	interval = interval_sec*stream.mix_rate
	if stream.stereo: interval = interval*4 #why by 4?? idk but it works

	stream_data.resize(interval)
	var new_data = stream_data

	for i in 8: #8 is the number of times the stream is gona be copied into the file
		stream_data.append_array(new_data)
	stream.data = stream_data
	stream.loop_mode = 1
	stream.loop_end = stream_data.size()/4
#	$player.stream.mix_rate = 0.5 * 44100.0
#	$player.play()
	
	$player.stream.save_to_wav("/coolstream.wav")
	pass
##

