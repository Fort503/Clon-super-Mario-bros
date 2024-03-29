extends StaticBody2D
@onready var animacion = $AnimatedSprite2D
@export var bloque:PackedScene

func _on_area_2d_bloque_area_entered(area):
	if animacion.animation != "vacio":
		animacion.play("vacio")
		lanzarObjeto()
	
func lanzarObjeto():
	var instanciaBloque = bloque.instantiate()
	get_tree().root.call_deferred("add_child", instanciaBloque)
	instanciaBloque.global_position = global_position
