library(shiny)
library(shinythemes)

ui = navbarPage("AC 3.0: Central Limit Theorem",
                theme = shinytheme("journal"),
                tags$head(
                  tags$link(rel = "stylesheet",
                            type = "text/css",
                            href = "style.css")
                ),
                # # open first tab
                # tabPanel("Introduction",
                #  fluidRow(
                #   column(width = 6,
                #    wellPanel(
                #     includeHTML("introduction.html")
                #     )
                #     ),
                #    column(width = 6,
                #     align = "center",
                #      plotOutput("introplot", height = "700px")
                #      )
                #      )
                # ), # close first tab
                
                tabPanel("Visualizing the Central Limit Theorem",
                 column(width = 6,
                   wellPanel(
                    includeHTML("activity1.html")
                   )     
                   ),
                         
                  column(width = 6,
                   align = "center",
                    splitLayout(
                      selectInput(inputId = "dataset", 
                                  label = "choose distribution",
                                  choices = c("normal","binomial", "Poisson",
                                              "uniform", "bimodal", "staircase"),
                                  selected = "normal", width = "200px",
                                  selectize = FALSE),
                      sliderInput(inputId = "size",
                                  label = "samples to average",
                                  min = 1, max = 30, value = 2,
                                  width = "400px", 
                                  animate = animationOptions(interval = 1000)),
                                ),
                   plotOutput("activity1plot", height = "600px")
                                ),
                                
                         
  ) # close second tab panel
  ) # close navbar
