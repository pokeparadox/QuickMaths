extends Control

const MaxVal:int = 100
const MultDivMax: int = 12
var valA :int = 0
var valB : int = 0
var answer :int = 0

enum Operations {Add, Sub, Mul, Div}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()
	valA = int(rand_range(0, MaxVal))
	valB = int(rand_range(0, MaxVal))
	answer = valA + valB
	$VSplitContainer/VBoxContainer/HBoxContainer/FirstNum.text = str(valA)
	$VSplitContainer/VBoxContainer/HBoxContainer/SecondNum.text = str(valB)


func _on_ButtonCheck_pressed() -> void:
	var response : int = int($VSplitContainer/VBoxContainer/HBoxContainer/Response.text)

	if (response == answer):
		$VSplitContainer/VBoxContainer/HBoxContainer/Response.text = "Correct! ^_~"
		$CorrectSound.play()
	else:
		$VSplitContainer/VBoxContainer/HBoxContainer/Response.text = "Sorry -_-"
		$WrongSound.play()


func _on_ButtonShow_pressed() -> void:
	$VSplitContainer/VBoxContainer/HBoxContainer/Response.text = str(answer)


func _on_ButtonNext_pressed() -> void:
	valA = int(rand_range(0, MaxVal))
	valB = int(rand_range(0, MaxVal))

	var op = int(rand_range(0, 3))
	if(op == Operations.Add):
		$VSplitContainer/VBoxContainer/HBoxContainer/Operation.text = "+"
		answer = valA + valB
	else:
		$VSplitContainer/VBoxContainer/HBoxContainer/Operation.text = "-"
		answer = valA - valB

	$VSplitContainer/VBoxContainer/HBoxContainer/FirstNum.text = str(valA)
	$VSplitContainer/VBoxContainer/HBoxContainer/SecondNum.text = str(valB)
	$VSplitContainer/VBoxContainer/HBoxContainer/Response.text = "0"

