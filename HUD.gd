extends CanvasLayer

signal start_game

func show_message(text, duration = 2.0):
	$Message.text = text
	$Message.show()
	$MessageTimer.wait_time = duration
	$MessageTimer.start()

func show_game_over():
	show_message("Game Over")
	# Wait until the MessageTimer has counted down.
	yield($MessageTimer, "timeout")

	show_message("Dodge the\nCreeps!", 1)
	$StartButton.show()

func update_score(score):
	$ScoreLabel.text = str(score)

func _on_MessageTimer_timeout():
	$Message.hide()

func _on_StartButton_pressed():
	$StartButton.hide()
	emit_signal("start_game")