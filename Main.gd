extends Control


var MaxVal:int = 10
const MultDivMax: int = 12
const NextLevel : int = 10
var valA :int = 0
var valB : int = 0
var answer :int = 0
var scoreData : ScoreData = ScoreData.new()
var bestScoreData : ScoreData = ScoreData.new()
var defaultFontColour : Color = Color(1,1,1,1)

enum Operations {Add, Sub, Mul, Div}

func _ready() -> void:
	randomize()
	valA = int(rand_range(0, MaxVal))
	valB = int(rand_range(0, MaxVal))
	answer = valA + valB
	$VBoxContainer/VBoxContainer/HBoxContainer/FirstNum.text = str(valA)
	$VBoxContainer/VBoxContainer/HBoxContainer/SecondNum.text = str(valB)
	defaultFontColour = $VBoxContainer/VBoxContainer/HBoxContainer/Response.get_color("font_color")
	Load()

func Right() -> void:
	$VBoxContainer/VBoxContainer/HBoxContainer/Response.add_color_override("font_color", Color(0,1,0,1))
	$VBoxContainer/VBoxContainer/HBoxContainer/Response.text = "Correct! ^_~"
	$CorrectSound.play()
	scoreData.Right()

func Wrong() -> void:
	$VBoxContainer/VBoxContainer/HBoxContainer/Response.add_color_override("font_color", Color(1,0,0,1))
	$VBoxContainer/VBoxContainer/HBoxContainer/Response.text = "Sorry -_-"
	$WrongSound.play()
	scoreData.Wrong()

func SetScoreData() -> void:
	$VBoxContainer/VBoxContainer/CurrentStatus.SetScoreData(scoreData)
	$VBoxContainer/VBoxContainer/BestStatus.SetScoreData(scoreData)


func _on_ButtonCheck_pressed() -> void:
	var response : int = int($VBoxContainer/VBoxContainer/HBoxContainer/Response.text)
	if (response == answer):
		Right()
	else:
		Wrong()
	MaxVal = (scoreData.Level * scoreData.LEVEL_MULT) + scoreData.Progress + scoreData.LEVEL_MULT
	SetScoreData()

func _on_ButtonShow_pressed() -> void:
	$VBoxContainer/VBoxContainer/HBoxContainer/Response.text = str(answer)
	scoreData.Skip()

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
	bestScoreData.Save()

func Load():
	if bestScoreData.Load():
		$VBoxContainer/VBoxContainer/BestStatus.SetScoreData(bestScoreData)


func _on_ButtonReset_pressed() -> void:
	scoreData = ScoreData.new()
	Save()
	_ready()


func _on_BestStatus_newBestScore(data) -> void:
	bestScoreData = data
	Save()
