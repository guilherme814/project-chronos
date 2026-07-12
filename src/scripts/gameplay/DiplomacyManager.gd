extends Node

var relations: Dictionary = {}

func _ready():
    initialize_relations()

func initialize_relations():
    pass

func get_relation(country_a: String, country_b: String) -> float:
    var key = country_a + "-" + country_b
    return relations.get(key, 0.0)

func set_relation(country_a: String, country_b: String, value: float):
    var key = country_a + "-" + country_b
    relations[key] = value
    var key_rev = country_b + "-" + country_a
    relations[key_rev] = value

func declare_war(attacker: Country, defender: Country):
    set_relation(attacker.tag, defender.tag, -1.0)
    print(attacker.country_name + " declarou guerra a " + defender.country_name)

func make_peace(country_a: Country, country_b: Country):
    set_relation(country_a.tag, country_b.tag, 0.0)
    print(country_a.country_name + " e " + country_b.country_name + " fizeram paz")
