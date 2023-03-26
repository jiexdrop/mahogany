extends GridMap

@onready var gridMap = $"."
@onready var camera = $"../Camera3D"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
const RAY_LENGTH = 1000.0
var oldItemPos;

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == 1:
		var from = camera.project_ray_origin(event.position)
		var to = from + camera.project_ray_normal(event.position) * RAY_LENGTH
	
		var query = PhysicsRayQueryParameters3D.create(from,to)
		var collision = get_world_3d().direct_space_state.intersect_ray(query)

		if not collision.is_empty():
			var pos = local_to_map(collision.position)
			oldItemPos = pos;
			set_cell_item(pos, 0, 0)



