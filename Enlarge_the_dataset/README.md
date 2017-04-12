# This is about the Enlargement of the dataset.

The [matlab code](./generateDATA.m) to generate the data from SUN3D

## first experiment:
use the first 30000 exaples in /train as the training data, the 5600 examples in /val as test data.

The experiment terminated after 11 epoches, with an errer seems related to the disc hardware.

I change the code the load up the trained model in epoch 11. But made a mistake that read it inside the training loop. The subsequent training dosen't dicrease the loss: [curve](./figure_1.png). Much better than the first experiment of [Drop out](../Drop_out/figure_1.png)

It's trained by Adadelta. Implemented Dropout.
