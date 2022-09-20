extends Node2D

var rng: RandomNumberGenerator = RandomNumberGenerator.new()
var hasUpdatedScoreForFirstTime: bool = false
onready var rainDropScene: PackedScene = preload("res://scenes/RainDrop.tscn")
onready var bucketScene: PackedScene = preload("res://scenes/Bucket.tscn")
onready var bucket: CollectsWater = bucketScene.instance()
onready var screen: Rect2 = get_tree().get_root().get_visible_rect()
onready var dropTimer: Timer = Timer.new()

class_name Game
# onready variables are initialised after the ready method is called

func _ready():
	setup_player(bucket)
	GlobalVariables.scoreLabel = get_node("HUD/ScorePanel/VBoxContainer/ScoreNumText")
	GlobalVariables.updateScore()
	rng.randomize()
	setupTimer()
	add_rain_drop()

func add_rain_drop() -> void:
	rng.randomize()
	var rainDrop = rainDropScene.instance()
	rainDrop.position.x = rng.randf_range(screen.position.x, screen.size.x) # get a random number between 0 and 1280
	rainDrop.position.y = 0 # make the position the top of the screen
	add_child(rainDrop)
	move_child(rainDrop, get_child_count()) # add raindrop to the front of screen
	dropTimer.start(5.0)

func setup_player(var waterCollector: CollectsWater) -> void:
	add_child_below_node($Scene, waterCollector)
	waterCollector.position = Vector2(screen.size.x / 2 ,571)

func setupTimer() -> void:
	add_child(dropTimer)
	dropTimer.connect("timeout", self, "_on_AddDropTimer_timeout")

func _on_AddDropTimer_timeout():
	add_rain_drop()