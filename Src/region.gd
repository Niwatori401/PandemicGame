extends Node
signal show_info(region_info_dto: Dictionary)


@export var region_graphic: Texture2D;
@export var starting_color: Color = Color.DARK_GREEN;
@export var highlight_color: Color = Color(.2,.2,.2,1);
var should_be_highlighted: bool = false;
@export var ending_color: Color;
var current_color: Color = starting_color;

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
	$CountrySprite.set_modulate(starting_color);
	var bitmap = BitMap.new();
	var image = region_graphic.get_image()

	
	bitmap.create_from_image_alpha(image);
	
	# Make second argument smaller for more detailed polygons.
	var shapes = bitmap.opaque_to_polygons(Rect2(Vector2(), bitmap.get_size()), 1);
	
	for shape in shapes:
		var new_collision_polygon = CollisionPolygon2D.new();
		new_collision_polygon.visible = false;
		
		# These need offset; not sure why.
		for i in range(shape.size()):
			shape[i][0] -= 960
			shape[i][1] -= 539
			
		new_collision_polygon.polygon = shape;
		$CountrySprite/Hitbox.add_child(new_collision_polygon);
		
	

func _process(delta):
	pass
	

func get_total_population():
	return self.dead_population + self.healthy_population + self.infected_population


func _on_hitbox_mouse_entered():
	$CountrySprite.set_modulate(self.highlight_color);


func _on_hitbox_mouse_exited():
	$CountrySprite.set_modulate(self.current_color);

# On click of region
func _on_hitbox_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		emit_signal("show_info", {"region_name":self.region_name});
