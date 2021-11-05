extends "res://Controls/CurrentStatus.gd"

signal newBestScore(scoreData)

var lastBestScore : ScoreData = ScoreData.new()

func SetScoreData(scoreData) -> void:
	if scoreData.IsScoreBetterThan(lastBestScore):
		.SetScoreData(scoreData)
		lastBestScore.init(scoreData)
		emit_signal("newBestScore",scoreData)
