# Change "LeafletMap", all __4_s, and edit tiles below:
tabItem(tabName = "LeafletMap",
      tabsetPanel( 
        tabPanel("Plots"),# To create a tab panel - see https://shiny.rstudio.com/reference/shiny/latest/tabPanel.html
        tabPanel("Data", 
           dataTableOutput('table__4_'),
           downloadButton('download__4_',"Download the data")),
        tabPanel("Data Size", 
           numericInput("yDataMin__4_", "yData Minimum (Required)", 0),
           numericInput("yDataMax__4_", "yData Maximum (Required)", NA))),
      leafletOutput("LeafletMap__4_", height=800)
)
