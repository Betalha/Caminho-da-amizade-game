extends Control

@onready var label = $Label

func show_dialogue(text: String):
	label.text = text
	show() # caso esteja escondido
