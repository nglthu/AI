% Middle Layer Controller

% goal_direction(G,T) is true if at time T, the direction of the goal
% from the robot's current position is G degrees.
goal_direction(G,T) <-
	was(robot_pos,(X0,Y0),T1,T) &
	was(goal_pos,(X1,Y1),T2,T) &
	direction((X0,Y0),(X1,Y1),G).

% at time 1, there is no previous goal_pos, so just assume it is straight
goal_direction(0,1).

% goal_is(D,T) if the position of the goal is on the D-hand-side of the
% robot's current position at time T.  D is one of {left, right, straight}.
goal_is(left,T) <-
	goal_direction(G,T) &
	was(compass,C,_,T) &
	is_left(G,C).
goal_is(straight,T) <-
	goal_direction(G,T) &
	was(compass,C,_,T) &
	is_straight(G,C).
goal_is(right,T) <-
	goal_direction(G,T) &
	was(compass,C,_,T) &
	is_right(G,C).

% steer(D,T) is true if the robot is to steer in the direction D at time T
% where D is one of {left, right, straight}.
steer(D,T) <-
	whisker_sensor(off,T) &
	goal_is(D,T).
steer(left,T) <-
	whisker_sensor(on,T).

% arrived(T) is true if the robot arrives at the current goal at time T.
arrived(T) <-
	was(goal_pos,Goal_Coords,_,T) &
	was(robot_pos,Robot_Coords,_,T) &
	close_enough(Goal_Coords,Robot_Coords).

% direction((X0,Y0),(X1,Y1),Dir) is true if Dir is the angle, in degrees,
% of the vector from (X0,Y0) to (X1,Y1) with the horizontal.
direction((X0,Y0),(X1,Y1),Dir) <-
	Y0 =< Y1 &
	Dir is 180 * acos( (X1-X0) / sqrt( square(X1-X0) + square(Y1-Y0) ) ) / 3.141592653589793 .
direction((X0,Y0),(X1,Y1),Dir) <-
	Y0 > Y1 &
	Dir is 360 - 180 * acos( (X1-X0) / sqrt( square(X1-X0) + square(Y1-Y0) ) ) / 3.141592653589793 .

% is_left(G,C) is true if the angle G is on the left of the angle C (both in degrees).
is_left(G,C) <-
	((G - C + 540) mod 360) - 180 > 11 .

% is_right(G,C) is true if the angle G is on the right of the angle C (both in degrees).
is_right(G,C) <-
	((G - C + 540) mod 360) - 180 < -11 .

% is_straight(G,C) is true if the angle G is straight ahead of the angle C (both in degrees).
is_straight(G,C) <-
	abs( ((G - C + 540) mod 360) - 180) =< 11 .

% close_enough((X0,Y0),(X1,Y1)) is true if the Euclidean distance between the
% two coordinates is less than 3.0
close_enough((X0,Y0),(X1,Y1)) <-
	abs( square(X1 - X0) +  square(Y1 - Y0) ) < 9.0 .
