# global.r file

# load packages
library(shiny)
library(shinythemes)

# create files needed by app here
bimodal = c(rnorm(5000,10,2),rnorm(5000,50,5))
normal = rnorm(5000,25,10)
uniform = runif(5000,5,45)
staircase = c(runif(1000,0,25),runif(2500,25,50),
              runif(5000,50,75),runif(7500,75,100))
binomial = rbinom(5000,5,0.2)
poisson = rpois(5000,5)

# set colors
palette("Okabe-Ito")
