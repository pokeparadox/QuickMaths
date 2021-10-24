extends GridContainer

signal ButtonPressed(value)
signal MinusButtonPressed()
signal ClearButtonPressed()
signal ClearAllButtonPressed()

func _on_Button7_pressed() -> void:
	emit_signal("ButtonPressed", 7)

func _on_Button8_pressed() -> void:
	emit_signal("ButtonPressed", 8)

func _on_Button9_pressed() -> void:
	emit_signal("ButtonPressed", 9)

func _on_Button4_pressed() -> void:
	emit_signal("ButtonPressed", 4)

func _on_Button5_pressed() -> void:
	emit_signal("ButtonPressed", 5)

func _on_Button6_pressed() -> void:
	emit_signal("ButtonPressed", 6)

func _on_Button1_pressed() -> void:
	emit_signal("ButtonPressed", 1)

func _on_Button2_pressed() -> void:
	emit_signal("ButtonPressed", 2)

func _on_Button3_pressed() -> void:
	emit_signal("ButtonPressed", 3)

func _on_Button0_pressed() -> void:
	emit_signal("ButtonPressed", 0)

func _on_ButtonClear_pressed() -> void:
	emit_signal("ClearButtonPressed")

func _on_ButtonClearAll_pressed() -> void:
	emit_signal("ClearAllButtonPressed")

func _on_Button_pressed() -> void:
	emit_signal("MinusButtonPressed")
