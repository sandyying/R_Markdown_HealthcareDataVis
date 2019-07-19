# Change all __7_s, Download information, and edit the plot and ggplotly arguments below:
# Build Download Button and Output DataTable---------------
output$download__7_ <- downloadHandler(
  filename = function(){"Histogram.csv"}, 
  content = function(fname){
    write.csv(dfH1(), fname)
  }
)
output$table__7_ <- renderDataTable({
  DT::datatable(dfH1() , rownames = FALSE, extensions = list(Responsive = TRUE, FixedHeader = TRUE)
  )
})
# ---------------------------------------------------------
# Build and Output Throughput Plot ------------------------
output$Histogram__7_ <- renderPlotly({
  plot = dfH1() %>% ggplot() + 
   
    geom_histogram(mapping = aes(x=Ratio, colour = state), binwidth = 0.04) +
    
    theme_bw() +
    theme(plot.title = element_text(size = input$titleFont__7_, face = "bold")) + 
    theme( # Legend Attributes - see https://github.com/tidyverse/ggplot2/wiki/Legend-Attributes
      legend.title=element_text(size=input$legendTitleSize__7_), 
      legend.text=element_text(size=input$legendItemSize__7_),
      legend.key = element_rect(size = input$legendKeySize__7_),
      legend.key.size = unit(input$legendKeySize__7_, 'lines')) +
    theme(axis.text=element_text(size=input$textFont__7_),
          axis.title=element_text(size=input$textFont__7_, face="bold"),
          axis.text.x = element_text(angle = 45, hjust = 1))  +
    theme(plot.margin=unit(c(2,2,2,2),"cm")) +
    scale_y_continuous(labels = scales::comma) + # Disable scientific notation
    ggtitle(paste(input$title__7_)) +
    xlab(input$xLabel__7_) + ylab(input$yLabel__7_) +
    theme(axis.title.y = element_text(margin = margin(t = 10, r = 10, b = 10, l = 10))) +
    scale_color_discrete(name = input$legendTitle__7_)
  
  if( ! is.na(input$plotWidth__7_) & ! is.na(input$plotHeight__7_))
    ggplotly(plot, tooltip = c("Count of Ratio"), session="knitr", width = input$plotWidth__7_, height = input$plotHeight__7_)
  else
    ggplotly(plot, tooltip = c("Count of Ratio"), session="knitr") 
})
# ---------------------------------------------------------
