# Change "ChoroplethMap", all __5_s, and edit tiles below:
tabItem(tabName = "ChoroplethMap",
        tabsetPanel( 
          tabPanel("Plots"),# To create a tab panel - see https://shiny.rstudio.com/reference/shiny/latest/tabPanel.html
          tabPanel("Data", 
                   dataTableOutput('table__5_'),
                   downloadButton('download__5_',"Download the data")),
          tabPanel("Data Size", 
                   numericInput("yDataMin__5_", "yData Minimum (Required)", 0),
                   numericInput("yDataMax__5_", "yData Maximum (Required)", NA))),
        plotlyOutput("ChoroplethMap__5_", height=800)
)
