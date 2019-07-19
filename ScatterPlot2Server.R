# Change all __S2_s, Download information, and edit the plot and ggplotly arguments below:
# Build Download Button and Output DataTable---------------
output$download__S2_ <- downloadHandler(
  filename = function(){"ScatterPlot2.csv"}, 
  content = function(fname){
    write.csv(dfS4(), fname)
  }
)
output$table__S2_ <- renderDataTable({
  DT::datatable(dfS4() , rownames = FALSE, extensions = list(Responsive = TRUE, FixedHeader = TRUE)
  )
})
# ---------------------------------------------------------
# Build and Output Throughput Plot ------------------------
output$Histogram__S2_ <- renderPlotly({
  plot = dfS4() %>% ggplot() + 
    geom_point(mapping = aes(x=average_covered_charges , y=average_medicare_payments, colour= drg_definition)) +
    geom_smooth(aes(y=average_medicare_payments, x=average_covered_charges, colour= drg_definition), method = lm, formula = y ~ x, se=TRUE) +
    
    theme_bw() +
    theme(plot.title = element_text(size = input$titleFont__S2_, face = "bold")) + 
    theme( # Legend Attributes - see https://github.com/tidyverse/ggplot2/wiki/Legend-Attributes
      legend.title=element_text(size=input$legendTitleSize__S2_), 
      legend.text=element_text(size=input$legendItemSize__S2_),
      legend.key = element_rect(size = input$legendKeySize__S2_),
      legend.key.size = unit(input$legendKeySize__S2_, 'lines')) +
    theme(axis.text=element_text(size=input$textFont__S2_),
          axis.title=element_text(size=input$textFont__S2_, face="bold"),
          axis.text.x = element_text(angle = 45, hjust = 1))  +
    theme(plot.margin=unit(c(2,2,2,2),"cm")) +
    scale_y_continuous(labels = scales::comma) + # Disable scientific notation
    ggtitle(paste(input$title__S2_)) +
    xlab(input$xLabel__S2_) + ylab(input$yLabel__S2_) +
    theme(axis.title.y = element_text(margin = margin(t = 10, r = 10, b = 10, l = 10))) +
    scale_color_discrete(name = input$legendTitle__S2_)
  
  if( ! is.na(input$plotWidth__S2_) & ! is.na(input$plotHeight__S2_))
    ggplotly(plot, tooltip = c(), session="knitr", width = input$plotWidth__S2_, height = input$plotHeight__S2_)
  else
    ggplotly(plot, tooltip = c("average_covered_charges, average_medicare_payments"), session="knitr") 
})
# ---------------------------------------------------------
