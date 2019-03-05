extends Node2D

var SKY
var PLAYER
var ENEMY
var TIMER
var SHOOT_LABEL

var draw = false
var playerBlock = false
var enemyBlock = false
var playerWin = false
var enemyWin = false

var time = 6

func _ready():
	SKY = get_node("Sky")
	PLAYER = get_node("Baseman")
	ENEMY = get_node("Evildood")
	
	TIMER = Timer.new()
	TIMER.one_shot = true
	TIMER.wait_time = time
	TIMER.connect("timeout", self, "_TIMER_timeout")
	add_child(TIMER)
	TIMER.start()

	SHOOT_LABEL = get_node("Shoot")
	SHOOT_LABEL.hide()


func _TIMER_timeout():
	if !draw:
		draw = true
		TIMER.wait_time = time/2
		TIMER.start()
		SHOOT_LABEL.show()
	else:
		if !enemyWin:
			ENEMY.rotate(PI/2)
		if !playerWin:
			PLAYER.rotate(-PI/2)

func inputHandler():
	if Input.is_action_just_released("P1"):
		if !draw:
			playerBlock = true
		elif draw && !playerBlock:
			playerWin =true
	if Input.is_action_just_released("P2"):
		if !draw:
			enemyBlock = true
		elif draw && !enemyBlock:
			enemyWin = true
	
	if playerWin && enemyWin:
		playerWin = false
		enemyWin = false




func _process(delta):
	
	inputHandler()

	if(SKY.global_position.y < self.global_position.y*4 && !draw):
		SKY.global_position.y = (1-(TIMER.time_left/time))*self.global_position.y*4

		

		
		



