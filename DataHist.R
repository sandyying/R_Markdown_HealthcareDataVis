dfHist <- eventReactive(c(input$selectState_2), { 
  project <- 'https://data.world/amyfang/s18-edv-project-4'
  data.world::set_config(cfg_env('DW_API')) 
  paramQuery <- data.world::qry_sql(
    "
    select  provider_state as state, 
    average_medicare_payments/average_covered_charges as Ratio 
    from healthcare_clean
    WHERE average_medicare_payments/average_covered_charges < 1 and provider_state in (?,?,?,?,?,?,
    ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)
    ")
  paramQuery$params <- c(input$selectState_2[1],input$selectState_2[2],input$selectState_2[3],input$selectState_2[4],
                         input$selectState_2[5],input$selectState_2[6],input$selectState_2[7],input$selectState_2[8],
                         input$selectState_2[9],input$selectState_2[10],input$selectState_2[11],input$selectState_2[12],input$selectState_2[13],input$selectState_2[14],
                         input$selectState_2[15],input$selectState_2[16],input$selectState_2[17],input$selectState_2[18],
                         input$selectState_2[19],input$selectState_2[20],input$selectState_2[21],input$selectState_2[22],input$selectState_2[23],input$selectState_2[24],
                         input$selectState_2[25],input$selectState_2[26],input$selectState_2[27],input$selectState_2[28],
                         input$selectState_2[29],input$selectState_2[30],input$selectState_2[31],input$selectState_2[32],input$selectState_2[33],input$selectState_2[34],
                         input$selectState_2[35],input$selectState_2[36],input$selectState_2[37],input$selectState_2[38],
                         input$selectState_2[39],input$selectState_2[40],input$selectState_2[41],input$selectState_2[42],input$selectState_2[43],input$selectState_2[44],
                         input$selectState_2[45],input$selectState_2[46],input$selectState_2[47],input$selectState_2[48],
                         input$selectState_2[49],input$selectState_2[50],input$selectState_2[51])
  data.world::query(paramQuery, dataset = project)
})

dfH1 <- eventReactive(c(input$selectState_2,input$yDataMin__7_, input$yDataMax__7_), { 
  if( ! is.na(input$yDataMin__7_) & ! is.na(input$yDataMax__7_)) {
    dfHist() %>% dplyr::filter(between(input$yDataMin__7_, input$yDataMax__7_))
  }
  else {
    dfHist()
  }
})

