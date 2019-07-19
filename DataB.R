dfB <- eventReactive(c(input$selectState_3), { 
  project <- "https://data.world/amyfang/s18-edv-project-4" 
  data.world::set_config(cfg_env("DW_API"))
  df <- data.world::query(data.world::qry_sql("
                                              select DISTINCT  h.provider_state as state, 
                                              SUM(average_total_payments - average_medicare_payments)/SUM(total_discharges) as AOOPC, 
                                              avg(z.longitude) as Longitude, 
                                              avg(z.latitude) as Latitude from healthcare_clean h
                                              join zipcode z on h.provider_zip_code = zipcode.zip 
                                              group by h.provider_state

                                              "), dataset = project)
})

dfB1 <- eventReactive(c(input$selectState_3, input$yDataMin__4_, input$yDataMax__4_), { 
  if( ! is.na(input$yDataMin__4_) & ! is.na(input$yDataMax__4_)) {
    dfB() %>% dplyr::filter(between(AOOPC, input$yDataMin__4_, input$yDataMax__4_))
  }
  else {
    dfB()
  }
})

