# Change "Histogram", all __S2_s, and edit tiles below:
tabItem(tabName = "Scatter2",
        tabsetPanel( 
          tabPanel("Plots"),# To create a tab panel - see https://shiny.rstudio.com/reference/shiny/latest/tabPanel.html
          tabPanel("Data", 
                   dataTableOutput('table__S2_'),
                   downloadButton('download__S2_',"Download the data")),
          tabPanel("Plot Size", 
                   numericInput("plotWidth__S2_", "Plot Width (Required)", 900),
                   numericInput("plotHeight__S2_", "Plot Height (Required)", 800)),
          tabPanel("Plot Title",
                   textInput("title__S2_", "Title 1", "Avg Covered Charges VS. Avg Medicare Payment - Bottom 5 Least Expensive Drg"),
                   numericInput("titleFont__S2_", "Title Font", 10)), 
          tabPanel("Plot Legend",
                   textInput("legendTitle__S2_", "Legend Title", "Drg_Definition"),
                   numericInput("legendTitleSize__S2_", "Legend Title Size", 5),
                   numericInput("legendItemSize__S2_", "Legend Item Size", 5),
                   numericInput("legendKeySize__S2_", "Legend Key Size", 5)), 
          tabPanel("Axis Labels",
                   textInput("xLabel__S2_", "x-Axis Label", "Average Covered Charges"),
                   textInput("yLabel__S2_", "y-Axis Label 1", "Average Medicare Payments"),
                   numericInput("textFont__S2_", "textFont", 10)),
          tabPanel("Data Size", 
                   numericInput("yDataMin__S2_", "yData Minimum (Required)", 0),
                   numericInput("yDataMax__S2_", "yData Maximum (Required)", NA))),
        plotlyOutput("Histogram__S2_", height=800)
)
