Bayesian linear regresssion (blm)
=================================

`blm` is a R package for fitting linear models in which the statistical analysis were undertaken within the context of Bayesian inference. The ingredients for a regression linear model include the response vector *y* = (*y*<sub>1</sub>, *y*<sub>2</sub>, *y*<sub>3</sub>, ..., *y*<sub>*n*</sub>) and a *n**x**p* design matrix (e.g. composed of regressors or explanatory variables) *X* = \[*x*<sub>1</sub>, *x*<sub>2</sub>, ..., *x*<sub>*p*</sub>\] assumed to have been observed without error. The linear regression model is composed by an intercept (*w*<sub>0</sub>), slope (*w*<sub>1</sub>/*β*) and the error term:

*y*<sub>*i*</sub> = *w*<sub>0</sub> + *w*<sub>1</sub>*x*<sub>*i*</sub> + *ε*, where ε\_i is *N*(0, *σ*<sup>2</sup>).

Note that the *σ*<sup>2</sup> can be estimated as 1/*β* where *β* is the precision parameter. In the Bayesian approach, one puts prior distributions on one or both *w* and *σ*<sup>2</sup>. It is obvious to see that as we increase our prior precision we decrease the prior variance and we place greater weight on the prior mean relative to the data. The peculiarities of the Bayesian model compared to the frequentist model is that allow us to give our assumptions, or prior beliefs, about unknown parameters by specifying the prior distribution over those parameters before seeing the data. Once we observe the data we can compute the posterior probability distribution for the parameters, given the observed data. The posterior distribution can be lately used to:

*Item 1 Make predictions for new data points (by integrating over the posterior distribution). *Item 2 Account for uncertanty in the parameters values

I NEED TO FINISH IT, NOT SURE IF I WILL LEAVE ALL THIS BIG TEXT HERE

The features of the package have some similarities to the \[lm\]{<https://stat.ethz.ch/R-manual/R-devel/library/stats/html/lm.html>} R package. The blm package is available through github, note that this source is under development (version 0.1.0).

How to install
--------------

Open R and then follow the 3 next steps:

1.  You first need to install the devtools package through CRAN.

``` r
install.packages("devtools")
```

1.  Load the package just installed.

``` r
library("devtools")
```

1.  And then use the 'install\_github' feature to access the blm package

``` r
install_github("izabelcavassim/blm")
```

Usage
-----

Example
-------
