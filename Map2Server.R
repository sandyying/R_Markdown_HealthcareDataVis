# Change all __5_s, Download information, and edit the plot and ggplotly arguments below:
# Build Download Button and Output DataTable---------------
output$download__5_ <- downloadHandler(
  filename = function(){"Map.csv"}, 
  content = function(fname){
    write.csv(dfB1(), fname)
  }
)
output$table__5_ <- renderDataTable({
  DT::datatable(dfB1() , rownames = FALSE, extensions = list(Responsive = TRUE, FixedHeader = TRUE)
  )
})
# ---------------------------------------------------------
# Build and Output Map Plot ------------------------
# https://rpubs.com/cpsievert/204407
# https://spymark.shinyapps.io/reactive_leaflet/ 
# https://github.com/spymark/data_products_proj This is the code for the example above
# https://gist.github.com/cpsievert/53acb9e81a3082d84365
output$ChoroplethMap__5_ <- renderPlotly({
  g <- list(
    scope = 'usa',
    projection = list(type = 'albers usa'),
    showlakes = TRUE,
    lakecolor = toRGB('white')
  )
  plot_geo(dfB1(), locationmode = 'USA-states') %>%
    add_trace(
      z = ~AOOPC, locations = ~state,
      color = ~AOOPC, colors = 'Reds'
    ) %>%
    colorbar(title = " USD") %>%
    layout(
      title = 'AOOPC',
      geo = g
    )
})
# ---------------------------------------------------------
