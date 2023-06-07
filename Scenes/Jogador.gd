extends KinematicBody2D

var direcao = Vector2(0,0)
export var velocidade = 100
var frente

func _physics_process(delta):
	definir_movimento()
	definir_animacao()
	move_and_slide(direcao * velocidade)

func definir_movimento():
	direcao.x = Input.get_axis("esquerda","direita")
	direcao.y = Input.get_axis("cima","baixo")
	definir_direcao()

func definir_animacao():
	if direcao.x == 0 and direcao.y == 0:
		$AnimatedSprite.stop()
	else:
		$AnimatedSprite.play("andar"+frente)

func definir_direcao():
	if direcao.x > 0:
		frente = "_direita"
	elif direcao.x < 0:
		frente = "_esquerda"
	elif direcao.y < 0:
		frente = "_cima"
	elif direcao.y > 0:
		frente = "_baixo"
