# robot controller hierarchy
## Example of Robot trap
```
Figure 1 describe a robot trap. It is started its position, give it a goal to G. 
Top layer issue that goal to the middle layer. 
The middle layer tried to forward the goal to the right. 
However, it sees the obstacle, and cannot keep going, then it moves to the left. Then, the obstacles again, turn into left. 
It always keeps tacking to move the right because the goal is in the right until it is actually moving to the right. 
Then, it heads to obstacles again and again.
```

![alt text](https://github.com/nglthu/AI/blob/master/mvi/robotTest.gif)
Figure 1: Robot trap

![alt text](https://github.com/nglthu/AI/blob/master/img/robot.png)
## Architecture
Top layer Controller
Middle Layer Controller
Environment

### Decomposite of the architecture 
![alt text](https://github.com/nglthu/AI/blob/master/img/decomposite.png)
#### Top layer of robot controller
![alt text](https://github.com/nglthu/AI/blob/master/img/topLayerController.png)

```
if whisker sensor = on
then steer := left
else if straight ahead(robot pos, robot dir, current target pos)
then steer := straight
else if left of (robot position, robot dir, current target pos)
then steer := left
else steer := right
end if
```
#### Middle Layer Controller
![alt text](https://github.com/nglthu/AI/blob/master/img/middleLayerController.png)

# Reference
Agent Architectures and Hierarchical Control in: Poole, D. L., & Mackworth, A. K. (2010). Artificial Intelligence: foundations of computational agents. Cambridge University Press. Available online at http://artint.info/

