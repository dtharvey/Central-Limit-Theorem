# server for distribution app

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

shinyServer(function(input,output){
  
  output$introplot = renderPlot({
    par(mar = c(5,4,1,2))
    mu = 0
    sigma = 1
    x = seq(mu-4*sigma, mu+4*sigma, 0.01)
    y = dnorm(x, mean = mu, sd = sigma)
    plot(x = x, y = y, type = "l", lwd = 2, col = 1, 
         ylab = "frequency of outcomes", 
         xlab = expression(paste("outcomes: ",mu,""%+-%"","z",sigma)), 
         xaxs = "i", yaxt = "n",
         cex.lab = 1.5, cex.axis = 1.5, bty = "n") 
    
    # shade from -1 to 0
    lowlim = -1
    upperlim = 0
    dx = seq(lowlim, upperlim, 0.01)
    polygon(x = c(lowlim, dx, upperlim), 
            y = c(0, dnorm(dx, mean = mu, sd = sigma),0),
            border = 1, lwd = 2, col = 5)
    
    # shade from 0 to +1
    lowlim = 0
    upperlim = +1
    dx = seq(lowlim, upperlim, 0.01)
    polygon(x = c(lowlim, dx, upperlim), 
            y = c(0, dnorm(dx, mean = mu, sd = sigma),0),
            border = 1, lwd = 2, col = 5)
    
    # shade from -2 to -1
    lowlim = -2
    upperlim = -1
    dx = seq(lowlim, upperlim, 0.01)
    polygon(x = c(lowlim, dx, upperlim), 
            y = c(0, dnorm(dx, mean = mu, sd = sigma),0),
            border = 1, lwd = 2, col = 2)
    
    # shade from -3 to -2
    lowlim = -3
    upperlim = -2
    dx = seq(lowlim, upperlim, 0.01)
    polygon(x = c(lowlim, dx, upperlim), 
            y = c(0, dnorm(dx, mean = mu, sd = sigma),0),
            border = 1, lwd = 2, col = 7)
    
    # shade from -4 to -3
    lowlim = -4
    upperlim = -3
    dx = seq(lowlim, upperlim, 0.01)
    polygon(x = c(lowlim, dx, upperlim), 
            y = c(0, dnorm(dx, mean = mu, sd = sigma),0),
            border = 1, lwd = 2, col = 1)
    
    # shade from +2 to +1
    lowlim = +1
    upperlim = +2
    dx = seq(lowlim, upperlim, 0.01)
    polygon(x = c(lowlim, dx, upperlim), 
            y = c(0, dnorm(dx, mean = mu, sd = sigma),0),
            border = 1, lwd = 2, col = 2)
    
    # shade from +3 to +2
    lowlim = +2
    upperlim = +3
    dx = seq(lowlim, upperlim, 0.01)
    polygon(x = c(lowlim, dx, upperlim), 
            y = c(0, dnorm(dx, mean = mu, sd = sigma),0),
            border = 1, lwd = 2, col = 7)
    
    # shade from +4 to +3
    lowlim = +3
    upperlim = +4
    dx = seq(lowlim, upperlim, 0.01)
    polygon(x = c(lowlim, dx, upperlim), 
            y = c(0, dnorm(dx, mean = mu, sd = sigma),0),
            border = 1, lwd = 2, col = 1)
    
    legend(x = "topright", 
           legend = c("34.13%", "13.59%", "2.14%", "0.14%"),
           fill = c(5,2,7,1), cex = 1.5, bty = "n",
           title = "percentage of outcomes (by section)")
    
    legend(x = "topleft", fill = c(5,2,7,1),
           legend = c("68.26%", "95.44%","99.72%", "100%"),
           title = "cumulative percentage of outcomes",
           cex = 1.5, bty = "n")
    
  })
  
  output$activity1plot = renderPlot({
    
   if (input$dataset == "bimodal"){
     davg = rep(0,5000)
     for (i in 1:5000){
       davg[i] = mean(sample(bimodal,input$size))
     }
     par(mfrow = c(1,2))
     hist(bimodal, col = 2, 
          xlab = "outcomes", ylab = "frequency of outcomes", yaxt = "n",
          sub = "sample size: 1",
          main = paste("mean = ", round(mean(bimodal),2), 
                              "& st dev = ", round(sd(bimodal),2)))
     hist(davg, col = 2, 
          xlab = "outcomes", ylab = "frequency of outcomes", yaxt = "n",
          sub = paste("sample size: ", input$size),
          main = paste("mean = ", round(mean(davg),2), 
                       "& st dev = ", round(sd(davg),2)))
   }
    
    if (input$dataset == "normal"){
      davg = rep(0,5000)
      for (i in 1:5000){
        davg[i] = mean(sample(normal,input$size))
      }
      par(mfrow = c(1,2))
      hist(normal, col = 2, 
           xlab = "outcomes", ylab = "frequency of outcomes", yaxt = "n",
           sub = "sample size: 1",
           main = paste("mean = ", round(mean(normal),2), 
                        "& st dev = ", round(sd(normal),2)))
      hist(davg, col = 2, 
           xlab = "outcomes", ylab = "frequency of outcomes", yaxt = "n",
           sub = paste("sample size: ", input$size),
           main = paste("mean = ", round(mean(davg),2), 
                        "& st dev = ", round(sd(davg),2)))
    }
    
    if (input$dataset == "uniform"){
      davg = rep(0,5000)
      for (i in 1:5000){
        davg[i] = mean(sample(uniform,input$size))
      }
      par(mfrow = c(1,2))
      hist(uniform, col = 2, 
           xlab = "values", ylab = "frequency", yaxt = "n",
           sub = "sample size: 1",
           main = paste("mean = ", round(mean(uniform),2), 
                               "& st dev = ", round(sd(uniform),2)))
      hist(davg, col = 2, 
           xlab = "outcomes", ylab = "frequency of outcomes", yaxt = "n",
           sub = paste("sample size: ", input$size),
           main = paste("mean = ", round(mean(davg),2), 
                        "& st dev = ", round(sd(davg),2)))
    }
    
    if (input$dataset == "staircase"){
      davg = rep(0,5000)
      for (i in 1:5000){
        davg[i] = mean(sample(staircase,input$size))
      }
      par(mfrow = c(1,2))
      hist(staircase, col = 2, 
           xlab = "values", ylab = "frequency", yaxt = "n",
           sub = "sample size: 1",
           main = paste("mean = ", round(mean(staircase),2), 
                        "& st dev = ", round(sd(staircase),2)))
      hist(davg, col = 2, 
           xlab = "values", ylab = "frequency", yaxt = "n",
           sub = paste("sample size: ", input$size),
           main = paste("mean = ", round(mean(davg),2), 
                        "& st dev = ", round(sd(davg),2)))
    }
    
    if (input$dataset == "binomial"){
      davg = rep(0,5000)
      for (i in 1:5000){
        davg[i] = mean(sample(binomial,input$size))
      }
      par(mfrow = c(1,2))
      barplot(table(binomial), col = 2, 
              xlab = "values", ylab = "frequency", yaxt = "n",
              sub = "sample size: 1",
              main = paste("mean = ", round(mean(binomial),2), 
                           "& st dev = ", round(sd(binomial),2)))
      hist(davg, col = 2,  
           xlab = "values", ylab = "frequency", yaxt = "n",
           sub = paste("sample size: ", input$size),
           main = paste("mean = ", round(mean(davg),2), 
                        "& st dev = ", round(sd(davg),2)))
    }
    
    if (input$dataset == "Poisson"){
      davg = rep(0,5000)
      for (i in 1:5000){
        davg[i] = mean(sample(poisson,input$size))
      }
      par(mfrow = c(1,2))
      barplot(table(poisson), col = 2, 
              xlab = "values", ylab = "frequency", yaxt = "n",
              sub = "sample size: 1",
              main = paste("mean = ", round(mean(poisson),2), 
                           "& st dev = ", round(sd(poisson),2)))
      hist(davg, col = 2, 
           xlab = "values", ylab = "frequency", yaxt = "n",
           sub = paste("sample size: ", input$size),
           main = paste("mean = ", round(mean(davg),2), 
                        "& st dev = ", round(sd(davg),2)))
    }
     
  })
  
  output$wrapupplot = renderPlot({
 
      davg = rep(0,5000)
      for (i in 1:5000){
        davg[i] = mean(sample(staircase,input$size))
      }

      par(mfrow = c(3,2))
      
      hist(staircase, col = 2, 
           xlab = "outcomes", ylab = "frequency of outcomes", yaxt = "n",
           sub = "sample size: 1",
           main = paste("mean = ", round(mean(staircase),2), 
                        "& st dev = ", round(sd(staircase),2))) 
      
      davg = rep(0,5000)
      for (i in 1:5000){
        davg[i] = mean(sample(staircase,4))
      }
      hist(davg, col = 2, 
           xlab = "outcomes", ylab = "frequency of outcomes", yaxt = "n",
           sub = paste("sample size: 4"),
           main = paste("mean = ", round(mean(davg),2), 
                        "& st dev = ", round(sd(davg),2)))
      
      davg = rep(0,5000)
      for (i in 1:5000){
        davg[i] = mean(sample(staircase,9))
      }
      hist(davg, col = 2, 
           xlab = "outcomes", ylab = "frequency of outcomes", yaxt = "n",
           sub = paste("sample size: 9"),
           main = paste("mean = ", round(mean(davg),2), 
                        "& st dev = ", round(sd(davg),2)))
      
      
      davg = rep(0,5000)
      for (i in 1:5000){
        davg[i] = mean(sample(staircase,16))
      }
      hist(davg, col = 2, 
           xlab = "outcomes", ylab = "frequency of outcomes", yaxt = "n",
           sub = paste("sample size: 16"),
           main = paste("mean = ", round(mean(davg),2), 
                        "& st dev = ", round(sd(davg),2)))
      
      davg = rep(0,5000)
      for (i in 1:5000){
        davg[i] = mean(sample(staircase,25))
      }
      hist(davg, col = 2, 
           xlab = "outcomes", ylab = "frequency of outcomes", yaxt = "n",
           sub = paste("sample size: 25"),
           main = paste("mean = ", round(mean(davg),2), 
                        "& st dev = ", round(sd(davg),2)))
      
      davg = rep(0,5000)
      for (i in 1:5000){
        davg[i] = mean(sample(staircase,36))
      }
      hist(davg, col = 2, 
           xlab = "outcomes", ylab = "frequency of outcomes", yaxt = "n",
           sub = paste("sample size: 36"),
           main = paste("mean = ", round(mean(davg),2), 
                        "& st dev = ", round(sd(davg),2)))
  })
  
  
}) # close server
