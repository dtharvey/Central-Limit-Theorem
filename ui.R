# ui for central limit therom app

ui = navbarPage("AC 3.0: Central Limit Theorem",
                theme = shinytheme("journal"),
                header = tags$head(
                  tags$link(rel = "stylesheet",
                            type = "text/css",
                            href = "style.css")
                ),
                
  # open introduction tab
      tabPanel("Introduction",
        fluidRow(
          withMathJax(),
              column(width = 6,
                wellPanel(
                    class = "scrollable-well",
                    div(
                        class = "html-fragment",
                        includeHTML("text/introduction.html")
                        )
                                  )),
                column(width = 6,
                      align = "center",
                      plotOutput("introplot", height = "600px")
                           )
                         )
                ), # close introduction tab
                
  # open first activity tab
     tabPanel("The Central Limit Theorem",
       fluidRow(
          column(width = 6,
                wellPanel(
                    class = "scrollable-well",
                      div(
                          class = "html-fragment",
                          includeHTML("text/activity1.html")
                          )
                                  )),
                           
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
                              width = "400px"),
                              ),
                                 plotOutput("activity1plot", height = "500px")
                           ),
                         )), # close tabpanel for first activity
                
  # open tab for wrapping-up
      tabPanel("Wrapping up",
       fluidRow(
        column(width = 6,
          wellPanel(
                    class = "scrollable-well",
                    div(
                      class = "html-fragment",
                         includeHTML("text/wrappingup.html")
                        )
                                  )),
         column(width = 6,
           align = "center",
             plotOutput("wrapupplot", height = "600px")
                           )
                         )), # close tab for wrapping up
) # close navbar

