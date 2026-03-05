extends CanvasLayer

var seconds: int = 0
var minutes: int = 0
var nb_enemy_died: int = 0
var nb_friends: int = 0

func onSecondPassed():
	if seconds == 59:
		minutes += 1
		seconds == -1
	
	seconds +=1
	set_text()

func set_text():
	var min_texte = str(minutes) if minutes >=10 else "0"+str(minutes)
	var sec_text = str(seconds) if seconds >= 10 else "0"+str(seconds)
	$%TimeScoreLabel.text = min_texte + ":" + sec_text

func on_enemy_died():
	nb_enemy_died += 1
	%KillScoreLabel.text = str(nb_enemy_died)

func on_friend_joined():
	nb_friends += 1
	%FriendScorelabel.text = str(nb_friends)
	
	if nb_friends == 10 or nb_friends == 100:
		%Sprite2D.global_position = %Sprite2D.global_position + Vector2(-40, 0)
