# Regression Models

**Error minimization**:
- Basic Least Squares:
    Takes each points and calculates the verticle distance of the point <img src="https://render.githubusercontent.com/render/math?math=$(x_{i}%2Cy_{i})$">,in vector 
    space to the to a point on the regressor <img src="https://render.githubusercontent.com/render/math?math=$(x_{i}\beta%2Cy_{i})$">  
    i.e, <img src="https://render.githubusercontent.com/render/math?math=$y_{i}-x_{i}\beta$">  
    And the MSE can be defined as, <img src="https://render.githubusercontent.com/render/math?math=$(y_{i}%2Dx_{i}\beta)^{2}$"> we do
    this for each point in the dataset so each point contributes equally to the 
    error rate, tries to find the best slope.
    The **lm()** function in R can be used to fit a regression line 
    
  Ordinary least squares (OLS) is the workhorse of statistics. It gives a way of
  taking complicated outcomes and explaining behavior (such as trends) using 
  linearity. The simplest application of OLS is fitting a line through some data.
  
**Centering**: Taking all the datapoints and subtracting each minus the mean, 
the new vector will have a mean equal to zero  
<img src="https://render.githubusercontent.com/render/math?math=$\tilde{X}_{i}=X_{i}%2D\bar{X}$">  
where,  
<img src="https://render.githubusercontent.com/render/math?math=$\bar{X}=\sum_{i=1}^{n}X_{i}$">  

**Scaling**: Taking all the datapoint and dividing each by the standard deviation
gives a vector of datapoints which has standard deviation equal to 1  
<img src="https://render.githubusercontent.com/render/math?math=$\tilde{X}_{i}=\frac{X_{i}}{\mathrm{s}}$">  
where,  
<img src="https://render.githubusercontent.com/render/math?math=$\mathrm{s}^{2}=\frac{1}{n%2D1}\sum_{i=1}^{n}(X_{i}%2D\bar{X})^{2}=\frac{1}{n%2D1}\sum_{i=1}^{n}(X_{i}^{2}%2Dn\bar{X}^{2})$">  
and <img src="https://render.githubusercontent.com/render/math?math=$\mathrm{s}=\sqrt{\mathrm{s}^{2}}$">  

**Normalization**: Subtract each datapoint with mean and then divide this 
quantity by the standard deviation(performing centering and scaling in that 
order) gives a vector of datapoints that is centered around 0 and with standard 
deviation 1.  
and <img src="https://render.githubusercontent.com/render/math?math=$\mathrm{Z}_{i}=\frac{X_{i}%2D\bar{X}}{\mathrm{s}}$">  

Subtracting the means to eliminate the intercept is a special case of a general technique which is sometimes called Gaussian Elimination.  
  
**Covariance**: 
<img src="https://render.githubusercontent.com/render/math?math=$Cov(X,Y) = \frac{1}{n%2D1}\sum_{i=1}^{n}(X_{i}%2D\bar{X})(Y_{i}%2D\bar{Y})=\frac{1}{n%2D1}\sum_{i=1}^{n}(X_{i}Y_{i}%2Dn\bar{X}\bar{Y})$">  
Then the correlation is simply the covariance standardized into a unitless 
quantity.  
<img src="https://render.githubusercontent.com/render/math?math=$Cor(X,Y) = \frac{Cov(X,Y)}{s_{x}s_{y}}$">   

<img src="https://render.githubusercontent.com/render/math?math=$Cor(X,Y)=Cor(Y,X)$">  

### Regression model example
We use a model to describe the process that results in the data
that are observed, one such model is the linear regression model.  
Fitting a model with y-intercept to find the height of the child given the 
parent's height.  
Then the line of best fit would be:  
Child's Height = <img src="https://render.githubusercontent.com/render/math?math=$\beta_{0}$"> + Parent's Height <img src="https://render.githubusercontent.com/render/math?math=$\beta_{1}$">  
which is of the general form of equation of a line: **y = mx + c**, where  
**y** is the quantity we want to estimate,  
**m** is the slope of the regressor,  
**c** is the y-intercept,  
**x** is the independent variable using which we determine the dependent variable y

We use least squares to estimate the value **y**
<img src="https://render.githubusercontent.com/render/math?math=$\sum_{i=1}^{n}\left(Y_{i}-(\beta_{0}+\beta_{1}X_{i})\right)^{2}$">  

When we're fitting a linear model,  
<img src="https://render.githubusercontent.com/render/math?math=$Y = \hat{\beta}_{0}%2B\hat{\beta}_{1}X$">  

where,  

<img src="https://render.githubusercontent.com/render/math?math=$\hat{\beta}_{1} = Cor(Y,X)\frac{s_{y}}{s_{x}}$">  
<img src="https://render.githubusercontent.com/render/math?math=$\hat{\beta}_{0} = \bar{Y}%2B\hat{\beta}_{1}\bar{X}$">  

If the data were to be normalized then the slope of the line <img src="https://render.githubusercontent.com/render/math?math=$Y = \hat{\beta}_{0}%2B\hat{\beta}_{1}\tilde{X}$"> i.e <img src="https://render.githubusercontent.com/render/math?math=$\hat{\beta}_{1}$"> would simply
be the correlation of X and y, <img src="https://render.githubusercontent.com/render/math?math=$Cor(X,Y)$">  

We observe in general that the children of tall parent tend to be tall but not 
as tall as their parent, and the children of short parent tend to be short but 
taller than their parents. This can be explained by the phenomenon known as the
**regression to the mean**, Regression to the mean, was invented by Francis 
Galton in the paper - "Regression towards mediocrity in hereditary stature".

## Statistical regression models

