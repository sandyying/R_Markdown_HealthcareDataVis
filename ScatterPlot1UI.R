# Change "Histogram", all __S1_s, and edit tiles below:
tabItem(tabName = "Scatter1",
        tabsetPanel( 
          tabPanel("Plots"),# To create a tab panel - see https://shiny.rstudio.com/reference/shiny/latest/tabPanel.html
          tabPanel("Data", 
             dataTableOutput('table__S1_'),
             downloadButton('download__S1_',"Download the data")),
          tabPanel("Plot Size", 
             numericInput("plotWidth__S1_", "Plot Width (Required)", 900),
             numericInput("plotHeight__S1_", "Plot Height (Required)", 800)),
          tabPanel("Plot Title",
             textInput("title__S1_", "Title 1", "Avg Covered Charges VS. Avg Medicare Payment - Top 5 Most Expensive Drg"),
             numericInput("titleFont__S1_", "Title Font", 10)), 
          tabPanel("Plot Legend",
             textInput("legendTitle__S1_", "Legend Title", "Drg Definition"),
             numericInput("legendTitleSize__S1_", "Legend Title Size", 5),
             numericInput("legendItemSize__S1_", "Legend Item Size", 5),
             numericInput("legendKeySize__S1_", "Legend Key Size", 5)), 
          tabPanel("Axis Labels",
             textInput("xLabel__S1_", "x-Axis Label", "Average Covered Charges"),
             textInput("yLabel__S1_", "y-Axis Label 1", "Average Medicare Payments"),
             numericInput("textFont__S1_", "textFont", 10)),
    tabPanel("Data Size", 
             numericInput("yDataMin__S1_", "yData Minimum (Required)", 0),
             numericInput("yDataMax__S1_", "yData Maximum (Required)", NA))),
        plotlyOutput("Histogram__S1_", height=800)
)
