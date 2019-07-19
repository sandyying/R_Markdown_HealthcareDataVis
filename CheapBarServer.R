# Change all __A2_s, Download information, and edit the plot and ggplotly arguments below:
# Build Download Button and Output DataTable---------------
output$download__A2_ <- downloadHandler(
  filename = function(){"CheapBarChart.csv"}, 
  content = function(fname){
    write.csv(dfA22(), fname)
  }
)
output$table__A2_ <- renderDataTable({
  DT::datatable(dfA22() , rownames = FALSE, extensions = list(Responsive = TRUE, FixedHeader = TRUE)
  )
})
# ---------------------------------------------------------
# Build and Output Throughput Plot ------------------------
output$Bar__A2_ <- renderPlotly({
  plot = dfA22() %>% ggplot() + 
    geom_bar(mapping = aes(x=state , y=ratio_of_coverage), stat="identity", fill="#ff6347") +
    
    
    theme_bw() +
    theme(plot.title = element_text(size = input$titleFont__A2_, face = "bold")) + 
    theme( # Legend Attributes - see https://github.com/tidyverse/ggplot2/wiki/Legend-Attributes
      legend.title=element_text(size=input$legendTitleSize__A2_), 
      legend.text=element_text(size=input$legendItemSize__A2_),
      legend.key = element_rect(size = input$legendKeySize__A2_),
      legend.key.size = unit(input$legendKeySize__A2_, 'lines')) +
    theme(axis.text=element_text(size=input$textFont__A2_),
          axis.title=element_text(size=input$textFont__A2_, face="bold"),
          axis.text.x = element_text(angle = 45, hjust = 1))  +
    theme(plot.margin=unit(c(2,2,2,2),"cm")) +
    scale_y_continuous(labels = scales::comma) + # Disable scientific notation
    ggtitle(paste(input$title__A2_)) +
    xlab(input$xLabel__A2_) + ylab(input$yLabel__A2_) +
    theme(axis.title.y = element_text(margin = margin(t = 10, r = 10, b = 10, l = 10))) +
    scale_color_discrete(name = input$legendTitle__A2_)
  
  if( ! is.na(input$plotWidth__A2_) & ! is.na(input$plotHeight__A2_))
    ggplotly(plot, tooltip = c("ratio_of_coverage"), session="knitr", width = input$plotWidth__A2_, height = input$plotHeight__A2_)
  else
    ggplotly(plot, tooltip = c("ratio_of_coverage"), session="knitr") 
})
# ---------------------------------------------------------
