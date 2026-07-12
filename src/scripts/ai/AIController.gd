extends Node

enum AIState { IDLE, EXPAND, DEFEND, TRADE, BUILD }

var country: Country
var current_state: AIState = AIState.IDLE
var state_timer: float = 0.0
var decision_interval: float = 10.0

func _ready():
    if country == null:
        country = Country.new("AI", "AIA")

func _process(delta):
    state_timer += delta
    if state_timer >= decision_interval:
        make_decision()
        state_timer = 0.0

func make_decision():
    if country.treasury > 1000 and country.army_size < 100:
        current_state = AIState.BUILD
    elif country.military_power > 50:
        current_state = AIState.EXPAND
    else:
        current_state = AIState.IDLE
    execute_state()

func execute_state():
    match current_state:
        AIState.IDLE:
            pass
        AIState.BUILD:
            country.treasury -= 100
            country.army_size += 10
            print(country.country_name + " construiu exército.")
        AIState.EXPAND:
            print(country.country_name + " busca expandir.")
        AIState.DEFEND:
            pass
        AIState.TRADE:
            pass
