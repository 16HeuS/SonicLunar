@tool
extends Hazard

@onready var sawSprite = $AnimatedSprite2D
@export_enum("Green", "Silver") var type = 0
var sawTextures = [
	preload("res://Graphics/Hazards/sawGreen_spritesheet.png"), 
	preload("res://Graphics/Hazards/sawSilver_spritesheet.png")
]

var typeMemory = type

func _ready():
	set_sawblade()  # Definindo a serra na inicialização

func _process(_delta):
	if Engine.is_editor_hint():
		if typeMemory != type:
			typeMemory = type
			set_sawblade()  # Alterando a textura da serra dinamicamente no editor
	
	if playerHit.size() > 0:  # Se houver jogadores atingidos
		for i in playerHit:
			if i.has_method("hit_player"):
				i.hit_player(global_position, damageType)  # Aciona o método de dano no jogador

# Função para configurar a serra, tanto gráficos quanto animação
func set_sawblade():
	if type == 0:
#		sawSprite.set_frame("green",sawTextures[0])  # Troca a textura para a serra verde
		sawSprite.play("green")  # Define a animação 'green'
	elif type == 1:
#		sawSprite.set_frame("silver",sawTextures[1])  # Troca a textura para a serra prateada
		sawSprite.play("silver")  # Define a animação 'silver'

# Adiciona o corpo ao array de atingidos ao entrar
func _on_body_entered(body):
	if not playerHit.has(body):
		playerHit.append(body)

# Remove o corpo do array ao sair
func _on_body_exited(body):
	if playerHit.has(body):
		playerHit.erase(body)
