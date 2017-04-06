# ToDo-List-Depth
This is the short and long term to-do list of training Network to predect depth

## About the training dataset
### Enlarge the Dataset
### Fill the holes (pixels that the depth is not available)

## About the network
### Architecture:
#### [Drop Out](./Drop out/README.md) (to prevent overfitting)
#### Residual net (good for deeper net)

### Format of Depthmap and loss function
#### log depth
#### invers depth
#### scale invariant metric

### Optimization Method
#### [Adadelta](https://arxiv.org/abs/1212.5701)
#### [Adam](https://arxiv.org/abs/1412.6980v8)

## Long term goals
### Unspervised learning (by predict and compare to the next t+n frame) of depth or optical flow
### Train an Discriminator as supervisor
