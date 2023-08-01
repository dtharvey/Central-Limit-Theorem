library(shiny)
library(shinythemes)

ui = navbarPage("AC 3.0: Central Limit Theorem",
                theme = shinytheme("journal"),
                header = tags$head(
                  tags$link(rel = "stylesheet",
                            type = "text/css",
                            href = "style.css")
                ),
                
                # open first tab
                tabPanel("Introduction",
                 fluidRow(
                  column(width = 6,
                   wellPanel(
                    includeHTML("text/introduction.html")
                    )
                    ),
                   column(width = 6,
                    align = "center",
                     plotOutput("introplot", height = "700px")
                     )
                     )
                ), # close first tab
                
                tabPanel("The Central Limit Theorem",
                 column(width = 6,
                   wellPanel(
                    includeHTML("text/activity1.html")
                   )     
                   ),
                         
                  column(width = 6,
                   align = "center",
                    splitLayout(
                      selectInput(inputId = "dataset", 
                                  label = "choose distribution",
                                  choices = c("normal","binomial", "Poisson",
                                              "uniform", "bimodal"),
                                  selected = "normal", width = "200px",
                                  selectize = FALSE),
                      sliderInput(inputId = "size",
                                  label = "samples to average (n)",
                                  min = 2, max = 50, value = 2,
                                  width = "400px", 
                                  animate = animationOptions(interval = 1000)),
                                ),
                   plotOutput("activity1plot", height = "600px")
                                ),
                                
                         
  ), # close second tab panel
  
  # open third tab
  tabPanel("Wrapping up",
             column(width = 6,
                    wellPanel(id = "wrapupPanel",
                              style = "overflow-y:scroll; max-height: 750px",
                              includeHTML("text/wrappingup.html")
                    )
             ),
             column(width = 6,
                    align = "center",
                    plotOutput("wrapupplot", height = "700px")
             )
  ), # close third tab
  
  # tooltips
  # bsTooltip(id = "dataset",
  #           title = "Select a distribution."),
  # bsTooltip(id = "size",
  #           title = "Select the number of samples to average.")
  
  ) # close navbar

