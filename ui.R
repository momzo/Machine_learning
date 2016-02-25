
library(shiny)
library(shinydashboard)
library(markdown)
dashboardPage(
     dashboardHeader(title = "Wine Quality"),
     dashboardSidebar(
       sidebarMenu(
         menuItem("Data set", tabName = "Dataset",
                  icon = icon("dataset")),
         menuItem("Exploratory Data Analysis", tabName = "Exploratory Data Analysis",
                  icon = icon("Exploratory Data Analysis")),
         menuItem("Random Forest", tabName = "Random Forest",
                  icon = icon("Random Forest")),
         menuItem("Source Code", icon =icon("file-code-o"),
                  href = "http://archive.ics.uci.edu/ml/machine-learning-databases/wine-quality/")
       )
     ),
     dashboardBody(

## Data Set ==================================================
  tabPanel("DataSet",
           fluidRow(
             dataTableOutput(outputId ="table")
           )
        ),
## Exploratory Data Analysis ===================================
  tabPanel("Exploratory Data Analysis",
           mainPanel(
             h4("Normalized Features"),
             plotOutput('f_plot')
           )
        ),

## Random Forest =================================================
  tabPanel("Random Forest",
           sidebarLayout(
             sidebarPanel(
               h4('Random Forest Model'),
               sliderInput("fraction", "Training set (portion):",
                           min = 0.5, max = 0.9, value = 0.7, step = 0.1),
               sliderInput("ntree", "Number of trees:",
                          min = 50, max = 500, value = 100, step = 50),
               h4('N.B: Please be patient!
                  Do not switch tabs until the results are displayed.
                  It may take up to 1 minute to run the code')
             ),
             mainPanel(
               h4("Confusion Matrix and Statistics"),
               verbatimTextOutput('ConfMatrix'),
               plotOutput('i_plot')
             )
           )
      )
))



