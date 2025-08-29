#' Moving Average
#'
#' @param focal_date #The date that you are focusing on for the moving average
#' @param dates #A range of dates that you want the rolling average to tabulate over
#' @param conc #concentration of a nutrient 
#' @param win_size_wks #window size of how many weeks you want the rolling average over
#'
#' @returns
#' A value of the average concentration around a focal date.
#' @export
#'
#' @examples



moving_average <- function(focal_date, dates, conc, win_size_wks) {
  #which dates are in window
  is_in_window <- (dates > focal_date - (win_size_wks / 2) * 7) &
    (dates< focal_date + (win_size_wks/ 2) * 7)
  #find associated concentrations
  window_conc <- conc[is_in_window]
  #calculate mean
  result <- mean(window_conc, na.rm = TRUE)
  #project window size on focal date
  return(result)

}



    
  