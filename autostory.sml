datatype StoryStage = INTRO | MIDDLE | END
datatype Alignment = GOOD | EVIL | NEUTRAL

datatype CharacterType = PROTAGONIST | ANTAGONIST | FRIEND | FIEND | EXTRA
type Character = {name:string, align:Alignment, type_:CharacterType} 

datatype Object = CHARACTER of Character

datatype ActionType = KILL | SAVE | DESTROY
type Action = {type_:ActionType, targets : Object list}

fun oppositeAlignment GOOD = EVIL
  | oppositeAlignment NEUTRAL = NEUTRAL
  | oppositeAlignment EVIL = GOOD

fun actionAlignment {type_ = KILL, targets = [CHARACTER x, CHARACTER y]} = oppositeAlignment (#align y)
  | actionAlignment {type_ = SAVE, targets = [CHARACTER x, CHARACTER y]} = (case (#align y) of
    		    	     	   	     	      	   	     	   	 GOOD => EVIL
							 		      | _ => NEUTRAL)
  | actionAlignment {type_ = DESTROY, targets = _}                       = NEUTRAL
