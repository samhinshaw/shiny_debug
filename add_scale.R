# Write a quick function to add geom
addScale <- function(plot, responseVar) {
  # Return the plot object along with a scale that best reflect the data represented on the y-axis
  if (responseVar == "lifeExp") {

    displayPlot <- plot + scale_y_continuous()

  } else if (responseVar == "pop") {

    displayPlot <- plot + scale_y_log10(label = scales::comma)

  } else if (responseVar == "gdpPercap") {

    displayPlot <- plot + scale_y_log10(labels = scales::dollar_format())

  } else {
    # If we didn't find a match, don't add a layer and throw a warning
    displayPlot <- plot
    warning("The scale was not modified.")

  }

  # Then return the new plot object
  return(displayPlot)
}
