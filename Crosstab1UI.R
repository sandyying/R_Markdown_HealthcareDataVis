# Change "Histogram", all __M1_s, and edit tiles below:
tabItem(tabName = "crosstab",
        tabsetPanel( 
          tabPanel("Plots"),# To create a tab panel - see https://shiny.rstudio.com/reference/shiny/latest/tabPanel.html
          tabPanel("Data", 
             dataTableOutput('table__M1_'),
             downloadButton('download__M1_',"Download the data")),
          tabPanel("Plot Size", 
             numericInput("plotWidth__M1_", "Plot Width (Required)", 1000),
             numericInput("plotHeight__M1_", "Plot Height (Required)", NA)),
          tabPanel("Plot Title",
             textInput("title__M1_", "Title 1", "Discharges by Drg_Definition"),
             numericInput("titleFont__M1_", "Title Font", 100)), 
          tabPanel("Plot Legend",
             textInput("legendTitle__M1_", "Legend Title", "Drg_Definition"),
             numericInput("legendTitleSize__M1_", "Legend Title Size", 100),
             numericInput("legendItemSize__M1_", "Legend Item Size", 50),
             numericInput("legendKeySize__M1_", "Legend Key Size", 50)), 
          tabPanel("Axis Labels",
             textInput("xLabel__M1_", "x-Axis Label", ""),
             textInput("yLabel__M1_", "y-Axis Label 1", "Drg_Definition"),
             numericInput("textFont__M1_", "textFont", 10000000)),
    tabPanel("Data Size", 
             numericInput("yDataMin__M1_", "yData Minimum (Required)", 0),
             numericInput("yDataMax__M1_", "yData Maximum (Required)", NA))),
        plotlyOutput("Histogram__M1_", height=800)
)