* **Interpreting the regression coefficients**
For <img src="https://render.githubusercontent.com/render/math?math=$\beta_{0}$">  
We know that,  
<img src="https://render.githubusercontent.com/render/math?math=$E[Y_{i}|X_{i}=x_{i}] = \mu_{i} = \beta_{0}%2B\beta_{1}x_{i}$">  

<img src="https://render.githubusercontent.com/render/math?math=$Var(Y_{i}|X_{i}=x_{i}) = \sigma^{2}$">  

BUt unless the data is centered, this is of no interest because in most datasets 
there doesn't exist data with value 0 to estimate the intercept at **X** = **0**  
It can be impossible or far outside the range of the data. 
**It is the expected response when the predictor is equal to zero**

A fix for this would be to shift the regression variable by a constant "**a**",   

<img src="https://render.githubusercontent.com/render/math?math=$Y_{i} = \beta{0}%2B\beta_{1}X_{i}%2B\varepsilon_{i} = \beta_{0}%2Ba\beta_{1}%2B\beta_{1}(X_{i}%2Da)%2B\varepsilon_{i} = \tilde{\beta}_{0}%2B\beta_{1}(X_{i}%2Da)%2B\varepsilon_{i}$">  

<img src="https://render.githubusercontent.com/render/math?math=$varepsilon_{i}$"> is the gaussian error where <img src="https://render.githubusercontent.com/render/math?math=$varepsilon_{i}\simN(0,\sigma^{2})$">  
The new intercept is,  
<img src="https://render.githubusercontent.com/render/math?math=$\beta{0} = \beta_{0}%2Ba\beta_{1}$">  

Changing the ***X*** values by a value a changes the intercept, but not the 
slope.  
Often **a** is set to <img src="https://render.githubusercontent.com/render/math?math=$\bar{X}$"> so that the intercept is interpretted as
the expected response to the average ***X*** value.

For <img src="https://render.githubusercontent.com/render/math?math=$\beta_{1}$">  
The regression coefficient <img src="https://render.githubusercontent.com/render/math?math=$\beta_{1}$"> is the slope of the line,
and generally slope is mapped as ratio of change in **Y** to the change in **X**.

**It is the expected change in reponse for 1 unit change in the predictor**   
<img src="https://render.githubusercontent.com/render/math?math=$\beta_{1} = E[Y_{i}|X_{i}=x_{i}%2B1]%2DE[Y_{i}|X_{i}=x_{i}] = \beta_{0}%2B\beta_{1}(x_{i}%2B1)%2D(\beta_{0}%2B\beta_{1}x_{i})$">  
Shifting the **X** variable doesn't change the slope much. But when we scale the 
**X** quantities,   
We scale the regression variable by multiplying and dividing by a constant **a**  

<img src="https://render.githubusercontent.com/render/math?math=$Y_{i} = \beta_{0}%2B\beta_{1}X_{i}%2B\varepsilon_{i} = \beta_{0}%2B\frac{\beta_{1}}{a}(X_{i}a)%2B\varepsilon_{i} = \beta_{0}%2B\tilde{\beta_{1}}(X_{i}a)%2B\varepsilon_{i}$">  

Multiplication of ***X*** by a factor **a** results in dividing the coefficient 
by a factor of **a**.

* **Residuals**: The variation left unexplained around the regression line, i.e,
the distance of each datapoint from the line is a vector of residuals for the 
observed data.
<img src="https://render.githubusercontent.com/render/math?math=$e_{i} = Y_{i}-\hat{Y}_{i}$">

Least squares minimizes <img src="https://render.githubusercontent.com/render/math?math=$\sum_{i=1}^{n}e_{i}^{2}$">  
The <img src="https://render.githubusercontent.com/render/math?math=$e_{i}$"> can be thought of as the estimates of <img src="https://render.githubusercontent.com/render/math?math=$\varepsilon_{i}$">  

Properties of residuals: 
- <img src="https://render.githubusercontent.com/render/math?math=$E[e_{i}]=0$">  
- if you include an intercept, then <img src="https://render.githubusercontent.com/render/math?math=$\sum_{i=1}^{n}e_{i}=0$">  
- The generalization of above two points, if a regressor variable <img src="https://render.githubusercontent.com/render/math?math=$X_{i}$"> is included, then <img src="https://render.githubusercontent.com/render/math?math=$\sum_{i=1}^{n}e_{i}X_{i}=0$">  
- Residuals can be used to investigate the performance of a model. We look for 
systematic details in the residuals vs fitted values plot to infer that the 
model is poorly fit.  
- Residuals can be thought of as outcome(***Y***) with the linear association of 
the predictor(***X***) removed.  
- Residual variation is the variation left unexplained by the regression model, 
whereas the systematic variation is the variation explained by the regression 
model.

### Residual plot
A residual plot is a graph that shows the residuals on the vertical axis and the
independent variable on the horizontal axis. If the points in a residual plot
are randomly dispersed around the horizontal axis, a linear regression model is 
appropriate for the data; otherwise, a nonlinear model is more appropriate.

The residual plot helps to diagnose Heteroscedasticity, which is the trend of 
greater variablility along the mass variable.

**Residual variation** is the variation around the regression line. This can be 
obtained by grabbing the sigma variable of the summary of the regression model 
i.e., 
```
  summary(fit)$sigma
```  
which is same as when we compute manually,
```
  sqrt((sum(resid(fit)^2))/(n-2))
```  
Note: The % of total variance - variability disregarding the independent 
variables, around the mean of the dependent variable - that is explained by the 
residual variability - the variability explained by the regression model needs 
to be high, the amount of variance left unexplained must be kept minimum. A 
metric that defines the variance explained by a regression model is called 
R-squared.  
<img src="https://render.githubusercontent.com/render/math?math=$R^{2}=\frac{\sum_{i=1}^{n}(\hat{Y}_{i}%2D\bar{Y})^{2}}{\sum_{i=1}^{n}(Y_{i}%2D\bar{Y})^{2}}$">   

