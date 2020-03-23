extends StaticBody2D

var healthMAX = 100
var currentHealth setget currentHealthSet, currentHealthGet
var monitoredHealth setget monitoredHealthSet, monitoredHealthGet
var id = 02

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
#func _process(delta):
#	$Popup/Label.text = string(currentHealth)
#	if monitoredHealth > currentHealth:
#		$Dummy.popup()
#	monitoredHealth == currentHealth

func _ready():
	currentHealth = 100

func currentHealthSet(value):
	currentHealth = currentHealth - value

func currentHealthGet():
	return currentHealth

func monitoredHealthSet(value):
	monitoredHealth = value

func monitoredHealthGet():
	return monitoredHealth
