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

<!-- ![alt text](https://github.com/nglthu/AI/blob/master/mvi/robotTest.gif) -->
<img src="https://github.com/nglthu/AI/blob/master/mvi/robotTest.gif" height="100%" width="100%">


Figure 1: Robot trap


## Architecture
Top layer Controller
Middle Layer Controller
Environment
<!-- ![alt text](https://github.com/nglthu/AI/blob/master/img/robot.png) -->
<img src="https://github.com/nglthu/AI/blob/master/img/robot.png" height="80%" width="80%">

### Decomposite of the architecture 
<!-- ![alt text](https://github.com/nglthu/AI/blob/master/img/decomposite.png) -->
<img src="https://github.com/nglthu/AI/blob/master/img/decomposite.png" height="80%" width="80%">
#### Top layer of robot controller
<!-- ![alt text](https://github.com/nglthu/AI/blob/master/img/topLayerController.png) -->
<img src="https://github.com/nglthu/AI/blob/master/img/topLayerController.png" height="80%" width="80%">

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
<!-- ![alt text](https://github.com/nglthu/AI/blob/master/img/middleLayerController.png) -->
<img src="https://github.com/nglthu/AI/blob/master/img/middleLayerController.png" height="80%" width="80%">


# Reference
Agent Architectures and Hierarchical Control in: Poole, D. L., & Mackworth, A. K. (2010). Artificial Intelligence: foundations of computational agents. Cambridge University Press. Available online at http://artint.info/