### Inference in Regression
Variance of the estimator <img src="https://render.githubusercontent.com/render/math?math=$\hat{\beta_{1}}$"> is given as,  
<img src="https://render.githubusercontent.com/render/math?math=$\sigma^{2}_{\hat{\beta_{1}}} = Var(\hat{\beta_{1}}) = \frac{\sigma^{2}}{\sum^{n}_{i=1}(X_{i}%2D\bar{X})^{2}}$">  
  
and, the variance of the intercept is given as,  
<img src="https://render.githubusercontent.com/render/math?math=$\sigma^{2}_{\hat{\beta_{0}}} = Var(\hat{\beta_{0}}) = \left(\frac{1}{n}%2B\frac{\bar{X}^{2}}{\sum_{i=1}^{n}(X_{i}%2D\bar{X})^{2}}\right)\sigma^{2}$">  

which is the standard deviation around the regression line divided by the sum of 
squares of the x variable around their mean.

In practice the <img src="https://render.githubusercontent.com/render/math?math=$\sigma^{2}$"> term is replaced by its estimate which is,  
<img src="https://render.githubusercontent.com/render/math?math=$\frac{1}{n%2D2}\left(\sum_{i=1}^{n}(X%2D\hat{X})^2\right)$">  

<img src="https://render.githubusercontent.com/render/math?math=$\frac{\hat{\beta_{j}}%2D\beta_{j}}{\sigma^{2}_{\hat{\beta_{j}}}}$"> follows a T-distribution with n-2 degrees of freedom.

The mean of a variable is the coefficient of its regression against the constant, 1. Thus, subtracting the mean is equivalent to replacing a variable by the residual of its regression against 1

### Prediction
Prediction estimate is given by   
  <img src="https://render.githubusercontent.com/render/math?math=$\hat{\beta}_{0}%2B\hat{\beta}_{1}x_{0}$">  

A standard error is required to create a prediction interval

The prediction interval for standard deviation in predicting the future value of 
y at any arbitrary point <img src="https://render.githubusercontent.com/render/math?math=$x_{0}$"> is distinctively broader 
than the confidence interval for a regression line.

The variability is narrowest at the centre of mass of the distribution.

Predicting <img src="https://render.githubusercontent.com/render/math?math=$\hat{Y}$">, value of y for any arbitrary x, ie line at <img src="https://render.githubusercontent.com/render/math?math=$x_{0}$"> se, <img src="https://render.githubusercontent.com/render/math?math=$\hat{\sigma}\sqrt{\frac{1}{n}%2B\frac{(x_{0}%2D\bar{X})^{2}}{\sum_{i=1}^{n}(X_{i}%2D\bar{X})^{2}}}$">  

and, for predicting a future interval, prediction interval se at <img src="https://render.githubusercontent.com/render/math?math=$x_{0}$"> is given by <img src="https://render.githubusercontent.com/render/math?math=$\hat{\sigma}\sqrt{1%2B\frac{1}{n}%2B\frac{(x_{0}%2D\bar{X})^{2}}{\sum_{i=1}^{n}(X_{i}%2D\bar{X})^{2}}}$">  

Deviance is the sum of the square of residuals.  
The square of correlation between two variables can also be used to compute the 
r-squared value.  


## Multivariable regression analysis
Multivariable regression is - looking at relationship of predictor on response
while at some level having accounted for other variables ie., Establishing the
right relationship between predictor and outcome in case of multiplicity - 
availability of multiple regressors.  

Components:  
- Model selection  
- Handling overfitting  
- 

eg: When considering the significance of regression relationship of a person's 
usage of breath mint and measure of forced expiratory volume. Logically dietary 
intake shouldn't be having such significance on pulmonary activity. Upon 
analysis we find the correlation between smokers and breath mint usage, smokers 
tend to use breath mint more, which shows that it is actually the parameter - "
whether a person smokes" which is actually signicant parameter to regression
and not "whether they consume breath mint".  

For multivariate regression, the regression coefficient is interpreted as **the 
change in the response for unit change in one of the regressors/predictors, 
keeping all other regressors constant.  

For multivariable regression we have,
- Model <img src="https://render.githubusercontent.com/render/math?math=$Y_{i} = \sum_{k=1}^{p}X_{ik}\beta_{k}%2B\varepsilon_{i} \sim N(0,\sigma^{2})$">  
- Fitted response <img src="https://render.githubusercontent.com/render/math?math=$\hat{Y}_{i} = \sum_{k=1}^{p}X_{ik}\hat{\beta}_{k}$">   
- Residuals <img src="https://render.githubusercontent.com/render/math?math=$\varepsilon_{i} = Y_{i} %2D \hat{Y}_{i}$">  
- variance estimate,  <img src="https://render.githubusercontent.com/render/math?math=$\hat{\sigma}^{2} = \frac{1}{n-p}\sum_{i=1}^{n}e_{i}^{2}$"> // Constrainted over each predictor p.
- To get predicted responses at new values,  <img src="https://render.githubusercontent.com/render/math?math=$x_{i}%2C%2E%2E%2E%2Cx_{p}%2C$"> simply plug them into the linear model <img src="https://render.githubusercontent.com/render/math?math=$\sum_{k=1}^{p}X_{k}\hat{\beta}_{k}$">  

Each coefficient has a standard error(se) with general representation <img src="https://render.githubusercontent.com/render/math?math=$\hat{\sigma}_{\hat{beta}_{k}}$">  
We can test for whether specific coefficients are zero with t-test:  
 <img src="https://render.githubusercontent.com/render/math?math=$\frac{\hat{beta}_{k}%2D\beta_{k}}{\hat{\sigma}_{\hat{beta}_{k}}}$">   


