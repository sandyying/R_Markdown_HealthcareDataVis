# Change all __A1_s, Download information, and edit the plot and ggplotly arguments below:
# Build Download Button and Output DataTable---------------
output$download__A1_ <- downloadHandler(
  filename = function(){"ExpensiveBarChart.csv"}, 
  content = function(fname){
    write.csv(dfA12(), fname)
  }
)
output$table__A1_ <- renderDataTable({
  DT::datatable(dfA12() , rownames = FALSE, extensions = list(Responsive = TRUE, FixedHeader = TRUE)
  )
})
# ---------------------------------------------------------
# Build and Output Throughput Plot ------------------------
output$Bar__A1_ <- renderPlotly({
  plot = dfA12() %>% ggplot() + 
    geom_bar(mapping = aes(x=state , y=ratio_of_coverage), stat="identity", fill="#ff6347") +
    
    
    theme_bw() +
    theme(plot.title = element_text(size = input$titleFont__A1_, face = "bold")) + 
    theme( # Legend Attributes - see https://github.com/tidyverse/ggplot2/wiki/Legend-Attributes
      legend.title=element_text(size=input$legendTitleSize__A1_), 
      legend.text=element_text(size=input$legendItemSize__A1_),
      legend.key = element_rect(size = input$legendKeySize__A1_),
      legend.key.size = unit(input$legendKeySize__A1_, 'lines')) +
    theme(axis.text=element_text(size=input$textFont__A1_),
          axis.title=element_text(size=input$textFont__A1_, face="bold"),
          axis.text.x = element_text(angle = 45, hjust = 1))  +
    theme(plot.margin=unit(c(2,2,2,2),"cm")) +
    scale_y_continuous(labels = scales::comma) + # Disable scientific notation
    ggtitle(paste(input$title__A1_)) +
    xlab(input$xLabel__A1_) + ylab(input$yLabel__A1_) +
    theme(axis.title.y = element_text(margin = margin(t = 10, r = 10, b = 10, l = 10))) +
    scale_color_discrete(name = input$legendTitle__A1_)
  
  if( ! is.na(input$plotWidth__A1_) & ! is.na(input$plotHeight__A1_))
    ggplotly(plot, tooltip = c("ratio_of_coverage"), session="knitr", width = input$plotWidth__A1_, height = input$plotHeight__A1_)
  else
    ggplotly(plot, tooltip = c("ratio_of_coverage"), session="knitr") 
})
# ---------------------------------------------------------
