extends GridContainer

signal ButtonPressed(value)
signal MinusButtonPressed()
signal ClearButtonPressed()
signal ClearAllButtonPressed()


func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.is_pressed() and not event.is_echo():
		if event.scancode == KEY_0:
			_on_Button0_pressed(event)
		elif event.scancode == KEY_1:
			_on_Button1_pressed(event)
		elif event.scancode == KEY_2:
			_on_Button2_pressed(event)
		elif event.scancode == KEY_3:
			_on_Button3_pressed(event)
		elif event.scancode == KEY_4:
			_on_Button4_pressed(event)
		elif event.scancode == KEY_5:
			_on_Button5_pressed(event)
		elif event.scancode == KEY_6:
			_on_Button6_pressed(event)
		elif event.scancode == KEY_7:
			_on_Button7_pressed(event)
		elif event.scancode == KEY_8:
			_on_Button8_pressed(event)
		elif event.scancode == KEY_9:
			_on_Button9_pressed(event)
		elif event.scancode == KEY_MINUS:
			_on_Button_pressed(event)
		elif event.scancode == KEY_BACKSPACE:
			_on_ButtonClear_pressed(event)
		elif event.scancode == KEY_DELETE:
			_on_ButtonClearAll_pressed(event)

func _on_Button7_pressed(event: InputEvent) -> void:
	emitButtonSignal(event,"ButtonPressed", 7)

func _on_Button8_pressed(event: InputEvent) -> void:
	emitButtonSignal(event,"ButtonPressed", 8)

func _on_Button9_pressed(event: InputEvent) -> void:
	emitButtonSignal(event,"ButtonPressed", 9)

func _on_Button4_pressed(event: InputEvent) -> void:
	emitButtonSignal(event,"ButtonPressed", 4)

func _on_Button5_pressed(event: InputEvent) -> void:
	emitButtonSignal(event,"ButtonPressed", 5)

func _on_Button6_pressed(event: InputEvent) -> void:
	emitButtonSignal(event,"ButtonPressed", 6)

func _on_Button1_pressed(event: InputEvent) -> void:
	emitButtonSignal(event,"ButtonPressed", 1)

func _on_Button2_pressed(event: InputEvent) -> void:
	emitButtonSignal(event,"ButtonPressed", 2)

func _on_Button3_pressed(event: InputEvent) -> void:
	emitButtonSignal(event,"ButtonPressed", 3)

func _on_Button0_pressed(event: InputEvent) -> void:
	emitButtonSignal(event,"ButtonPressed", 0)

func _on_ButtonClear_pressed(event: InputEvent) -> void:
	emitButtonSignal(event,"ClearButtonPressed")

func _on_ButtonClearAll_pressed(event: InputEvent) -> void:
	emitButtonSignal(event,"ClearAllButtonPressed")

func _on_Button_pressed(event: InputEvent) -> void:
	emitButtonSignal(event,"MinusButtonPressed")

func emitButtonSignal(event: InputEvent, eventName: String, value: int = -1) -> void:
	# TODO Fix calling for signals and mark events as handled
	if value > -1:
		emit_signal(eventName, value)
	else:
		emit_signal(eventName)
	event.echo = false
