extends Node

class_name ScoreData

const LEVEL_MULT : int = 10
const SaveFile := "user://save.sav"

var Level : int = 0
var Progress: int = 0
var LastProgressTrigger: int = 0
var Questions : int = 0
var Correct : int = 0

func init(scoreData : ScoreData) -> void:
	Level = scoreData.Level
	Progress = scoreData.Progress
	LastProgressTrigger = scoreData.LastProgressTrigger
	Questions = scoreData.Questions
	Correct = scoreData.Correct

func reset() -> void:
	Level = 0
	Progress = 0
	LastProgressTrigger = 0
	Questions = 0
	Correct = 0

func PercentageCorrect() -> float:
	if Questions == 0:
		return 0.0
	return stepify(float(Correct / float(Questions)) * 100.0, 0.01)

func IsScoreBetterThan(other : ScoreData) -> bool:
	return Level >= other.Level and Questions >= other.Questions and Correct > other.Correct

func Right() -> void:
	Correct += 1
	Progress += 1
	IncQuestions()
	CheckProgress()

func Wrong() -> void:
	Progress -= 1
	IncQuestions()
	CheckProgress()

func Skip() -> void:
	Progress -= 1
	CheckProgress()

func IncQuestions() -> void:
	Questions += 1

func IncLevel() -> void:
	Level += 1

func DecLevel() -> void:
	if Level > 0:
		Level -= 1

func CheckProgress() -> void:
	Progress = int(max(0, Progress))
	var IsLevelUp := Progress > LastProgressTrigger
	var IsLevelChange := Progress % LEVEL_MULT == 0
	if IsLevelChange:
		LastProgressTrigger = Progress
		if IsLevelUp:
			IncLevel()
		else:
			DecLevel()

func Save() -> void:
	var file = File.new()
	file.open(SaveFile, File.WRITE)
	file.store_32(Level)
	file.store_32(Progress)
	file.store_32(LastProgressTrigger)
	file.store_32(Questions)
	file.store_32(Correct)
	file.close()

func Load() -> bool:
	var file = File.new()
	if file.file_exists(SaveFile):
		file.open(SaveFile, File.READ)
		Level = file.get_32()
		Progress = file.get_32()
		LastProgressTrigger = file.get_32()
		Questions = file.get_32()
		Correct = file.get_32()
		file.close()
		return true
	return false
