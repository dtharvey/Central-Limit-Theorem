# Central-Limit-Theorm

A one-page application in a more traditional textual format that introduces the central limit theorem. The user can select one of four traditional distributions—normal, uniform, binomial, and Poisson—a bimodal distribution, and a staircase distribution and observe how an increase in the size of individual samples yields a distribution that appears normal by either stepping through sample sizes or as an animation.  

To run locally, install the package Shiny (if not already installed), and enter the following two lines into the console:

library(shiny)

shiny::runGitHub("Central-Limit-Theorem","dtharvey")
