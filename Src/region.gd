extends Node

@export var region_graphic: Texture2D;

@export var region_name: String;
@export var healthy_population: int;
@export var infected_population: int;
@export var dead_population: int;

@export var hospital_effectiveness: float;
@export var clean_water_access: float;

var borders_open: bool = true;
var airports_open: bool = true;
var boatports_open: bool = true;
var public_transit_open: bool = true;


func _ready():
	$CountrySprite.set_texture(region_graphic);

func _process(delta):
	$CountrySprite.modulate.r -= delta;
	pass

func get_external_spread_factor():
	pass
	
	

func get_total_population():
	return self.dead_population + self.healthy_population + self.infected_population
