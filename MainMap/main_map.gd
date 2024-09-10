extends Node2D


@onready var animation := $AnimationPlayer
@onready var current_level := $CurrentLevel


var player : CharacterBody2D
var spawnpoint : Marker2D
@export var completed_levels : = 0

var format_string = "SpawnPoints/SpawnPoint%d"


func _ready():
	update_spawnpoint()
	
	for spawn in $SpawnPoints.get_children():
		spawn.spawning_time.connect(spawn_player)


func first_start():
	animation.play("first_load")


func unlock_player():
	player.IsLocked = false


func lock_player():
	player.IsLocked = true


func update_spawnpoint():
	spawnpoint = get_node(format_string % completed_levels)


func spawn_animation():
	update_spawnpoint()
	spawnpoint.play_animation()


func spawn_player():
	update_spawnpoint()
	var player_scene = preload("res://player/player.tscn")
	player = player_scene.instantiate()
	player.position = spawnpoint.position
	
	add_child(player)


func _on_level_previewer_start_level(level):
	$MapLevels.visible = false
	$Postcard.visible = false
	$SpawnPoints.visible = false
	get_node("Player").queue_free()
	current_level.goto_scene(level)


func _on_current_level_return_to_map():
	completed_levels += 1
	animation.play("normal_load")
