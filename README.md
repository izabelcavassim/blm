Bayesian linear regresssion (blm)
=================================

`blm` is a R package for fitting linear models in which the statistical analysis were undertaken within the context of Bayesian inference. The ingredients for a regression linear model include the response vector *y* = (*y*<sub>1</sub>, *y*<sub>2</sub>, *y*<sub>3</sub>, ..., *y*<sub>*n*</sub>) and a *n* x *p* design matrix (e.g. composed of explanatory variables) *X* = \[*x*<sub>1</sub>, *x*<sub>2</sub>, ..., *x*<sub>*p*</sub>\] assumed to have been observed without error. The linear regression model is composed by an intercept (*w*<sub>0</sub>), a slope (*w*<sub>1</sub>/*β*) and the error term:

*y*<sub>*i*</sub> = *w*<sub>0</sub> + *w*<sub>1</sub><sup>*T*</sup>*x*<sub>*i*</sub> + *ε*, where *ε*<sub>*i*</sub> is *N*(0, *σ*<sup>2</sup>).

The peculiarities of the Bayesian model compared to the frequentist model is that allow us to give our assumptions, or prior beliefs, about unknown parameters (w) by specifying the prior distribution over those parameters before seeing the data. The way we do it is by treating the weights (w) as random variables coming from a distribution we have partial knowledge about (*p*(*w*|*α*)=*N*(0, *α*<sup>−</sup>1*I*)). Once we observe the data we can compute the posterior probability distribution for the parameters, given the observed data (*p*(*w*|*x*, *y*)) and the hyper parameters *α* and *β*. (for a bit more details access \[<https://github.com/izabelcavassim/blm/blob/master/Background.md>\])

The posterior distribution can be lately used to:

1.  Make predictions for new data points (by integrating over the posterior distribution, see update.blm).
2.  Account for uncertainty in the parameters values (see confint.blm)

The features of the package have some similarities to the \[lm\]{<https://stat.ethz.ch/R-manual/R-devel/library/stats/html/lm.html>} R package. The blm package is just available through github and it is under development (version 0.1.0).

How to install
--------------

Open R and then follow the 3 next steps:

\*1. You first need to install the devtools package through CRAN.

``` r
install.packages("devtools")
```

\*2. Load the package just installed.

``` r
library("devtools")
```

\*3. And then use the 'install\_github' feature to access the blm package

``` r
install_github("izabelcavassim/blm")
```

Usage
-----

Example
-------

``` r
library(datasets)
data("iris")
attach(iris)

# There is a high correlation between petal lenght and sepal length
cor(iris$Petal.Length, iris$Pepal.Length)

# Visualizing it
plot(Sepal.Length, Petal.Length, pch=21, bg=c("red","green3","blue")[unclass(iris$Species)], main="Edgar Anderson's Iris Data", ylab = 'Petal Length', xlab = 'Sepal Length')

# We can predict new Pepal length from Sepal Length
reg = blm(Petal.Length ~ Sepal.Length, alpha = 1, beta = 1.3)
class(reg)
print(reg)
(coef_reg = coefficients(reg))
(summ_reg = summary(reg))

slope = coef_reg[2,1]
intercept = coef_reg[1,1]

# Plotting
plot(reg)

# Prediction of Petal Length given a new data
new_Sepal = data.frame(Sepal.Length = runif(100, min(Sepal.Length), max(Sepal.Length)))

# Predicting
predict_Plength = predict(reg, new_Sepal)
head(predict_Plength)
```

Author(s)
---------

References
----------
