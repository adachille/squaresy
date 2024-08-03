extends Node2D

@onready var collision_polygon_2d = $CollisionPolygon2D
@onready var polygon_2d = $CollisionPolygon2D/Polygon2D


func _ready():
	polygon_2d.polygon = collision_polygon_2d.polygon


func _process(delta):
	pass
