datatype StoryStage = INTRO | MIDDLE | END
datatype Alignment = GOOD | EVIL | NEUTRAL


(* ------------------------ Characters ----------------------------------*)
datatype CharacterClass = PEASANT | RONIN | SOLDIER | KING | EMPEROR
datatype CharacterType = PROTAGONIST | ANTAGONIST | FRIEND | FIEND | EXTRA
type Character = {name : string, align : Alignment, type_ : CharacterType, class : CharacterClass} 

(*--------------------------Objects--------------------------------------*)
datatype Object = CHARACTER of Character

(*--------------------------Locations------------------------------------*)
type Location = {name : string, x : int, y : int}

(*--------------------------Actions--------------------------------------*)
datatype ActionType = KILL | SAVE | DESTROY
type Action = {type_ : ActionType, targets : Object list}

(*--------------------------Methods--------------------------------------*)
fun oppositeAlignment GOOD = EVIL
  | oppositeAlignment NEUTRAL = NEUTRAL
  | oppositeAlignment EVIL = GOOD

fun actionAlignment {type_ = KILL, targets = [CHARACTER x, CHARACTER y]} = oppositeAlignment (#align y)
  | actionAlignment {type_ = DESTROY, targets = _}                       = NEUTRAL
  | actionAlignment {type_ = SAVE, targets = [CHARACTER x, CHARACTER y]} = (case (#align y) of
    		    	     	   	     	      	   	     	   	 GOOD => EVIL
							 		      | _ => NEUTRAL)
