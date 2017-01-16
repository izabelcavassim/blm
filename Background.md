Bayesian linear regresssion (blm)
=================================

`blm` is a R package for fitting linear models in which the statistical analysis were undertaken within the context of Bayesian inference. The ingredients for a regression linear model include the response vector *y* = (*y*<sub>1</sub>, *y*<sub>2</sub>, *y*<sub>3</sub>, ..., *y*<sub>*n*</sub>) and a *n* x *p* design matrix (e.g. composed of explanatory variables) *X* = \[*x*<sub>1</sub>, *x*<sub>2</sub>, ..., *x*<sub>*p*</sub>\]. The linear regression model is composed by an intercept (*w*<sub>0</sub>), a slope (*w*<sub>1</sub>/*β*) and the error term:

*y*<sub>*i*</sub> = *w*<sub>0</sub> + *w*<sub>1</sub><sup>*T*</sup>*x*<sub>*i*</sub> + *Î**µ*, where *Î**µ*<sub>*i*</sub> is *N*(0, *σ*<sup>2</sup>).

Once we have w, *σ*<sup>2</sup>, the predictors and the response variable, the likelihood function can be calculated as follow:

*P*(*y*<sub>*i*</sub>|*w*, *X*, *σ*<sup>2</sup>)=*N*(*w*<sup>*T*</sup>*x*<sub>*i*</sub>, *σ*<sup>2</sup>)

Note that the *σ*<sup>2</sup> can be estimated as 1/*β* where *β* is the precision parameter. In the Bayesian approach, one puts prior distributions on one or both *w* and *σ*<sup>2</sup>. It is obvious to see that as we increase our prior precision we decrease the prior variance and we place greater weight on the prior mean relative to the data.

The peculiarities of the Bayesian model compared to the frequentist model is that allow us to give our assumptions, or prior beliefs, about unknown parameters by specifying the prior distribution over those parameters before seeing the data. The way we do it is by treating the weights (w) as random variables coming from a distribution we have partial knowlegde about (*p*(*w*|*α*)=*N*(0, *α*<sup>−</sup>1*I*)). Once we observe the data we can compute the posterior probability distribution for the parameters, given the observed data (*p*(*w*|*x*, *y*)) and the hyperparameters *α* and *β* *p*(*w*|*x*, *y*, *α*, *β*).

With a bit of math and based on the assumption of conjugate distributions, the posterior distribution is also following a Gaussian normal distribution: *p*(*y* | *x*, **x**, **y**, *α*, *β*)=*N*(*m*(**x**,**y**)′*ϕ*(*x*), *σ*<sup>2</sup>(*x*;**x**,**y**)) where *m*(**x**, **y**) is the mean from the posterior distribution of **w** and where *σ*<sup>2</sup>(*x*; **x**, **y**)=1/*β* + *ϕ*(*x*)′**S**(**x**, **y**) *ϕ*(*x*) where **S**(**x**, **y**) is the covariance matrix from the posterior distribution of **w**.

The posterior distribution can be lately used to:

1.  Make predictions for new data points (by integrating over the posterior distribution, see update.blm).
2.  Account for uncertanty in the parameters values (see confint.blm)

The features of the package have some similarities to the \[lm\]{<https://stat.ethz.ch/R-manual/R-devel/library/stats/html/lm.html>} R package. The blm package is available through github, note that this source is under development (version 0.1.0).
