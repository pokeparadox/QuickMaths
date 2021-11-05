extends HBoxContainer

class_name CurrentStatus

func SetScoreData(scoreData) -> void:
		UpdateStatus(scoreData)


func UpdateStatus(scoreData) -> void:
	$LabelLevelValue.text = str(scoreData.Level)
	$LabelAttemptedVal.text = str(scoreData.Questions)
	$LabelCorrectVal.text = str(scoreData.Correct)
	$LabelPercentageVal.text = str(scoreData.PercentageCorrect())
