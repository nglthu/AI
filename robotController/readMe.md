# robot controller hierarchy
![alt text](https://github.com/nglthu/AI/blob/master/img/robot.png)

```
It is started its position, give it a goal to G. 
Top layer issue that goal to the middle layer. 
The middle layer tried to forward the goal to the right. 
However, it sees the obstacle, and cannot keep going, then it moves to the left. Then, the obstacles again, turn into left. It always keeps tacking to move the right because the goal is in the right until it is actually moving to the right. Then, it heads to obstacles again and again.
```

![alt text](https://github.com/nglthu/AI/blob/master/mvi/robotTest.gif)