

moving_average <- function(focal_date, dates, conc, win_size_wks) {
  #which dates are in window
  is_in_window <- (dates > focal_date - (win_size_wks / 2) * 7) &
    (dates< focal_date + (win_size_wks/ 2) * 7)
  #find associated concentrations
  window_conc <- conc[is_in_window]
  #calculate mean
  result <- mean(window_conc)
  #project window size on focal date
  return(result)

}


df_moving_average <- function(df, dates, chem_vec){
  for (i in seq_along(chem_vec)){
    df[[paste0(chem_vec[i],"_rolling_average")]] <- sapply(
      X = df$sample_date,
      FUN =  moving_average, 
      dates = df$sample_date,
      conc = df[[chem_vec[i]]],
      win_size_wks = 9
    
    )
  }
  return (df)
}

    
  