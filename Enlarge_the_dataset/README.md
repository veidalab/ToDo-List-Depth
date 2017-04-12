# This is about the Enlargement of the dataset.

The [matlab code](./generateDATA.m) to generate the data from SUN3D

## first experiment:
use the first 30000 exaples in /train as the training data, the 5600 examples in /val as test data.

The experiment terminated after 11 epoches, with an errer seems related to the disc hardware.

I change the code the load up the trained model in epoch 11. But made a mistake that read it from another floder (i.e. another file). The subsequent training dosen't dicrease the loss: [curve](./figure_1.png). So the loss after epoch 11 is meaningless. It's much better than the first experiment of [Drop out](../Drop_out/figure_1.png). The test loss is still descending in epoch 11.

It's trained by Adadelta. Implemented Dropout.
