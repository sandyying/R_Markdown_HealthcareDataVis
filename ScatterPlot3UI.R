# Change "Histogram", all __S3_s, and edit tiles below:
tabItem(tabName = "Scatter3",
        tabsetPanel( 
          tabPanel("Plots"),# To create a tab panel - see https://shiny.rstudio.com/reference/shiny/latest/tabPanel.html
          tabPanel("Data", 
             dataTableOutput('table__S3_'),
             downloadButton('download__S3_',"Download the data")),
          tabPanel("Plot Size", 
             numericInput("plotWidth__S3_", "Plot Width (Required)", 1000),
             numericInput("plotHeight__S3_", "Plot Height (Required)", NA)),
          tabPanel("Plot Title",
             textInput("title__S3_", "Title 1", "Avg Covered Charges VS. Avg Medicare Payment in Maryland"),
             numericInput("titleFont__S3_", "Title Font", 10)), 
          tabPanel("Plot Legend",
             textInput("legendTitle__S3_", "Legend Title", ""),
             numericInput("legendTitleSize__S3_", "Legend Title Size", 10),
             numericInput("legendItemSize__S3_", "Legend Item Size", 10),
             numericInput("legendKeySize__S3_", "Legend Key Size", 5)), 
          tabPanel("Axis Labels",
             textInput("xLabel__S3_", "x-Axis Label", "Average Covered Charges"),
             textInput("yLabel__S3_", "y-Axis Label 1", "Average Medicare  Payments"),
             numericInput("textFont__S3_", "textFont", 10)),
    tabPanel("Data Size", 
             numericInput("yDataMin__S3_", "yData Minimum (Required)", 0),
             numericInput("yDataMax__S3_", "yData Maximum (Required)", NA))),
        plotlyOutput("Histogram__S3_", height=800)
)
