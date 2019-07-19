dfA11 <- eventReactive(c(input$selectState_1), { 
  project <- "https://data.world/nrb842/s18-edv-final-project" 
  data.world::set_config(cfg_env("DW_API")) 
  paramQuery <- data.world::qry_sql(
    "   
    SELECT healthcare_clean.state, avg(healthcare_clean.average_medicare_payments/healthcare_clean.average_covered_charges) AS ratio_of_coverage
    FROM healthcare_clean
    WHERE healthcare_clean.drg_definition IN ('207 - RESPIRATORY SYSTEM DIAGNOSIS W VENTILATOR SUPPORT 96+ HOURS', '870 - SEPTICEMIA OR SEVERE SEPSIS W MV 96+ HOURS', '853 - INFECTIOUS & PARASITIC DISEASES W O.R. PROCEDURE W MCC', '246 - PERC CARDIOVASC PROC W DRUG-ELUTING STENT W MCC OR 4+ VESSELS/STENTS', '329 - MAJOR SMALL & LARGE BOWEL PROCEDURES W MCC')
    GROUP BY healthcare_clean.state
    ")
  paramQuery$params <- c(input$selectState_1[1], input$selectState_1[2], input$selectState_1[3],input$selectState_1[4],
                         input$selectState_1[5], input$selectState_1[6], input$selectState_1[7],input$selectState_1[8],
                         input$selectState_1[9], input$selectState_1[10],input$selectState_1[11], input$selectState_1[12], input$selectState_1[13],input$selectState_1[14],
                         input$selectState_1[15], input$selectState_1[16], input$selectState_1[17],input$selectState_1[18],
                         input$selectState_1[19], input$selectState_1[20],input$selectState_1[21], input$selectState_1[22], input$selectState_1[23],input$selectState_1[24],
                         input$selectState_1[25], input$selectState_1[26], input$selectState_1[27],input$selectState_1[28],
                         input$selectState_1[29], input$selectState_1[30],input$selectState_1[31],input$selectState_1[32],input$selectState_1[33]
  )
  data.world::query(paramQuery, dataset = project)
})

dfA12 <- eventReactive(c(input$selectState_1,input$yDataMin__A1_, input$yDataMax__A1_), { 
  if( ! is.na(input$yDataMin__A1_) & ! is.na(input$yDataMax__A1_)) {
    dfA11() %>% dplyr::filter(between(input$yDataMin__A1_, input$yDataMax__A1_))
  }
  else {
    dfA11()
  }
})
