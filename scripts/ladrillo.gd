extends StaticBody2D

func _on_area_2d_ladrillo_area_entered(area):
	if area.get_parent().esGrande:
		queue_free()
