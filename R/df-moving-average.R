#' Data Frame Moving Average
#'
#' @param df #A data frame to be looked at by the function
#' @param dates #A vector of dates over which to run the moving average
#' @param chem_vec #A vector of chemical/column names over which to run the rolling average
#'
#' @returns
#' As many vectors as chem_vec of calculated moving averages
#' @export
#'
#' @examples


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