## Regression on factor variables
when dealing with factor variables R by default sets a level as the default 
value and it is interpreted by the intercept coefficient, whereas all the other 
levels are interpreted as a comparison of it's level to the default level.  
If we are to subtract the intercept coefficient from a given one we get the 
relation of this coefficient with the outcome minus the default

When regression on a factor variable, we consider the general equations of lines
as,   
<img src="https://render.githubusercontent.com/render/math?math=$\mathrm{E}\left[y | x_{1}, x_{2}\right] = \beta_{0}%2B\beta_{1}X_{1}%2B\beta_{2}X_{2}$">  
where we disregard the factor variable  

<img src="https://render.githubusercontent.com/render/math?math=$\mathrm{E}\left[y | x_{1}, x_{2}\right] = \beta_{0}%2B\beta_{1}X_{1}%2B\beta_{2}X_{2}$">  
Here we include the factor variable, 
Case 1: <img src="https://render.githubusercontent.com/render/math?math=$X_{2}=0$">  
<img src="https://render.githubusercontent.com/render/math?math=$\mathrm{E}\left[y | x_{1}, x_{2}\right] = \beta_{0}%2B\beta_{1}X_{1}$">  
Case 2: <img src="https://render.githubusercontent.com/render/math?math=$X_{2}=1$">  
<img src="https://render.githubusercontent.com/render/math?math=$\mathrm{E}\left[y | x_{1}, x_{2}\right] = (\beta_{0} %2B \beta_{2})%2B\beta_{1}X_{1}$">  
We observe that the slope remains the same in either cases while the intercept 
shifts.

In third scenario we introduce a new term to the equation   
<img src="https://render.githubusercontent.com/render/math?math=$\mathrm{E}\left[y | x_{1}, x_{2}\right] = \beta_{0}%2B\beta_{1}X_{1}%2B\beta_{2}X_{2}%2B\beta_{3}X_{1}X_{2}$">  
Case 1: <img src="https://render.githubusercontent.com/render/math?math=$X_{2}=0$">  
<img src="https://render.githubusercontent.com/render/math?math=$\mathrm{E}\left[y | x_{1}, x_{2}\right] = \beta_{0}%2B\beta_{1}X_{1}$">  
Case 2: <img src="https://render.githubusercontent.com/render/math?math=$X_{2}=1$">  
<img src="https://render.githubusercontent.com/render/math?math=$\mathrm{E}\left[y | x_{1}, x_{2}\right] = (\beta_{0} %2B \beta_{2})%2B(\beta_{1}%2B\beta_{3})X_{1}$">  
Where the intercept and the slope both change.

Suppose we have two interacting predictors and one of them is held constant. The
expected change in the outcome for a unit change in the other predictor is the 
coefficient of that changing predictor + the coefficient of the interaction * 
the value of the predictor held constant.

## Adjustment 
Adjustment, is the idea of putting regressors into a linear model to investigate
the role of a third variable on the relationship between another two.   
Example, introducing smoking as a third variable in regression between lung 
cancer and breath mint users.  

According to ncbi - The process of accounting for covariates is called 
adjustment (similar to logistic regression model) and comparing the results of 
simple and multiple linear regressions can clarify that how much the confounders 
in the model distort the relationship between exposure and outcome.

Simpson's paradox in terms of adjustment: Things can change to exact opposite 
when you perform adjustment.  

A **propensity score** is the probability of a unit (e.g., person, classroom, 
school) being assigned to a particular treatment given a set of observed
covariates. Propensity scores are used to reduce selection bias by equating 
groups based on these covariates.


## Outliers, residuals and diagnostics
For a datapoint to have high leverage on the overall data, it must be far away 
from the cloud of datapoint, similar to the leveraging of a fulcrum with 
increase in the effort arm length. In concept, how far away the datapoint is 
from the centre of the x's is the leverage of that dataset. Whereas influence is
whether or not that datapoint chooses to exert that leverage. Influence of a 
datapoint is highest if it doesn't conform to the linear regression of the x's 
with the outcome.  

When calculating influence, if 

**Influence measures** to identify outliers diagnose certain variable and based
on certain tests identify the residual data and thereby the outlying datapoint.

Use ?influence.measures to see full suite of influence measures in stats.
- rstandard and rstudent diagnose on the residuals.(Residuals have same unit as 
the outcome)  
- havalues - hatvalues(fit)  
- dffits for everydata point measures how much the fitted value changes given 
whether or not that particular datapoint is included, and similarly  
dfbeta measures how much the slope coefficient changes. dfbetas(fit)   
- cooks.distance summarises the dfbetas ie. it is measure of difference in the 
coefficients.  
- resid
- press residuals: resid(fit)/(1-hatvalues(fit)) mostly used to validate the 
model fit  

dfbetas() and hatvalues() together can be used to acertain whether a point in 
the dataset has influence and/or leverage. If dfbetas() is significantly 
different it denotes that the point has high significance, and if hatvalues() is 
significantly high it denotes that the point has high leverage.  

Note: When a sample is included in a model, it pulls the regression line closer
to itself (orange line) than that of the model which excludes it. Its residual, 
the difference between its actual y value and that of a regression line, is thus
smaller in magnitude when it is included than when it is omitted. The ratio of 
these two residuals, included to omitted, is therefore small in magnitude for an
influential sample.  
For a sample which is not influential the ratio would be close to 1. Hence, 1 
minus the ratio is a measure of influence, near 0 for points which are not 
influential, and near 1 for points which are. Manually calculated as:  
<img src="https://render.githubusercontent.com/render/math?math=$\frac{1%2Dresid(fit)[1]}{(data[1,1]-predict(fitno,data[1,]))}$">  
where,  
- We're only considering the first sample for analysis  
- fit is the model fitten with the sample  
- fitno is model fitted without the sample   
- data is the dataset  
This can be obtained using the hatvalues(fit) function.  

