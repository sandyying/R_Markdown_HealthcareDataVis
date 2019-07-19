# Change "Histogram", all __A1_s, and edit tiles below:
tabItem(tabName = "bar_expensive",
        tabsetPanel( 
          tabPanel("Plots"),# To create a tab panel - see https://shiny.rstudio.com/reference/shiny/latest/tabPanel.html
          tabPanel("Data", 
                   dataTableOutput('table__A1_'),
                   downloadButton('download__A1_',"Download the data")),
          tabPanel("Plot Size", 
                   numericInput("plotWidth__A1_", "Plot Width (Required)", 1500),
                   numericInput("plotHeight__A1_", "Plot Height (Required)", NA)),
          tabPanel("Plot Title",
                   textInput("title__A1_", "Title 1", "Top 5 Most Expensive DRGs' Ratio of Coverage by State"),
                   numericInput("titleFont__A1_", "Title Font", 10)), 
          tabPanel("Plot Legend",
                   textInput("legendTitle__A1_", "Legend Title", "States"),
                   numericInput("legendTitleSize__A1_", "Legend Title Size", 10),
                   numericInput("legendItemSize__A1_", "Legend Item Size", 10),
                   numericInput("legendKeySize__A1_", "Legend Key Size", 5)), 
          tabPanel("Axis Labels",
                   textInput("xLabel__A1_", "x-Axis Label", "States"),
                   textInput("yLabel__A1_", "y-Axis Label 1", "Ratio of Coverage"),
                   numericInput("textFont__A1_", "textFont", 6)),
          tabPanel("Data Size", 
                   numericInput("yDataMin__A1_", "yData Minimum (Required)", 0),
                   numericInput("yDataMax__A1_", "yData Maximum (Required)", NA))),
        plotlyOutput("Bar__A1_", height=800)
)
