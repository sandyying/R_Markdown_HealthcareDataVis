# Change all __S1_s, Download information, and edit the plot and ggplotly arguments below:
# Build Download Button and Output DataTable---------------
  output$download__S1_ <- downloadHandler(
    filename = function(){"ScatterPlot.csv"}, 
    content = function(fname){
      write.csv(dfS2(), fname)
    }
  )
  output$table__S1_ <- renderDataTable({
    DT::datatable(dfS2() , rownames = FALSE, extensions = list(Responsive = TRUE, FixedHeader = TRUE)
    )
  })
# ---------------------------------------------------------
# Build and Output Throughput Plot ------------------------
  output$Histogram__S1_ <- renderPlotly({
    plot = dfS2() %>% ggplot() + 
      geom_point(mapping = aes(x=average_covered_charges , y=average_medicare_payments, colour= drg_definition)) +
      geom_smooth(aes(y=average_medicare_payments, x=average_covered_charges, colour= drg_definition), method = lm, formula = y ~ x, se=TRUE) +
      
      theme_bw() +
      theme(plot.title = element_text(size = input$titleFont__S1_, face = "bold")) + 
      theme( # Legend Attributes - see https://github.com/tidyverse/ggplot2/wiki/Legend-Attributes
        legend.title=element_text(size=input$legendTitleSize__S1_), 
        legend.text=element_text(size=input$legendItemSize__S1_),
        legend.key = element_rect(size = input$legendKeySize__S1_),
        legend.key.size = unit(input$legendKeySize__S1_, 'lines')) +
      theme(axis.text=element_text(size=input$textFont__S1_),
            axis.title=element_text(size=input$textFont__S1_, face="bold"),
            axis.text.x = element_text(angle = 45, hjust = 1))  +
      theme(plot.margin=unit(c(2,2,2,2),"cm")) +
      scale_y_continuous(labels = scales::comma) + # Disable scientific notation
      ggtitle(paste(input$title__S1_)) +
      xlab(input$xLabel__S1_) + ylab(input$yLabel__S1_) +
      theme(axis.title.y = element_text(margin = margin(t = 10, r = 10, b = 10, l = 10))) +
      scale_color_discrete(name = input$legendTitle__S1_)
    
    if( ! is.na(input$plotWidth__S1_) & ! is.na(input$plotHeight__S1_))
      ggplotly(plot, tooltip = c(), session="knitr", width = input$plotWidth__S1_, height = input$plotHeight__S1_)
    else
      ggplotly(plot, tooltip = c("average_covered_charges, average_medicare_payments"), session="knitr") 
  })
# ---------------------------------------------------------
