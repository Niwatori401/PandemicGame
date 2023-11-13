extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	var regions = get_tree().get_nodes_in_group("region")
	for region in regions:
		region.connect("show_info", self._on_show_info);

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_show_info(show_info_dto: Dictionary):
	pass;
	#print(show_info_dto["region_name"]);
