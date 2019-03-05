extends Node2D

var SKY
var PLAYER
var ENEMY
var TIMER
var TIMER_LABEL

var draw = false

var time= 5
var timeout = 0.001
var timer = 0

func _ready():
	SKY = get_node("Sky")
	print(SKY.global_position)
	print(self.global_position)
	
	TIMER = Timer.new()
	TIMER.one_shot = true
	TIMER.wait_time = time
	TIMER.connect("timeout", self, "_TIMER_timeout")
	add_child(TIMER)
	TIMER.start()

	TIMER_LABEL = get_node("TimerLabel")


func _TIMER_timeout():
	draw = true




func _process(delta):
	
	if(SKY.global_position.y < self.global_position.y*4 && !draw):
		timer = 0
		SKY.global_position.y = (1-(TIMER.time_left/time))*self.global_position.y*4

	timer = timer + delta
	TIMER_LABEL.text = String(TIMER.time_left)



