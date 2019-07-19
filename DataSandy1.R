dfS1 <- eventReactive(c(input$selectRange8), { 
  project <- "https://data.world/nrb842/s18-edv-final-project" 
  data.world::set_config(cfg_env("DW_API")) 
  paramQuery <- data.world::qry_sql(
    "   
    select average_medicare_payments, average_covered_charges, 
           drg_definition from healthcare_clean
           where  drg_definition in ('207 - RESPIRATORY SYSTEM DIAGNOSIS W VENTILATOR SUPPORT 96+ HOURS',
'246 - PERC CARDIOVASC PROC W DRUG-ELUTING STENT W MCC OR 4+ VESSELS/STENTS',
'329 - MAJOR SMALL & LARGE BOWEL PROCEDURES W MCC',
'853 - INFECTIOUS & PARASITIC DISEASES W O.R. PROCEDURE W MCC',
'870 - SEPTICEMIA OR SEVERE SEPSIS W MV 96+ HOURS') and average_medicare_payments between ? and ?
    ")
  paramQuery$params <- c(input$selectRange8[1],input$selectRange8[2])
  data.world::query(paramQuery, dataset = project)
}) 
dfS2 <- eventReactive(c(input$selectRange8,input$yDataMin__S1_, input$yDataMax__S1_), { 
  if( ! is.na(input$yDataMin__S1_) & ! is.na(input$yDataMax__S1_)) {
    dfS1() %>% dplyr::filter(between(input$selectRange8,input$yDataMin__S1_, input$yDataMax__S1_))
  }
  else {
    dfS1()
  }
})
