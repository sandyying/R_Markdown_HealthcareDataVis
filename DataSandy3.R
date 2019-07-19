dfS5 <- eventReactive(c(input$selectRange8), { 
  project <- "https://data.world/nrb842/s18-edv-final-project" 
  data.world::set_config(cfg_env("DW_API")) 
  paramQuery <- data.world::qry_sql(
    "   
    select average_medicare_payments, average_covered_charges, 
           drg_definition from healthcare_clean
           where provider_state in ('MD') 
    ")
  paramQuery$params <- c(input$selectRange8,input$selectRange8[1],input$selectRange8[2])
  data.world::query(paramQuery, dataset = project)
}) 
dfS6 <- eventReactive(c(input$yDataMin__S3_, input$yDataMax__S3_), { 
  if( ! is.na(input$yDataMin__S3_) & ! is.na(input$yDataMax__S3_)) {
    dfS5() %>% dplyr::filter(between(input$yDataMin__S3_, input$yDataMax__S3_))
  }
  else {
    dfS5()
  }
})
