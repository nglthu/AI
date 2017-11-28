% Environment

% whisker_sensor(S,T) is true if the whisker sensor's state is S at time T
% where S is one of {on, off}.
whisker_sensor(on,T) <-
	was(compass,D,_,T) &
	was(robot_pos,(X,Y),_,T) &
	get_whisker_direction(D,30,right,WD) &
	seeblock(X,Y,12,WD).
whisker_sensor(off,T) <-
	was(compass,D,_,T) &
	was(robot_pos,(X,Y),_,T) &
	get_whisker_direction(D,30,right,WD) &
	notseeblock(X,Y,12,WD).

% compass_deriv(A,T) is true if the robot is to turn an angle of A degrees at time T
compass_deriv(0,T) <-
	steer(straight,T).
compass_deriv(-18,T) <-
	steer(right,T).
compass_deriv(18,T) <-
	steer(left,T).

% assign(compass,C,T) is true if the attribute compass is assigned the value C at time T
assign(compass,C,T) <-
	was(compass,C1,T1,T) &
	compass_deriv(DC,T) &
	update_compass(T1,T,DC,C1,C).

% assign(robot_pos,(X,Y),T) is true if the attribute robot_pos is assigned the
% value (X,Y) at time T
assign(robot_pos,(X,Y),T) <-
	was(robot_pos,(X1,Y1),T1,T) &
	x_deriv(DX,T1) &
	y_deriv(DY,T1) &
	update_robot_pos(X1,Y1,DX,DY,T1,T,X,Y).

% get_whisker_direction(D,A,LR,WD) is true if D is the compass value of the	robot
% A is the angle of the whisker relative to the head direction of the robot,
% LR is whether the whisker is on the left or right side of the robot,
% and WD is the compass value (relative to the horizontal) of the whisker direction.
get_whisker_direction(D,A,right,WD) <-
	WD is D - A.
get_whisker_direction(D,A,left,WD) <-
	WD is D + A.

% update_compass(T1,T,DC,C1,C) is true if T1 is the previous time,
% T is the current time, C1 is the previous compass value,
% DC is the change in compass value, and C is the new compass value.
update_compass(T1,T,DC,C1,C) <-
	C is (C1 + DC * (T - T1) + 360) mod 360.

% update_robot_pos(X1,Y1,DX,DY,T1,T,X,Y) is true if T1 is the previous time,
% T is the current time, (X1,Y1) is the robot's position at time T1,
% (DX,DY) is the change in robot position, and (X,Y) is the new robot position.
update_robot_pos(X1,Y1,DX,DY,T1,T,X,Y) <-
	DT is T - T1 &
	X is X1 + DX * DT &
	Y is Y1 + DY * DT.

%x_deriv(DX,T)
x_deriv(DX,T) <-
	was(compass,D,_,T) &
	DX is cos(D*3.14159265358979344/180).

%y_deriv(DY,T)
y_deriv(DY,T) <-
	was(compass,D,_,T) &
	DY is sin(D*3.14159265358979344/180).

