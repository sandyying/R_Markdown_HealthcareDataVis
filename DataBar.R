dfA <- eventReactive(c(input$selectState_4), { 
  project <- "https://data.world/amyfang/s18-edv-project-4" 
  data.world::set_config(cfg_env("DW_API")) 
  paramQuery <- data.world::qry_sql(
    "   
    SELECT distinct healthcare_clean.provider_state , b27001_001 as Covered_Population, sum(healthcare_clean.average_covered_charges), sum(healthcare_clean.average_covered_charges)/b27001_001 AS Covered_Payment_Per_Capita
  FROM   healthcare_clean join usa_all_states
    on usa_all_states.state = healthcare_clean.provider_state
    where PROVIDER_state in(?,?,?,?,?,?,?,?,?,?)
    group by healthcare_clean.provider_state
    ")
  paramQuery$params <- c(input$selectState_4[1], input$selectState_4[2], input$selectState_4[3],input$selectState_4[4],
                         input$selectState_4[5], input$selectState_4[6], input$selectState_4[7]
                         ,input$selectState_4[8], input$selectState_4[9], input$selectState_4[10])
  data.world::query(paramQuery, dataset = project)
})

dfA1 <- eventReactive(c(input$selectState_4, input$yDataMin__1_, input$yDataMax__1_), { 
  if( ! is.na(input$yDataMin__1_) & ! is.na(input$yDataMax__1_)) {
    dfA() %>% dplyr::filter(between(input$yDataMin__1_, input$yDataMax__1_))
  }
  else {
    dfA()
  }
})
