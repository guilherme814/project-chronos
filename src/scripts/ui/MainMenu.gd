extends Control

func _ready():
    $VBoxContainer/NewGameButton.pressed.connect(_on_new_game_pressed)
    $VBoxContainer/LoadGameButton.pressed.connect(_on_load_game_pressed)
    $VBoxContainer/SettingsButton.pressed.connect(_on_settings_pressed)
    $VBoxContainer/QuitButton.pressed.connect(_on_quit_pressed)

func _on_new_game_pressed():
    get_tree().change_scene_to_file("res://src/scenes/game/ScenarioSelection.tscn")

func _on_load_game_pressed():
    var load_dialog = load("res://src/scenes/menu/LoadGameDialog.tscn").instantiate()
    add_child(load_dialog)

func _on_settings_pressed():
    get_tree().change_scene_to_file("res://src/scenes/settings/SettingsMenu.tscn")

func _on_quit_pressed():
    get_tree().quit()
