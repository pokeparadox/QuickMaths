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

func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.is_pressed() and not event.is_echo():
		if event.scancode == KEY_0:
			_on_Button0_pressed()
		elif event.scancode == KEY_1:
			_on_Button1_pressed()
		elif event.scancode == KEY_2:
			_on_Button2_pressed()
		elif event.scancode == KEY_3:
			_on_Button3_pressed()
		elif event.scancode == KEY_4:
			_on_Button4_pressed()
		elif event.scancode == KEY_5:
			_on_Button5_pressed()
		elif event.scancode == KEY_6:
			_on_Button6_pressed()
		elif event.scancode == KEY_7:
			_on_Button7_pressed()
		elif event.scancode == KEY_8:
			_on_Button8_pressed()
		elif event.scancode == KEY_9:
			_on_Button9_pressed()
		elif event.scancode == KEY_MINUS:
			_on_Button_pressed()
		elif event.scancode == KEY_BACKSPACE:
			_on_ButtonClear_pressed()
		elif event.scancode == KEY_DELETE:
			_on_ButtonClearAll_pressed()