To get standard deviations of individual samples, we first multiply 
sigma(standard error in the residuals) with the square root of 1-hatvalues(fit), 
then we divide resid(fit) by this term, the result is known as the standardized
residual - which can be computed using rstandard(fit) function.  
Manually it is computed as:  
<img src="https://render.githubusercontent.com/render/math?math=$\frac{resid(fit)}{summary(fit)\$sigma*(1%2Dhatvalues(fit))}$">  
where,  
- sigma is <img src="https://render.githubusercontent.com/render/math?math=$\sqrt{\frac{deviance(fit)}{fit\$df.residual}}$">  
- deviance is <img src="https://render.githubusercontent.com/render/math?math=$resid(fit)^{2}$">  
The **Scale-Location** plot shows the square root of standardized residuals against fitted values.  

The rstudent(fit) function can be used to calculate the studentized residuals 
for each sample. The manual alternative to it, for the first sample, is:
<img src="https://render.githubusercontent.com/render/math?math=$\frac{resid(fit)[1]}{summary(fitno)\$sigma*(1%2Dhatvalues(fit)[1])}$">  

The cooks distance can be manually calculated by finding the difference between 
the predicted values and normalizing through division by the residual sample 
variance times number of predictors(coefficients).  
<img src="https://render.githubusercontent.com/render/math?math=$\Delta{Y}*[nCoefficients]*\sigma^{2}$">   
The **Residuals vs Leverage** plot(5) visualizes the cook's distance for a fit.  

## Model selection
"A model is a lense through which we look at data, any model that can tell us 
the true information about data is considered as a right model".  
Introducing unnecessary variables into the regression model can lead to high
standard errors for the other regressors.  
Excluding important regressors lead to bias in the fitted model, whereas 
including unimportant regressors lead to variance inflation(standard error 
increase).  

The more the covariance of the regressors to the resonse, the more the standard 
error.  

The variance inflation factor(VIF) can be obtained for a fit to compare the 
correlation between variables(if high then yes), this can be computed using 
function 'vif(fit)'

"Randomization as a method of experimental control has been extensively used in
human clinical trials and other biological experiments. It prevents the 
selection bias and insures against the accidental bias. It produces the
comparable groups and eliminates the source of bias in treatment assignments."  
For example, If we were to study whether mouth mint usage is correlated with 
forced expiratory volume, we'd want our samples to be randomized in the sense 
that the mint users must not be predominantely smokers, which is the underlying 
variable that can affect the outcome of the analysis, randomization helps spread
the smokers among the mint users and non-mint user subsets.  
Randomized test is unbiased because no unknown or known variable is influencing 
the response of the model unnecessarily.  

Since the true value of residuals is not known, we use ratios of inflation to 
compare the models to find the best one.  
The variance inflation factor(VIF) is the increase in the variance for the ith
regressor compared to the ideal setting where it is orthogonal to the other 
regressors.  

Nested models for model selection is a valid measure to identify the best model
where we use likelihood ratios to measure a model's fit compared to the rest. In 
nested model we keep adding parameters one by one and check the performance of 
the model with each nesting.  
The 'anova(fit1,fit2,fit3,...)' is used in conjuncture with nested models.  

## Generalized linear models 

