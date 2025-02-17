## ------------------------ Using base plotting package to plot the airquality data ---------------------------- ## 
## for month of may against all other months 

## Creating a plot, but plotting no points on the plot
with(airquality, plot(Wind, Ozone, main = "Qzone and Wind in New York City",type = "n"))

## Plotting data from month of may in blue 
with(subset(airquality, Month==5), points(Wind, Ozone, col = "blue"))

## Plotting data or all other months other than may in red
with(subset(airquality, Month!=5), points(Wind, Ozone, col = "red"))

## Adding legend to the graph to communicate the information in the graph
legend("topright", pch = 1, col = c("blue","red"), legend = c("May","Other months"))

## ------------------------------ Adding linear regression line to the plot ------------------------------------ ##
## Creating the model
model = lm(Ozone~Wind, airquality)

## Adding the line 
abline(model,lwd = 2, col = "purple")

## ----------------------------------------- Multiple base plot ------------------------------------------------ ##
par(mfrow = c(1,2))
with(airquality,{
  plot(Wind, Ozone, main = "Ozone and Wind")
  plot(Solar.R, Ozone, main = "Ozone and Solar Radiation")
})

par(mfrow = c(1,3), mar = c(4,4,2,1), oma = c(0,0,2,1))
with(airquality,{
  plot(Wind, Ozone, main = "Ozone and Wind")
  plot(Solar.R, Ozone, main = "Ozone and Solar Radiation")
  plot(Temp, Ozone, main = "Ozone and Temperature")
  mtext("Ozone and Weather in New York City", outer = T)
})

## The par() function is used to specify global graphics parameters that affect all plots in an R session. 
## Use dev.off or plot.new to reset to the defaults.
