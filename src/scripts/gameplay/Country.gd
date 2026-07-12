extends Resource
class_name Country

@export var country_name: String = ""
@export var tag: String = ""
@export var color: Color = Color.WHITE
@export var gdp: float = 0.0
@export var inflation: float = 0.0
@export var unemployment: float = 0.0
@export var treasury: float = 0.0
@export var population: int = 0
@export var happiness: float = 0.5
@export var stability: float = 0.5
@export var army_size: int = 0
@export var military_power: float = 0.0
@export var tech_level: int = 1
var provinces: Array = []

func _init(p_name: String = "", p_tag: String = ""):
    country_name = p_name
    tag = p_tag

func add_province(province):
    provinces.append(province)

func remove_province(province):
    provinces.erase(province)

func calculate_gdp():
    gdp = 0.0
    for province in provinces:
        gdp += province.gdp
    return gdp

func update(day: int):
    calculate_gdp()
    pass
