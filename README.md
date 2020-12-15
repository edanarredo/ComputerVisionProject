Adaptive Boosting is a popular ML technique that uses weak binary classifiers to construct stronger ones based on previous results. Compared to other learning methods, an Adaboost model is quite easy to implement and can tolerate a decent amount of excess noise from the training or testing data. In this project, the Adaptive Boosting method was applied in order to detect faces.

To run, change the path variables in `directories.m` to wherever the files will be stored locally on your system.

Then on the MATLAB terminal, run the following in this sequence (make sure to change to the appropriate directory).

```
  >> directories
  >> make_test_dataset
  >> train
  >> directories
  >> test
```
