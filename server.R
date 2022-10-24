# server for distribution app

library(shiny)
library(shinythemes)

# create files needed by app here
bimodal = c(rnorm(5000,10,2),rnorm(5000,25,5))
normal = rnorm(5000,25,10)
uniform = runif(5000,5,45)
staircase = c(runif(1000,0,25),runif(2500,25,50),
              runif(5000,50,75),runif(7500,75,100))
binomial = rbinom(5000,5,0.2)
poisson = rpois(5000,5)

# set colors
palette("Okabe-Ito")

shinyServer(function(input,output){
  
  output$activity1plot = renderPlot({
    
   if (input$dataset == "bimodal"){
     davg = rep(0,5000)
     for (i in 1:5000){
       davg[i] = mean(sample(bimodal,input$size))
     }
     par(mfrow = c(1,2))
     hist(bimodal, breaks = 50, col = c(6,8), 
          xlab = "values", ylab = "number of events in 5000 trials",
          main = paste("mean = ", round(mean(bimodal),2)))
     hist(davg,breaks = 50, col = c(6,8), 
          xlab = "values", ylab = "number of events in 5000 trials",
          main = paste("mean = ", round(mean(davg),2)))
   }
    
    if (input$dataset == "normal"){
      davg = rep(0,5000)
      for (i in 1:5000){
        davg[i] = mean(sample(normal,input$size))
      }
      par(mfrow = c(1,2))
      hist(normal, breaks = 50, col = c(6,8), 
           xlab = "values", ylab = "number of events in 5000 trials",
           main = paste("mean = ", round(mean(normal),2)))
      hist(davg,breaks = 50, col = c(6,8), 
           xlab = "values", ylab = "number of events in 5000 trials",
           main = paste("mean = ", round(mean(davg),2)))
    }
    
    if (input$dataset == "uniform"){
      davg = rep(0,5000)
      for (i in 1:5000){
        davg[i] = mean(sample(uniform,input$size))
      }
      par(mfrow = c(1,2))
      hist(uniform, breaks = 50, col = c(6,8), 
           xlab = "values", ylab = "number of events in 5000 trials",
           main = paste("mean = ", round(mean(uniform),2)))
      hist(davg,breaks = 50, col = c(6,8), 
           xlab = "values", ylab = "number of events in 5000 trials",
           main = paste("mean = ", round(mean(davg),2)))
    }
    
    if (input$dataset == "staircase"){
      davg = rep(0,5000)
      for (i in 1:5000){
        davg[i] = mean(sample(staircase,input$size))
      }
      par(mfrow = c(1,2))
      hist(staircase, breaks = 50, col = c(6,8), 
           xlab = "values", ylab = "number of events in 5000 trials",
           main = paste("mean = ", round(mean(staircase),2)))
      hist(davg,breaks = 50, col = c(6,8), 
           xlab = "values", ylab = "number of events in 5000 trials",
           main = paste("mean = ", round(mean(davg),2)))
    }
    
    if (input$dataset == "binomial"){
      davg = rep(0,5000)
      for (i in 1:5000){
        davg[i] = mean(sample(binomial,input$size))
      }
      par(mfrow = c(1,2))
      barplot(table(binomial), col = c(6,8), 
              xlab = "values", ylab = "number of events in 5000 trials",
              main = paste("mean = ", round(mean(binomial),2)))
      hist(davg,col = c(6,8), 
           xlab = "values", ylab = "number of events in 5000 trials",
           main = paste("mean = ", round(mean(davg),2)))
    }
    
    if (input$dataset == "Poisson"){
      davg = rep(0,5000)
      for (i in 1:5000){
        davg[i] = mean(sample(poisson,input$size))
      }
      par(mfrow = c(1,2))
      barplot(table(poisson), col = c(6,8), 
              xlab = "values", ylab = "number of events in 5000 trials",
              main = paste("mean = ", round(mean(poisson),2)))
      hist(davg,col = c(6,8), 
           xlab = "values", ylab = "number of events in 5000 trials",
           main = paste("mean = ", round(mean(davg),2)))
    }
     
  })
  
  
}) # close server
