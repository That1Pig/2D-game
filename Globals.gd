extends Node

#Initially
var playerx = int()
var playery = int()
var maxhealth = 100
var playerdamage = 0
var critrate = 10
var critmultiplier = 2
var crithit = false
var fullposition = Vector2()
var directionfacing = "right"
var directionfacing_x = ""
var directionfacing_y = ""
var roomprogress = 0
var keyfound = false
var floor = 1
var shortimmunity = false

#Room pool - These are the rooms accessible by the current floor, separated into various links.
#Rooms are added and removed in different floors and conditions
#Once a key room is added, it is removed from the list
#A door room only has an entrance only - No exit. They are added only after the key is obtained

# ----- These represent rooms accessible by an exit -----
#Example: A room with right and up entrance/exits are apart of right and up links

var left_links = ["room_1","room_2","room_3","room_5","room_6","room_7","room_8","room_9","room_10"]
var right_links = ["room_1","room_2","room_4","room_5","room_6","room_8","room_9"]
var up_links = ["room_3","room_7"]
var down_links = ["room_4","room_10"]

#Positions for room linking to work
var linkpos1
var linkpos2

#Rooms that are "in queue" for returning into the list of possible rooms. Exists so that you don't get the same room for at least 2 other rooms
var roompity = []

#Rooms that are not added to the roompity
var bannedrooms = ["entrance","key_room","floor_exit_room_left","floor_exit_room_right"]

func _process(delta):
	if roompity.size() == 2:
		roompity.pop_front()
