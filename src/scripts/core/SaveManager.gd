extends Node

const SAVE_DIR = "user://saves/"
const SAVE_EXTENSION = ".save"

func _ready():
    if not DirAccess.dir_exists_absolute(SAVE_DIR):
        DirAccess.make_dir_absolute(SAVE_DIR)

func save_game(save_name: String, data: Dictionary):
    var file = FileAccess.open(SAVE_DIR + save_name + SAVE_EXTENSION, FileAccess.WRITE)
    file.store_string(JSON.stringify(data))
    file.close()
    print("Jogo salvo: " + save_name)

func load_game(save_name: String) -> Dictionary:
    var file = FileAccess.open(SAVE_DIR + save_name + SAVE_EXTENSION, FileAccess.READ)
    if file:
        var data = JSON.parse_string(file.get_as_text())
        file.close()
        return data
    return {}

func get_save_list() -> Array:
    var saves = []
    var dir = DirAccess.open(SAVE_DIR)
    if dir:
        dir.list_dir_begin()
        var file_name = dir.get_next()
        while file_name != "":
            if file_name.ends_with(SAVE_EXTENSION):
                saves.append(file_name.trim_suffix(SAVE_EXTENSION))
            file_name = dir.get_next()
        dir.list_dir_end()
    return saves

func delete_save(save_name: String):
    var path = SAVE_DIR + save_name + SAVE_EXTENSION
    if FileAccess.file_exists(path):
        DirAccess.remove_absolute(path)
