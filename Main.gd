extends Control

var MaxVal:int = 10
const MultDivMax: int = 12
const NextLevel : int = 10
var valA :int = 0
var valB : int = 0
var answer :int = 0

var level : int = 0
var questions : int = 0
var correct : int = 0
var progress : int = 0

enum Operations {Add, Sub, Mul, Div}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()
	valA = int(rand_range(0, MaxVal))
	valB = int(rand_range(0, MaxVal))
	answer = valA + valB
	$VBoxContainer/VBoxContainer/HBoxContainer/FirstNum.text = str(valA)
	$VBoxContainer/VBoxContainer/HBoxContainer/SecondNum.text = str(valB)


func _on_ButtonCheck_pressed() -> void:
	var response : int = int($VBoxContainer/VBoxContainer/HBoxContainer/Response.text)
	if (response == answer):
		$VBoxContainer/VBoxContainer/HBoxContainer/Response.text = "Correct! ^_~"
		$CorrectSound.play()
		progress = progress + 1
		correct = correct + 1
	else:
		$VBoxContainer/VBoxContainer/HBoxContainer/Response.text = "Sorry -_-"
		$WrongSound.play()
		progress = progress - 1
	questions = questions + 1
	if(progress % NextLevel == 0):
		level = level + 1
		MaxVal = MaxVal + 10
	$VBoxContainer/VBoxContainer/StatusBox/LabelLevelValue.text = str(level)
	$VBoxContainer/VBoxContainer/StatusBox/LabelAttemptedVal.text = str(questions)
	$VBoxContainer/VBoxContainer/StatusBox/LabelCorrectVal.text = str(correct)
	$VBoxContainer/VBoxContainer/StatusBox/LabelPercentageVal.text = str((float(correct) / float(questions)) * 100)
	$VBoxContainer/VBoxContainer/StatusBox/BestVal.text = "0"

func _on_ButtonShow_pressed() -> void:
	$VBoxContainer/VBoxContainer/HBoxContainer/Response.text = str(answer)
	progress = progress - 1


func _on_ButtonNext_pressed() -> void:
	valA = int(rand_range(0, MaxVal))
	valB = int(rand_range(0, MaxVal))

	var op = int(rand_range(0, 3))
	if(op == Operations.Add):
		$VBoxContainer/VBoxContainer/HBoxContainer/Operation.text = "+"
		answer = valA + valB
	else:
		$VBoxContainer/VBoxContainer/HBoxContainer/Operation.text = "-"
		answer = valA - valB

	$VBoxContainer/VBoxContainer/HBoxContainer/FirstNum.text = str(valA)
	$VBoxContainer/VBoxContainer/HBoxContainer/SecondNum.text = str(valB)
	$VBoxContainer/VBoxContainer/HBoxContainer/Response.text = ""



func _on_Button7_pressed() -> void:
	addChar("7")


func _on_Button8_pressed() -> void:
	addChar("8")


func _on_Button9_pressed() -> void:
	addChar("9")


func _on_Button4_pressed() -> void:
	addChar("4")


func _on_Button5_pressed() -> void:
	addChar("5")


func _on_Button6_pressed() -> void:
	addChar("6")


func _on_Button1_pressed() -> void:
	addChar("1")


func _on_Button2_pressed() -> void:
	addChar("2")


func _on_Button3_pressed() -> void:
	addChar("3")


func _on_Button0_pressed() -> void:
	addChar("0")

func addChar(character) -> void:
	$VBoxContainer/VBoxContainer/HBoxContainer/Response.text = $VBoxContainer/VBoxContainer/HBoxContainer/Response.text + character

func _on_ButtonClear_pressed() -> void:
	var text = $VBoxContainer/VBoxContainer/HBoxContainer/Response.text
	if(not text.empty()):
		text.erase(text.length() - 1, 1)
		$VBoxContainer/VBoxContainer/HBoxContainer/Response.text = text


func _on_ButtonClearAll_pressed() -> void:
	$VBoxContainer/VBoxContainer/HBoxContainer/Response.text = ""


func _on_CorrectSound_finished() -> void:
	_on_ButtonClearAll_pressed()
	_on_ButtonNext_pressed()


func _on_WrongSound_finished() -> void:
	_on_ButtonClearAll_pressed()


func _on_Button_pressed() -> void:
	addChar("-")
