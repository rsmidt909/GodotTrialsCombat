extends PopupDialog


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	get_parent().get_node("Dummy").connect("hitSignal", self, "_hitText")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _hitText():
	var dummy = get_parent().get_node("Dummy")
	var stringHealth = str(dummy.currentHealth)
	OS.alert(stringHealth)
