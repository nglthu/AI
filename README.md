# AI
Artificial Intelligent

## Agent
Is to act the wold. Having an ability to visualize the world, and making up of a body and a controller. 
The body likes a nerve of the system that affects and perceive the world.
The controller likes a brain agent perceiving/ responding command. It has to reason, compute, make a decision, and response.
### Agent properties
Perceive: what going in the world (giving information)
Reason: Think about given information, come with a plan, and make decisions.
Act: Strategies, take actions and impact the environment.

### Architecture
Controller Architecture
![alt text](https://nglthu.github.io/AI/img/controllerArchitecture.png)


#### Robot Controller Hierarchy
##### Example of Robot trap
```
Figure 1 describe a robot trap. It is started its position, give it a goal to G. 
Top layer issue that goal to the middle layer. 
The middle layer tried to forward the goal to the right. 
However, it sees the obstacle, and cannot keep going, then it moves to the left. Then, the obstacles again, turn into left. 
It always keeps tacking to move the right because the goal is in the right until it is actually moving to the right. 
Then, it heads to obstacles again and again.
```

<!-- ![alt text](https://github.com/nglthu/AI/blob/master/mvi/robotTest.gif) -->
<img src="https://nglthu.github.io/AI/mvi/robotTest.gif" height="100%" width="100%">


Figure 1: Robot trap


##### Architecture
Top layer Controller
Middle Layer Controller
Environment

<!-- ![alt text](https://github.com/nglthu/AI/blob/master/img/robot.png) -->
<img src="https://nglthu.github.io/AI/img/robot.png" height="50%" width="50%">

##### Decomposite of the architecture 

<!-- ![alt text](https://github.com/nglthu/AI/blob/master/img/decomposite.png) -->
<img src="https://nglthu.github.io/AI/img/decomposite.png" height="50%" width="50%">

###### Top layer of robot controller

<!-- ![alt text](https://github.com/nglthu/AI/blob/master/img/topLayerController.png) -->
<img src="https://nglthu.github.io/AI/img/topLayerController.png" height="50%" width="50%">

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
###### Middle Layer Controller

<!-- ![alt text](https://github.com/nglthu/AI/blob/master/img/middleLayerController.png) -->
<img src="https://nglthu.github.io/AI/img/middleLayerController.png" height="50%" width="50%">

### More Info

see documentation of robot Controller Architecture [here](robotController/readMe.md)

# Reference
Agent Architectures and Hierarchical Control in: Poole, D. L., & Mackworth, A. K. (2010). Artificial Intelligence: foundations of computational agents. Cambridge University Press. Available online at http://artint.info/

