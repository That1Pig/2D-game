extends Node

#Initially
var playerx = int()
var playery = int()
var playerdamage = 0
var critrate = 10
var critmultiplier = 2
var fullposition = Vector2()
var directionfacing = "right"
var directionfacing_x = ""
var directionfacing_y = ""
var roomprogress = 2
var keyfound = false
var floor = 1

#G:LH:LHGFGL:FG:LHGF:LJGF:LFG: REMEMBER TO ADD KEYROOM AFTER NEW ROOM ENTERED

#Room pool - These are the rooms accessible by the current floor, separated into various links.
#Rooms are added and removed in different floors and conditions
#Once a key room is added, it is removed from the list
#A door room only has an entrance only - No exit. They are added only after the key is obtained

# ----- These represent rooms accessible by an exit -----
#Example: A room with right and up entrance/exits are apart of right and up links

var left_links = ["room_1","room_2","room_3","room_5","room_6","room_7"]
var right_links = ["room_1","room_2","room_4","room_5","room_6"]
var up_links = ["room_3","room_7"]
var down_links = ["room_4"]

#Positions for room linking to work
var linkpos1
var linkpos2

#Ready

