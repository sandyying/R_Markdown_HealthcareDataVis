# Change all _s, Download information, and edit the plot and ggplotly arguments below:
# Build Download Button and Output DataTable---------------
output$download__S3_ <- downloadHandler(
  filename = function(){"ScatterPlot3.csv"}, 
  content = function(fname){
    write.csv(dfS6(), fname)
  }
)
output$table__S3_ <- renderDataTable({
  DT::datatable(dfS6() , rownames = FALSE, extensions = list(Responsive = TRUE, FixedHeader = TRUE)
  )
})
# ---------------------------------------------------------
# Build and Output Throughput Plot ------------------------
output$Histogram__S3_ <- renderPlotly({
  plot = dfS6() %>% ggplot() + 
    geom_point(mapping = aes(x=average_covered_charges , y=average_medicare_payments)) +
    geom_smooth(aes(y=average_medicare_payments, x=average_covered_charges), method = lm, formula = y ~ x, se=TRUE) +
    
    theme_bw() +
    theme(plot.title = element_text(size = input$titleFont__S3_, face = "bold")) + 
    theme( # Legend Attributes - see https://github.com/tidyverse/ggplot2/wiki/Legend-Attributes
      legend.title=element_text(size=input$legendTitleSize__S3_), 
      legend.text=element_text(size=input$legendItemSize__S3_),
      legend.key = element_rect(size = input$legendKeySize__S3_),
      legend.key.size = unit(input$legendKeySize__S3_, 'lines')) +
    theme(axis.text=element_text(size=input$textFont__S3_),
          axis.title=element_text(size=input$textFont__S3_, face="bold"),
          axis.text.x = element_text(angle = 45, hjust = 1))  +
    theme(plot.margin=unit(c(2,2,2,2),"cm")) +
    scale_y_continuous(labels = scales::comma) + # Disable scientific notation
    ggtitle(paste(input$title__S3_)) +
    xlab(input$xLabel__S3_) + ylab(input$yLabel__S3_) +
    theme(axis.title.y = element_text(margin = margin(t = 10, r = 10, b = 10, l = 10))) +
    scale_color_discrete(name = input$legendTitle__S3_)
  
  if( ! is.na(input$plotWidth__S3_) & ! is.na(input$plotHeight__S3_))
    ggplotly(plot, tooltip = c(), session="knitr", width = input$plotWidth__S3_, height = input$plotHeight__S3_)
  else
    ggplotly(plot, tooltip = c("average_covered_charges, average_medicare_payments"), session="knitr") 
})
# ---------------------------------------------------------
