dfS3 <- eventReactive(c(input$selectRange8), { 
  project <- "https://data.world/nrb842/s18-edv-final-project" 
  data.world::set_config(cfg_env("DW_API")) 
  paramQuery <- data.world::qry_sql(
    "   
    select average_medicare_payments, average_covered_charges, 
           drg_definition from healthcare_clean
           where  drg_definition in ('301 - PERIPHERAL VASCULAR DISORDERS W/O CC/MCC',
'303 - ATHEROSCLEROSIS W/O MCC',
'310 - CARDIAC ARRHYTHMIA & CONDUCTION DISORDERS W/O CC/MCC',
'313 - CHEST PAIN',
'897 - ALCOHOL/DRUG ABUSE OR DEPENDENCE W/O REHABILITATION THERAPY W/O MCC') and average_medicare_payments between ? and ?
    ")
  paramQuery$params <- c(input$selectRange8[1],input$selectRange8[2])
  data.world::query(paramQuery, dataset = project)
}) 
dfS4 <- eventReactive(c(input$selectRange8,input$yDataMin__S2_, input$yDataMax__S2_), { 
  if( ! is.na(input$yDataMin__S2_) & ! is.na(input$yDataMax__S2_)) {
    dfS3() %>% dplyr::filter(between(input$selectRange8,input$yDataMin__S2_, input$yDataMax__S2_))
  }
  else {
    dfS3()
  }
})
