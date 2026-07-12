extends Resource
class_name Province

@export var province_name: String = ""
@export var owner_country: Country = null
@export var area: float = 0.0
@export var altitude: float = 0.0
@export var climate: String = "temperate"
@export var biome: String = "plains"
@export var temperature: float = 20.0
@export var resources: Dictionary = {
    "iron": 0, "coal": 0, "oil": 0, "gas": 0,
    "uranium": 0, "lithium": 0, "copper": 0,
    "wood": 0, "gold": 0, "diamond": 0,
    "water": 0, "rare_earth": 0, "fish": 0, "fertile_soil": 0
}
@export var infrastructure_level: int = 1
@export var urbanization: float = 0.0
@export var gdp: float = 0.0
@export var production: float = 0.0
@export var population: int = 0
@export var happiness: float = 0.5

func _init(p_name: String = ""):
    province_name = p_name

func get_resource(resource_name: String) -> int:
    return resources.get(resource_name, 0)

func set_resource(resource_name: String, amount: int):
    resources[resource_name] = amount
