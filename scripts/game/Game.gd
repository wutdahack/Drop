extends Node2D

# onready variables are initialised after the ready method is called
onready var rainDropScene: PackedScene = preload("res://scenes/drops/RainDrop.tscn")
onready var bucketScene: PackedScene = preload("res://scenes/water_collectors/Bucket.tscn")
onready var bucket: CollectsWater = bucketScene.instance()
onready var screen: Rect2 = get_tree().get_root().get_visible_rect()
onready var dropTimer: Timer = Timer.new()
onready var rng: RandomNumberGenerator = RandomNumberGenerator.new()
const TIMER_WAIT_TIME: float = 5.0

func _ready() -> void:
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
	move_child(rainDrop, $ExtraGrassFront.get_index()) # add raindrop behind the front grass
	dropTimer.start(TIMER_WAIT_TIME)

func setup_player(var waterCollector: CollectsWater) -> void:
	add_child_below_node($Scene, waterCollector)
	waterCollector.position = $WaterCollectorPosition.position

func setupTimer() -> void:
	add_child(dropTimer)
	
	# warning-ignore:return_value_discarded
	dropTimer.connect("timeout", self, "_on_AddDropTimer_timeout")

func _on_AddDropTimer_timeout():
	add_rain_drop()
