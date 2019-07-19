# Change "Histogram", all __A2_s, and edit tiles below:
tabItem(tabName = "bar_cheap",
        tabsetPanel( 
          tabPanel("Plots"),# To create a tab panel - see https://shiny.rstudio.com/reference/shiny/latest/tabPanel.html
          tabPanel("Data", 
                   dataTableOutput('table__A2_'),
                   downloadButton('download__A2_',"Download the data")),
          tabPanel("Plot Size", 
                   numericInput("plotWidth__A2_", "Plot Width (Required)", 1500),
                   numericInput("plotHeight__A2_", "Plot Height (Required)", NA)),
          tabPanel("Plot Title",
                   textInput("title__A2_", "Title 1", "Top 5 Cheapest DRGs' Ratio of Coverage by State"),
                   numericInput("titleFont__A2_", "Title Font", 10)), 
          tabPanel("Plot Legend",
                   textInput("legendTitle__A2_", "Legend Title", "States"),
                   numericInput("legendTitleSize__A2_", "Legend Title Size", 10),
                   numericInput("legendItemSize__A2_", "Legend Item Size", 10),
                   numericInput("legendKeySize__A2_", "Legend Key Size", 5)), 
          tabPanel("Axis Labels",
                   textInput("xLabel__A2_", "x-Axis Label", "States"),
                   textInput("yLabel__A2_", "y-Axis Label 1", "Ratio of Coverage"),
                   numericInput("textFont__A2_", "textFont", 6)),
          tabPanel("Data Size", 
                   numericInput("yDataMin__A2_", "yData Minimum (Required)", 0),
                   numericInput("yDataMax__A2_", "yData Maximum (Required)", NA))),
        plotlyOutput("Bar__A2_", height=800)
)
