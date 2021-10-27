extends Control

const SaveFile := "res://save.sav"
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
var defaultFontColour : Color = Color(1,1,1,1)

enum Operations {Add, Sub, Mul, Div}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()
	valA = int(rand_range(0, MaxVal))
	valB = int(rand_range(0, MaxVal))
	answer = valA + valB
	$VBoxContainer/VBoxContainer/HBoxContainer/FirstNum.text = str(valA)
	$VBoxContainer/VBoxContainer/HBoxContainer/SecondNum.text = str(valB)
	defaultFontColour = $VBoxContainer/VBoxContainer/HBoxContainer/Response.get_color("font_color")
	Load()
	$VBoxContainer/VBoxContainer/StatusBox/LabelLevelValue.text = str(level)


func _on_ButtonCheck_pressed() -> void:
	var response : int = int($VBoxContainer/VBoxContainer/HBoxContainer/Response.text)
	if (response == answer):
		$VBoxContainer/VBoxContainer/HBoxContainer/Response.add_color_override("font_color", Color(0,1,0,1))
		$VBoxContainer/VBoxContainer/HBoxContainer/Response.text = "Correct! ^_~"
		$CorrectSound.play()
		progress = progress + 1
		correct = correct + 1
	else:
		$VBoxContainer/VBoxContainer/HBoxContainer/Response.add_color_override("font_color", Color(1,0,0,1))
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
	$VBoxContainer/VBoxContainer/StatusBox/LabelPercentageVal.text = str(stepify((float(correct) / float(questions) * 100), 0.001))

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

func addChar(character) -> void:
	$VBoxContainer/VBoxContainer/HBoxContainer/Response.text = $VBoxContainer/VBoxContainer/HBoxContainer/Response.text + character

func _on_CorrectSound_finished() -> void:
	_on_ButtonGrid_ClearAllButtonPressed()
	_on_ButtonNext_pressed()


func _on_WrongSound_finished() -> void:
	_on_ButtonGrid_ClearAllButtonPressed()

func _on_ButtonGrid_ButtonPressed(value) -> void:
	addChar(str(value))


func _on_ButtonGrid_ClearAllButtonPressed() -> void:
	$VBoxContainer/VBoxContainer/HBoxContainer/Response.text = ""
	$VBoxContainer/VBoxContainer/HBoxContainer/Response.add_color_override("font_color", defaultFontColour)

func _on_ButtonGrid_ClearButtonPressed() -> void:
	var text = $VBoxContainer/VBoxContainer/HBoxContainer/Response.text
	if(not text.empty()):
		text.erase(text.length() - 1, 1)
		$VBoxContainer/VBoxContainer/HBoxContainer/Response.text = text

func _on_ButtonGrid_MinusButtonPressed() -> void:
	addChar("-")

func _notification(msg):
	if msg == MainLoop.NOTIFICATION_WM_QUIT_REQUEST:
		Save()
		get_tree().quit()
func Save():
	var file = File.new()
	file.open(SaveFile, File.WRITE)
	file.store_var(level)
	file.close()

func Load():
	var file = File.new()
	file.open(SaveFile, File.READ)
	level = file.get_var()
	file.close()


func _on_ButtonReset_pressed() -> void:
	level = 0
	progress = 0
	Save()
	_ready()
