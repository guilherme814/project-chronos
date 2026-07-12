extends Node
## Núcleo central do jogo. Gerencia o estado global e a troca de cenas.

signal game_started
signal game_paused
signal game_resumed
signal game_saved
signal game_loaded

var current_date: Dictionary = {"year": 1400, "month": 1, "day": 1}
var game_speed: float = 1.0
var is_paused: bool = false

func _ready():
    print("GameManager iniciado.")
    load_default_configuration()

func load_default_configuration():
    pass

func set_game_speed(speed: float):
    game_speed = speed
    Engine.time_scale = speed

func pause_game():
    is_paused = true
    Engine.time_scale = 0.0
    emit_signal("game_paused")

func resume_game():
    is_paused = false
    Engine.time_scale = game_speed
    emit_signal("game_resumed")

func save_game(path: String):
    var file = FileAccess.open(path, FileAccess.WRITE)
    var data = {"date": current_date, "speed": game_speed}
    file.store_string(JSON.stringify(data))
    file.close()
    emit_signal("game_saved")

func load_game(path: String):
    var file = FileAccess.open(path, FileAccess.READ)
    var data = JSON.parse_string(file.get_as_text())
    if data:
        current_date = data["date"]
        game_speed = data["speed"]
        emit_signal("game_loaded")
    file.close()
