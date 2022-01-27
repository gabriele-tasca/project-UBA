extends Node2D

var period: float = 1
var time = 0
export var flag = 0
export var flag2 = 0

onready var pup = $tutorial_baj
onready var target = $target
onready var anim_sprite = $AnimatedSprite

var moving = false

func _ready():
	pup.target_b_pos = target.position
	pass

func _process(delta):
	pup.mouse_input = flag
	anim_sprite.frame = !flag
	if moving:
		if flag2 == 0:
			pup.moving_right = true
			pup.moving_left = false
		else:
			pup.moving_right = false
			pup.moving_left = true


func reset_pos():
	pass
#	$tutorial_baj/body.position.x = 0
