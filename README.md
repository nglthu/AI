# AI
This page is to demo a basic Robot Controller Architecture work using a general-purpose logic programming language, Prolog.

## Agent
An Agent is to act the wold. It has an ability to visualize the world, and make up of a body and a controller. 

1. The body likes a nerve of the system that affects and perceive the world.
2. The controller likes a brain agent perceiving or responding command. It has to reason, compute, make a decision, and response.

## Agent properties

1. Perceive: what going in the world (giving information)
2. Reason: Think about given information, come with a plan, and make decisions.
3. Act: Strategies, take actions and impact the environment.

## Example of Robot trap

![alt text](https://nglthu.github.io/AI/img/controllerArchitecture.png)

Figure 1. Controller Architecture

The general controller architecture is described in Figure 1 which includes Top layer Controller, Middle Layer Controller and Environment.


The robot trap is run as a demo in Figure 2. The robot is started at its position, and is given a goal to G. 

The logic is followed:

1. Top layer issue that goal to the middle layer. 
2. The middle layer tried to forward the goal to the right. 
3. However, it sees the obstacle, and cannot keep going, then it moves to the left. 
4. Then, the obstacles again, turn into left. 
5. It always keeps tacking to move the right because the goal is in the right until it is actually moving to the right. 
6. Then, it heads to obstacles again and again.


<!-- ![alt text](https://github.com/nglthu/AI/blob/master/mvi/robotTest.gif) -->
<!-- ![alt text](https://nglthu.github.io/AI/mvi/robotTest.gif) -->
### Run Demo

<img src="/mvi/robotTest.gif" height="100%" width="100%"> 
            Figure 2: Robot trap

## Architecture

1. Top layer Controller
2. Middle Layer Controller
3. Environment

<!-- ![alt text](https://github.com/nglthu/AI/blob/master/img/robot.png) -->
<img src="https://nglthu.github.io/AI/img/robot.png" height="50%" width="50%">

## Decomposite of the architecture 

<!-- ![alt text](https://github.com/nglthu/AI/blob/master/img/decomposite.png) -->
<img src="https://nglthu.github.io/AI/img/decomposite.png" height="50%" width="50%">

### Top layer of robot controller

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
### Middle Layer Controller

<!-- ![alt text](https://github.com/nglthu/AI/blob/master/img/middleLayerController.png) -->
<img src="https://nglthu.github.io/AI/img/middleLayerController.png" height="50%" width="50%">

### More Info

See documentation of robot Controller Architecture [here](robotController/readMe.md)

# Reference
Agent Architectures and Hierarchical Control in: Poole, D. L., & Mackworth, A. K. (2010). Artificial Intelligence: foundations of computational agents. Cambridge University Press. Available online at http://artint.info/

