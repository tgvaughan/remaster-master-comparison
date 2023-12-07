ReMASTER/MASTER Running Time Comparisons
========================================

This repository contains the BEAST 2 XMLs and other scripts used
to produce the comparison of running times of ReMASTER and MASTER
reconstructed birth-death tree simulations, as reported in the
manuscript [ReMASTER: improved phylodynamic simulation for BEAST 2.7](https://www.biorxiv.org/content/10.1101/2023.10.09.561485v1.abstract).

Requirements
------------

To repeat this comparison, you'll need to install the following software:

* BEAST 2.7 (https://beast2.org)
* MASTER (https://tgvaughan.github.io/MASTER)
* ReMASTER (https://tgvaughan.github.io/ReMASTER)

In addition, you'll need a recent [R](https://www.r-project.org)
installation including the [TidyVerse](https://www.tidyverse.org)
suite of packages to plot the results.

Performing the comparison
-------------------------

With the required software installed, simply clone this repository
onto the machine on which the running time comparison is to be
executed.  Then, from a terminal, change to the root directory of this
repository and run:
```sh
$ ./do_compare.sh
```

This will take a few minutes to complete.  Once finished, the running
times should be recorded in the file `times.txt` in the same
directory.

Plotting the results
--------------------

Once these results are in place, the plot shown in the manuscript  can be produced by running
```sh
$ Rscript make_plot.R
```

This will generate a file named `time_comparison.pdf` which will contain
a figure equivalent to that shown in the manuscript.
(Note that, while the trends of the running times should match those shown
in the manuscript, absolute times may differ as these are affected by the
specific hardware used to run the simulations.)
