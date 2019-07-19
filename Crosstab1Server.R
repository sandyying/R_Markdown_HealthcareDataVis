# Change all __M1_s, Download information, and edit the plot and ggplotly arguments below:
# Build Download Button and Output DataTable---------------
  output$download__M1_ <- downloadHandler(
    filename = function(){"Crosstab.csv"}, 
    content = function(fname){
      write.csv(dfM1(), fname)
    }
  )
  output$table__M1_ <- renderDataTable({
    DT::datatable(dfM1(), rownames = FALSE,
                  extensions = list(Responsive = TRUE, FixedHeader = TRUE)
    )
  })
  
  # Crosstab
  output$Histogram__M1_  <-renderPlotly({plot = dfM1() %>% ggplot() + 
      geom_text(aes(x=1, y=drg_definition, label=total), size=5, colour="white") +
      geom_tile(aes(x=1, y=drg_definition, fill=total), alpha=0.30) +
      theme(legend.text=element_text(size=8)) +
      theme(axis.text=element_text(size=6),
            axis.title=element_text(size=6, face="bold"))  + 
      theme(plot.title = element_text(size = 6, face = "bold")) + 
      ggtitle(paste()) +
      xlab("drg_definition") + ylab("state")
  })
# ---------------------------------------------------------
#, height = 2000, width = 2000