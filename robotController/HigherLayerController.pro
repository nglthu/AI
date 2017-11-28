% High Layer Controller

% assign(goal_pos,Coords,T) is true if we can assign the attribute goal_pos
% with value Coords at time T, ie. the last goal is reached at time T.
assign(goal_pos,Coords,T) <-
		arrived(T) &
		was(to_do,[goto(Loc)|_],_,T) &
		at(Loc,Coords).

% assign(to_do,R,T) is true if we can assign the attribute to_do
% with value R at time T, ie. the last goal is reached at time T.
assign(to_do,R,T) <-
		arrived(T) &
		was(to_do,[_|R],_,T).

% arrived(1.0) is a fact.
arrived(1.0).
