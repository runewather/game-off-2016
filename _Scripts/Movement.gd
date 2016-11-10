
extends KinematicBody2D

var walk_speed = 100
var velocity = Vector2()
var player_sprite = null
var direction = null

var attack_collider = CollisionShape2D.new()

const directions = {
	up = 0,
	down = 1,
	left = 2,
	right = 3
}

func _ready():
	attack_collider = get_node("AttackCollider")
	player_sprite = get_node("PlayerSprite")
	direction = directions.left
	set_fixed_process(true)
	set_process(true)
	pass

func _process(delta):
	if(Input.is_key_pressed(KEY_Z)):
		if(attack_collider):
			attack_collider.get_collider().move(Vector2(-5, 0))
	pass

func _fixed_process(delta):
	if(Input.is_action_pressed("ui_up")):
		velocity.y = -walk_speed
	elif(Input.is_action_pressed("ui_down")):
		velocity.y = walk_speed
	if(Input.is_action_pressed("ui_right")): 
		if(direction != directions.right):
			direction = directions.right
			player_sprite.set_scale(Vector2(player_sprite.get_scale().x * -1, player_sprite.get_scale().y))
		velocity.x = walk_speed
	elif(Input.is_action_pressed("ui_left")):
		if(direction != directions.left):
			direction = directions.left
			player_sprite.set_scale(Vector2(player_sprite.get_scale().x * -1, player_sprite.get_scale().y))
		velocity.x = -walk_speed	
	
	var motion = velocity * delta	
	
	move(motion)
	
	velocity.x = 0
	velocity.y = 0
	
	pass

