extends VBoxContainer


var stringHealth


# Called when the node enters the scene tree for the first time.
func _ready():
	get_parent().get_node("Dummy").connect("hitSignal", self, "_hitText")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func getDummyHealth():
	var dummy = get_parent().get_node("Dummy")
	stringHealth = str(dummy.currentHealth)

func changeHealth():
	$RichTextLabel.set_bbcode(stringHealth)

func _hitText():
	getDummyHealth()
	changeHealth()