According to wikipedia:   
> [Ordinary linear regression](https://en.wikipedia.org/wiki/Generalized_linear_model#:~:text=Generalized%20linear%20models%20cover%20all,rather%20than%20assuming%20that%20the) predicts the expected value of a given unknown 
quantity (the response variable, a random variable) as a linear combination of a
set of observed values (predictors). This implies that a constant change in a 
predictor leads to a constant change in the response variable (i.e. a 
linear-response model). This is appropriate when the response variable can vary,
to a good approximation, indefinitely in either direction, or more generally for
any quantity that only varies by a relatively small amount compared to the 
variation in the predictive variables, e.g. human heights.  
However, these assumptions are inappropriate for some types of response
variables. For example, in cases where the response variable is expected to be 
always positive and varying over a wide range, constant input changes lead to 
geometrically (i.e. exponentially) varying, rather than constantly varying, 
output changes. As an example, suppose a linear prediction model learns from
some data (perhaps primarily drawn from large beaches) that a 10 degree 
temperature decrease would lead to 1,000 fewer people visiting the beach. This
model is unlikely to generalize well over different sized beaches. More 
specifically, the problem is that if you use the model to predict the new
attendance with a temperature drop of 10 for a beach that regularly receives 50
beachgoers, you would predict an impossible attendance value of -950. Logically, 
a more realistic model would instead predict a constant rate of increased beach
attendance (e.g. an increase in 10 degrees leads to a doubling in beach 
attendance, and a drop in 10 degrees leads to a halving in attendance). Such a
model is termed an exponential-response model (or log-linear model, since the 
logarithm of the response is predicted to vary linearly).  
Similarly, a model that predicts a probability of making a yes/no choice (a 
Bernoulli variable) is even less suitable as a linear-response model, since 
probabilities are bounded on both ends (they must be between 0 and 1). Imagine,
for example, a model that predicts the likelihood of a given person going to the
beach as a function of temperature. A reasonable model might predict, for
example, that a change in 10 degrees makes a person two times more or less 
likely to go to the beach. But what does "twice as likely" mean in terms of a 
probability? It cannot literally mean to double the probability value (e.g. 50%
becomes 100%, 75% becomes 150%, etc.). Rather, it is the odds that are doubling:
from 2:1 odds, to 4:1 odds, to 8:1 odds, etc. Such a model is a log-odds or
logistic model.  
Generalized linear models cover all these situations by allowing for response 
variables that have arbitrary distributions (rather than simply normal 
distributions), and for an arbitrary function of the response variable (the link
function) to vary linearly with the predicted values (rather than assuming that 
the response itself must vary linearly). For example, the case above of 
predicted number of beach attendees would typically be modeled with a Poisson
distribution and a log link, while the case of predicted probability of beach 
attendance would typically be modeled with a Bernoulli distribution (or binomial
distribution, depending on exactly how the problem is phrased) and a log-odds 
(or logit) link function. 

Components of a generalized linear model:  
- Distribution family on which the response has to be modelled - exponential family model.  
- The systematic component via a linear predictor  
- Link function connects connects the mean of response to the linear predictor.  

In case of linear models which uses gaussian distribution(which is an 
exponential family distribution ), <img src="https://render.githubusercontent.com/render/math?math=$Y_{i}~N(\mu_{i}%2C\sigma^{2})$">  
We define a linear predictor as, <img src="https://render.githubusercontent.com/render/math?math=$\eta_{i}=\sum_{k=1}^{p}X_{ik}\beta_{k}$">  
and link function, g is the identify function <img src="https://render.githubusercontent.com/render/math?math=$\mu_{i}=\eta_{i}$">  

[Maximum likelihood estimation](https://towardsdatascience.com/probability-concepts-explained-maximum-likelihood-estimation-c7b4342fdbb1) is a method that determines values for the 
parameters of a model. The parameter values are found such that they maximise
the likelihood that the process described by the model produced the data that 
were actually observed.  

When calculating MLE, we calculate the total probability of observing a data 
given a distribution with parameters to define it.

Consider a bunch of datapoints forming a gaussian distribution, the probability 
of observing a datapoint at a location is given by <img src="https://render.githubusercontent.com/render/math?math=$P(x:\mu,\sigma)=\frac{1}{\sigma\sqrt{2\pi}}\mathrm{exp}\left(%2D\frac{(x%2D\mu)^2}{2\sigma^2}\right)$">  
For calculating the probability distribution of the joint distribution, assuming 
the datapoints are independent, we simply multiply all the probabilities - for 
which finding the maxima taking the derivative can be quite complicated 
depending on the size of the dataset, therefore we take the log of the equation 
and then derivate w.r.t <img src="https://render.githubusercontent.com/render/math?math=$\mu$"> to find the mean of the distribution(given it is a gaussian distribution) otherwise the <img src="https://render.githubusercontent.com/render/math?math=$\sigma$"> the 
standard deviation.  
Thus we can easily calculate the parameters that define the selected 
distribution/modelling a distribution that defines the dataset.  

## Logistic regression
In case of logistic regression, the generalized linear model follows a bernoulli
distribution <img src="https://render.githubusercontent.com/render/math?math=$Y_{i}~Bernoulli(\mu_{i})$"> so that <img src="https://render.githubusercontent.com/render/math?math=$E[Y_{i}]=\mu_{i]$"> where <img src="https://render.githubusercontent.com/render/math?math=$\mu~[0,1]$">  
The linear predictor is defined as, <img src="https://render.githubusercontent.com/render/math?math=$\eta_{i}=\sum_{k=1}^{p}X_{ik}\beta_{k}$">  
with link function, <img src="https://render.githubusercontent.com/render/math?math=$g(\mu)=\eta=log\left(\frac{\mu}{1%2D\mu}\right)$">, g is the natural log odds, referred to as **logit**.  

A [binomial random variable](https://online.stat.psu.edu/stat800/book/export/html/658) counts how often a particular event occurs in a fixed
number of tries or trials. For a variable to be a binomial random variable, ALL 
of the following conditions must be met:  
- There are a fixed number of trials (a fixed sample size).  
- On each trial, the event of interest either occurs or does not.  
- The probability of occurrence (or not) is the same on each trial.  
- Trials are independent of one another.  

Unlike in linear models in which we have constant variance(for the residuals) 
i.e. <img src="https://render.githubusercontent.com/render/math?math=$Var(Y_{i})=\sigma^{2}$">, 
we do not observe such a trend in case of non-gaussian distribution family 
models.   
For instance, in case of the bernoulli distribution family model, we have 
<img src="https://render.githubusercontent.com/render/math?math=$Var(Y_{i})=\mu_{i}(1%2D\mu{i})$">  
and in case of poisson, <img src="https://render.githubusercontent.com/render/math?math=$\mu_{i}$">  
The variance depends on the ith observed data.  

Odds = Probability/(1-Probability)  
Probability = Odds/(1+Odds)  
Log Odds(logit) = log(Odds)  

In case of linear regression we have, <img src="https://render.githubusercontent.com/render/math?math=$\mathrm{response}_{i}=b_{0}%2Bb_{1}\mathrm{predictor}_{i}%2Be_{i}$">  
Which can be realised to <img src="https://render.githubusercontent.com/render/math?math=$E[\mathrm{response}_{i}|\mathrm{predictor}_{i},b_{0},b_{1}]=b_{0}%2Bb_{1}\mathrm{predictor}$">  

And in case of logistic regression <img src="https://render.githubusercontent.com/render/math?math=$\mathrm{Pr}(response_{i}|predictor_{i},b_{0},b_{1})=\frac{exp(b_{0}%2Bb_{1}predictor_{i})}{1%2Bexp(b_{0}%2Bb_{1}predictor_{i})}$">  
which can then be realized as <img src="https://render.githubusercontent.com/render/math?math=$\mathrm{log}\left(\frac{\mathrm{Pr}(response_{i}|predictor_{i},b_{0},b_{1})}{1%2D\mathrm{Pr}(response_{i}|predictor_{i},b_{0},b_{1})}\right)=b_{0}%2Bb_{1}predictor_{i}$">  
<img src="https://render.githubusercontent.com/render/math?math=$\frac{exp(a)}{1%2Bexp(a)}$"> is known as xbit.  

Consider the ravens win/loss rate dataset   
Linear regression <img src="https://render.githubusercontent.com/render/math?math=$\mathrm{response}_{i}=b_{0}%2Bb_{1}\mathrm{predictor}_{i}%2Be_{i}$">   
Logistic regression <img src="https://render.githubusercontent.com/render/math?math=$\mathrm{log}\left(\frac{\mathrm{Pr}(response_{i}|predictor_{i},b_{0},b_{1})}{1%2D\mathrm{Pr}(response_{i}|predictor_{i},b_{0},b_{1})}\right)=b_{0}%2Bb_{1}predictor_{i}$">  
If, score==0 then we have  
<img src="https://render.githubusercontent.com/render/math?math=$\mathrm{log}\left(\frac{\mathrm{Pr}(response_{i}|predictor_{i},b_{0},b_{1})}{1%2D\mathrm{Pr}(response_{i}|predictor_{i},b_{0},b_{1})}\right)=b_{0}$">   
Thus,  
- <img src="https://render.githubusercontent.com/render/math?math=$b_{0}$"> - Log odds of Ravens win if they score zero points  
- <img src="https://render.githubusercontent.com/render/math?math=$b_{1}$"> - Log odds ratio of win probability for each point scored(relative to the zero point)  
- <img src="https://render.githubusercontent.com/render/math?math=$exp(b_{1})$"> - Odds ratio of win probability for each point scored(relative to the zero point)

and <img src="https://render.githubusercontent.com/render/math?math=$\frac{e^{b_{0}}}{1%2Be^{b_{0}}}$"> is the probability of whether raven's win with score "0"  

To find the unit increase in probability of winning,  
- Let <img src="https://render.githubusercontent.com/render/math?math=$b_{0}%2Bb_{1}(predictor_{i})$"> be the probability of winning for given score, and     
- <img src="https://render.githubusercontent.com/render/math?math=$b_{0}%2Bb_{1}(predictor_{i}%2B1)$" style="display:inline"> be the probability of winning for given score + 1, which means the probability given unit increase in score.    

Subtracting the terms we get, <img src="https://render.githubusercontent.com/render/math?math=$b_{0}%2Bb_{1}(predictor_{i}%2B1)%2Db_{0}%2Bb_{1}(predictor_{i})=b_{1}$">  

Note:   
- Log odds ratio closer to 0 signifies that there is no significant change for 
per unit increase in the value of the concerned predictor. In case of odds ratio
a value closer to 1 signifies the same,  
- Odds ratio <0.5 or >2 are said to be "moderate effect"  
- Relative risk, <img src="https://render.githubusercontent.com/render/math?math=$\frac{\mathrm{Pr}(response_{i}|predictor_{i}=10)}{\mathrm{Pr}(response_{i}|predictor_{i}=0)}$"> is easier to 
interpret but more difficult to compute. Note: For small probabilities, it is 
closer to the odds ratio.  

## Poisson regression
The generalized linear model follows poisson distribution <img src="https://render.githubusercontent.com/render/math?math=$Y_{i}~Poisson(\mu_{i})$"> so that
<img src="https://render.githubusercontent.com/render/math?math=$E[Y_{i}]=\mu_{i}$"> where <img src="https://render.githubusercontent.com/render/math?math=$\mu\ge0$">  
The linear predictor is defined as, <img src="https://render.githubusercontent.com/render/math?math=$\eta_{i}=\sum_{k=1}^{p}X_{ik}\beta_{k}$">  
with link function, <img src="https://render.githubusercontent.com/render/math?math=$g(\mu)=\eta=log\left(\mu\right)$">  
lambda is expected to grow depending on some time.  

The maximum likelihood estimate can be interpreted as <img src="https://render.githubusercontent.com/render/math?math=$0=\sum_{i=1}^{n}\frac{(Y_{i}%2D\mu_{i})}{Var(Y_{i})}W_{i}$">  

Poisson distribution can be defined as <img src="https://render.githubusercontent.com/render/math?math=$P(X=x)=\frac{(t\lambda)^{x}e^{%2Dt\lambda}}{x!}$">  
Expected value of a poisson count is given as, <img src="https://render.githubusercontent.com/render/math?math=$E[X]=t\lambda$">, thus <img src="https://render.githubusercontent.com/render/math?math=$E[x/t]=\lambda$">  
variance, <img src="https://render.githubusercontent.com/render/math?math=$Var(X)=t\lambda$">  
Note: Poisson tends to normal as the mean(<img src="https://render.githubusercontent.com/render/math?math=$t\lambda$">) gets larger.  

Easiest way to do count data regression is to take the log of the outcome (adding 
+1 to the response to avoid log(0) error).  
<img src="https://render.githubusercontent.com/render/math?math=$log(response_{i})=b_{0}%2Bb_{1}predictor_{i}%2Be_{i}$">  
Equivalent to  
<img src="https://render.githubusercontent.com/render/math?math=$log(\lambda)=b_{0}%2Bb_{1}time$">  
Since we are modeling on the growth rate lambda<img src="https://render.githubusercontent.com/render/math?math=$(\lambda)$">  
<img src="https://render.githubusercontent.com/render/math?math=$\lambda$">, is exponentially dependent on the time.  
<img src="https://render.githubusercontent.com/render/math?math=$\lambda=e^{b_{0}}*e_{b_{1}time}$">  
Thus <img src="https://render.githubusercontent.com/render/math?math=$e^{b1}$"> represents the percentage growth per day.  
The arithmetic properties of date type fields allow us to use them as predictors.
We'll use Poisson regression to predict <img src="https://render.githubusercontent.com/render/math?math=$log(\lambda)$"> as a linear function of date in a way which maximizes the likelihood of the counts we actually see.  

To get the value of lambda for any given time use the <img src="https://render.githubusercontent.com/render/math?math=$\mathrm{model$fitted.values[n}^{th}\mathrm{%20fitted%20row%20representing%20the%20date]}$">  
Using the qpois() function we can find the confidence intervals with ease.  
To gauge the importance of another variable on the response we can make use of 
the offset parameter of the glm() function to model frequencies and proportions.  

The coefficients by default "the mean of predictor regressed with the response",
in this case the if we are to exponentiate the coefficients we get a term <img src="https://render.githubusercontent.com/render/math?math=$e^{E[log(Y)]}$"> which 
is equivalent to the geomettric mean of the predictor since  
<img src="https://render.githubusercontent.com/render/math?math=$e^{\frac{1}{n}\sum_{i=1}^{n}log(y_{i})}=(\prod_{i=1}^{n}y_{i})^{1/n}$">  
"The geometric mean is simply exponentiating the arithematic mean of the log 
data", therefore when taking log of outcome then the exponentiated predictors 
can interpreted with respect to geometric means.  

In case of linear regression we have, <img src="https://render.githubusercontent.com/render/math?math=$\mathrm{response}_{i}=b_{0}%2Bb_{1}\mathrm{predictor}_{i}%2Be_{i}$">  
Which can be realised to <img src="https://render.githubusercontent.com/render/math?math=$E[\mathrm{response}_{i}|\mathrm{predictor}_{i},b_{0},b_{1}]=b_{0}%2Bb_{1}\mathrm{predictor}$">  

And in case of poisson/log-linear regression <img src="https://render.githubusercontent.com/render/math?math=$log(E[response_{i}|predictor_{i},b_{0},b_{1}])=b_{0}%2Bb_{1}predictor_{i}$">  
which can then be realized as  
<img src="https://render.githubusercontent.com/render/math?math=$E[response_{i}|predictor_{i},b_{0},b_{1}]=e^{(b_{0}%2Bb_{1}predictor_{i})}$">  
<img src="https://render.githubusercontent.com/render/math?math=$E[response_{i}|predictor_{i},b_{0},b_{1}]=e^{(b_{0}}e^{b_{1}predictor_{i})}$">  

The slope coefficient is interpreted as the relative increase or decrease in the 
mean per unit change in the regressor.
<img src="https://render.githubusercontent.com/render/math?math=$\frac{e^{(b_{0}%2Bb_{1}(predictor_{i}%2B1))}}{e^{(b_{0}%2Bb_{1}predictor_{i})}}=e^{b_{1}}$">  

When there are a lot of zero counts in the response, the arising problem is 
called the "zero inflation problem", in r we have a package called "pscl" which 
gives us strategies to handle this problem.  


## Fitting functions using linear models 
Consider the model <img src="https://render.githubusercontent.com/render/math?math=$Y_{i}=f(x_{i})%2B\varepsilon$">  
Which can be modelled using <img src="https://render.githubusercontent.com/render/math?math=$Y_{i}=\beta_{0}%2B\beta_{1}X_{i}%2B\sum_{k=1}^{d}(x_{i}%2D\xi_{k})_{%2B}\gamma_{k}%2B\varepsilon_{i}$">   
where,
- <img src="https://render.githubusercontent.com/render/math?math=$(a)_{%2B}=a:a>0%3B%200%20\mathrm{otherwise}$">  
- The extra terms add knots and splineTerms that breaks the regression line into
multiple lines that can explain the variance in the data with the given function.  

### Spline regression
In spline regression the dataset is divided into different bins according to the 
number of knots, and each bin has its separate fit.  
Thus by fitting multiple models along the dataset we are better able to explain 
the variance with relatively simple model instead of having to opt for 
polynomial regression models.  
<img src="https://render.githubusercontent.com/render/math?math=$Y_{i}=\beta_{0}%2B\beta_{1}X_{i}%2B\sum_{k=1}^{d}(x_{i}%2D\xi_{k})_{%2B}\gamma_{k}%2B\varepsilon_{i}$">  

To get continous smooth curve, add square terms to the function to get <img src="https://render.githubusercontent.com/render/math?math=$Y_{i}=\beta_{0}%2B\beta_{1}X_{i}%2B\beta_{2}X_{i}^{2}%2B\sum_{k=1}^{d}(x_{i}%2D\xi_{k})^{2}_{%2B}\gamma_{k}%2B\varepsilon_{i}$">  

The discrete fourier transform is used by sound engineers to plot a spectrum
which essentially just uses a linear model with a lot of sin and cosine terms as
regressors to distinctively identify the notes in sound.  


## F-Statistic
An F statistic is a ratio of two sums of squares divided by their respective 
degrees of freedom. If the two scaled sums are independent and centrally 
chi-squared distributed with the same variance, the statistic will have an F 
distribution with parameters given by the two degrees of freedom.  

To calculate for two nested models:
<img src="https://render.githubusercontent.com/render/math?math=$\frac{\left(\frac{deviance(fit1)-deviance(fit2)}{diff(df(fit2),df(fit1))}\right)}{\left(\frac{deviance(fit2)}{df(fit2)}\right)}$">   
Now, calculating the p-value, the probability that a value of theoretical 
F-statistic or larger would be drawn from an F distribution which has parameters
diff(df(fit1),df(fit2)) and df(fit1), using the pf() function.
```
  pf(F-sTATISTIC, DIFF, DF_FIRST_FIT, lower.tail=FALSE)
```  
While testing the significance of a model using p-value we are assuming that the 
distribution of the residuals is normal, to test the normality of residuals of a 
fit we can use the *shapiro-Wilk* test implemented using the function
```
  shapiro.test(fit$residuals)
```  
For a value >0.05 we fail to reject the normality.

Note: When adding regressors, the reduction in residual sums of squares should
be tested for significance above and beyond that of reducing residual degrees of
freedom because including more regressors will reduce a model's residual sum of 
squares, even if the new regressors are irrelevant.  

