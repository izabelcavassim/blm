
library(datasets)
data("iris")
attach(iris)
library(blm)

# There is a high correlation between Petal Lenght and sepal Length
cor(iris$Petal.Length, iris$Sepal.Length)

# Visualizing it
plot(Sepal.Length, Petal.Length, col=c("red", "green", "blue")[Species], pch=(15:17)[Species], main="Edgar Anderson's Iris Dataset", ylab = 'Petal Length (cm)', xlab = 'Sepal Length (cm)')
legend("topleft", legend=c(levels(iris$Species)), col=c("red", "green", "blue"), pch=c(15:17, -1, -1), lty=c(-1, -1, -1))

# We can model the relationship between Petal length and Sepal length
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

predict_Plength = predict(reg, new_Sepal)
head(predict_Plength)