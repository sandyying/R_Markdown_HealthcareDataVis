# Change all __4_s, Download information, and edit the plot and ggplotly arguments below:
# Build Download Button and Output DataTable---------------
  output$download__4_ <- downloadHandler(
    filename = function(){"Map.csv"}, 
    content = function(fname){
      write.csv(dfB1(), fname)
    }
  )
  output$table__4_ <- renderDataTable({
    DT::datatable(dfB1() , rownames = FALSE, extensions = list(Responsive = TRUE, FixedHeader = TRUE)
    )
  })
# ---------------------------------------------------------
# Build and Output Map Plot ------------------------
  # https://rpubs.com/cpsievert/204407
  # https://spymark.shinyapps.io/reactive_leaflet/ 
  # https://github.com/spymark/data_products_proj This is the code for the example above
  # https://gist.github.com/cpsievert/53acb9e81a3082d84365
  output$LeafletMap__4_ <- renderLeaflet({leaflet(width = 1000, height = 800) %>% 
      setView(lng = -98.35, lat = 39.5, zoom = 4) %>% 
      addTiles() %>% 
      addProviderTiles("Stamen.TonerLite") %>%
      addMarkers(lng = dfB1()$Longitude,
                 lat = dfB1()$Latitude,
                 options = markerOptions(draggable = TRUE, 
                                         riseOnHover = TRUE),
                 popup = as.character(paste(dfB1()$city, ", ", 
                                            dfB1()$state)) )
  })
# ---------------------------------------------------------
