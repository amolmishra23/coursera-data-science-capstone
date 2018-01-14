
if(!"shinysky" %in% rownames(installed.packages())){
  devtools::install_github("ShinySky","AnalytixWare")
}


library(shiny)
library(shinysky)
#library(shinyjs)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  #useShinyjs(),
  tags$head(
    tags$script(src="extra.js"),
    tags$link(rel = "stylesheet", type = "text/css", href = "extra.css")
  ),
  
  mainPanel(
    titlePanel("Swiftkey predictive text model"),
    p("Below is a predictive model built on the concept of n-grams. Not character input, though it is allowed, but not recommended."),
    p("Use up/down arrow keys to navigate between the prediction options."),
    p("A suggestion can be entered or the right arrow key can be clicked to tigger the autocomplete."),
    textInput.typeahead(
      id="text"
      ,placeholder="Type a sentence"
      ,local=data.frame(sentence=c(),suggestion=c())
      ,valueKey="sentence"
      ,tokens=c()
      ,template = HTML("<p class='suggest'>{{suggestion}}</p>")
    )
    ,br(),br(),
    verbatimTextOutput("suggest"),
    verbatimTextOutput("debug")
  )
  
))
