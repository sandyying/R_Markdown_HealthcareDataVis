dfM <- eventReactive(c(input$selectDrg), {   
  project <- "https://data.world/nrb842/s18-edv-final-project" 
  data.world::set_config(cfg_env("DW_API")) 
  paramQuery <- data.world::qry_sql(
    "   
    SELECT drg_definition, sum(total_discharges) as total
    FROM healthcare_clean
    group by drg_definition
    having sum(total_discharges) between ? and ?
    order by drg_definition
    
    ")
  paramQuery$params <- c(input$selectDrg[1],input$selectDrg[2])
 data.world::query(paramQuery, dataset = project)
})
dfM1 <- eventReactive(c(input$selectDrg, input$yDataMin__M1_, input$yDataMax__M1_), { 
  if( ! is.na(input$yDataMin__M1_) & ! is.na(input$yDataMax__M1_)) {
    dfM() %>% dplyr::filter(between(input$selectDrg, input$yDataMin__M1_, input$yDataMax__M1_))
  }
  else {
    dfM()
  }
})