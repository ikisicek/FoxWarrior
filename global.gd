extends Node

var kill = 0 #broj ubijenih po levelu
var level = 1 #koliko level je otkljucano, 
var total_kill = 0
var coins = 0

var audio = true
var zvukovi = true
var buttons_visible = true
#varijabla za potvrdit da je igrac uhvatio zvjezdu i da se score moze pribrojit trenutnom:
var level_finished = false

##VARIJABLE ZA OTVARANJE SVIJETOVA:

################# killovi po levelu:
var level1_kill = 0

##varijable za balone:
var baloon = 0