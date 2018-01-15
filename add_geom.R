# Write a quick function to add geom
addGeom <- function(plot, geom) {
  #Based on the geom input provided, add the desired geom layer to the plot
  if (geom == "geom_point") {

    displayPlot <- plot + geom_point()

  } else if (geom == "geom_boxplot") {

    displayPlot <- plot + geom_boxplot()

  } else if (geom == "geom_violin") {

    displayPlot <- plot + geom_violin()

  } else {
    # If we didn't find a match, don't add a layer and throw a warning
    displayPlot <- plot
    warning("The geom you specified was not available.")

  }

  # Then return the new plot object
  return(displayPlot)
}
