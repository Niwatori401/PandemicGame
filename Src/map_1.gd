extends Node

var ZOOM_MINIMUM = 1.0;
var ZOOM_MAXIMUM = 3.0;


func _ready():
	pass;

func _input(event):
	# Zooming
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP and $PlayerCamera.zoom.x < ZOOM_MAXIMUM:
			$PlayerCamera.zoom += Vector2(0.1, 0.1)
		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN and $PlayerCamera.zoom.x > ZOOM_MINIMUM:
			$PlayerCamera.zoom -= Vector2(0.1, 0.1)
	
	# Panning
	elif event is InputEventMouseMotion:
		if event.button_mask & MOUSE_BUTTON_MASK_LEFT:
			var drag_delta = event.relative
			$PlayerCamera.position -= drag_delta / $PlayerCamera.zoom.x
	
	var viewport_size = get_viewport().size;
	# Currently issues on window resize
	#DisplayServer.window_get_size();
	$PlayerCamera.position.x = clampf($PlayerCamera.position.x, viewport_size.x / ($PlayerCamera.zoom.x * 2), (($PlayerCamera.zoom.y * 2 - 1) * viewport_size.x) / ($PlayerCamera.zoom.x * 2))
	$PlayerCamera.position.y = clampf($PlayerCamera.position.y, viewport_size.y / ($PlayerCamera.zoom.y * 2), (($PlayerCamera.zoom.y * 2 - 1) * viewport_size.y) / ($PlayerCamera.zoom.y * 2))

func _process(delta):
	pass
