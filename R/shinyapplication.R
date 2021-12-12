# library(shiny)
# library(ggplot2)
# library(dplyr)
# library(nycflights13)
# library(shinyWidgets)
# library(missingdata581)
#
# #make sure the dataset you enter is individualized
# dframe <- teststroke
#
# ui <- fluidPage(fluidRow(
#   column(12,
#          dataTableOutput('table')
#   )
# ),
#
#   sidebarLayout(
#
#     # Inputs
#     sidebarPanel(
#       selectInput(inputId = "by",
#                   label = "Search By:",
#                   choices = list("Individual", "Variable", "Everyone"),
#                   selected = "Everyone"),
#       conditionalPanel("input.by == 'Individual'",
#                        selectInput(inputId = 'id',
#                   label = 'Select an ID',
#                   choices = dframe$individual)),
#       conditionalPanel("input.by == 'Variable'",
#                        checkboxGroupInput("checkGroup",
#                                           label = h3("Variables"),
#                          choices = names(dframe),
#                          selected = c("hypertension", "bmi"))),
#       conditionalPanel("input.by == 'Everyone'",
#                        sliderInput(inputId = 'nmiss',
#                   label = 'Minimum Number of Missing Values',
#                   min = 1,
#                   max = ncol(dframe),
#                   value = 1, step = 1))
#     ),
#
#     # Outputs
#     mainPanel(
#       plotOutput('df'),
#
#     )
#   )
# )
#
# # Server
# server <- function(input, output) {
#
#
#   dat <- reactive({
#     if (input$by =="Individual")
#     {
#       l <- is.na(dframe[input$id,])
#       l[1] <- TRUE
#       dframe[input$id,l]
#     }
#     else if (input$by == "Variable"){
#       dframe %>% missvar(input$checkGroup)
#     }
#     else {
#       dframe %>% missoutput(input$nmiss)
#     }
#   })
#
#   output$table <- renderDataTable(dat())
#
#
# }
#
# # Create a Shiny app object
# shinyApp(ui = ui, server = server)
#
