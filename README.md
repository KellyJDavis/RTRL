<p align="center">
  <img src="https://github.com/kdavis-mozilla/RTRL/blob/master/doc/RTRL.gif" alt="Fully Connected Neural Network"/>
</p>

# RTRL

*RTRL* is a [CUDA](http://en.wikipedia.org/wiki/CUDA) based implementation of the real time recurrent learning algorithm as first described by [Ronald J. Williams](http://www.ccs.neu.edu/home/rjw/) and [David Zipser](http://www.cogsci.ucsd.edu/~zipser/) in *[A Learning Algorithm for Continually Running Fully Recurrent Neural Networks](http://www.mitpressjournals.org/doi/abs/10.1162/neco.1989.1.2.270#.VV2rBaKX2Aw)*.

## Quick Start

### Dependencies

*RTRL* has the following dependencies:

* [cusplibrary](https://github.com/cusplibrary/cusplibrary) v0.5.1 or later.

### Building the Executable

Once the dependencies are installed and the environment is set up to allow their access, one can compile *RTRL* by opening a terminal and entering the following commands:

```
localhost:~ kdavis$ cd <RTRL Root Directory>
localhost:RTRL kdavis$ make
```

This compiles the *RTRL* executable `rtrl` and places it into the RTRL root directory.
