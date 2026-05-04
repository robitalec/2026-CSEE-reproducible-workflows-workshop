plot_xy <- function(DT, x_col, y_col, color_col) {
  stopifnot(x_col %in% colnames(DT))
  stopifnot(y_col %in% colnames(DT))

  #stopifnot(color_col %in% colnames(DT))

  g <- if (missing(color_col)) geom_point() else geom_point(aes(color = .data[[color_col]]))
  h <- if (missing(color_col)) geom_line() else geom_line(aes(color = .data[[color_col]]))

  ggplot(DT, aes(.data[[x_col]], .data[[y_col]])) + g + h

}