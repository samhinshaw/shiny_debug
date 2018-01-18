shinyServer(function(input, output) {

  # Render the desired plot
  output$gapminderPlot <- renderPlot({

    # Filter gapminder by the years chosen from the sliderInput and the continents chosen from the checkboxGroupInput
    gapminderFiltYear <- gapminder %>%
      dplyr::filter(year >= min(input$years) & year <= max(input$years)) %>%
      dplyr::filter(continent == input$continents)

    # Plot the chart
    gapminderPlot <- ggplot(
      gapminderFiltYear,
      aes_string(x = "year", y = input$yAxis, group = "year"),
      size = input$pointSize, alpha = input$alpha, color = input$pointColor
    ) +
      ggtitle(input$title, subtitle = paste0(yAxisNames[input$yAxis], " vs. Year for Selected Continents")) +
      xlab("Year") + ylab(yAxisNames[input$yAxis])

    # Display the plot with the desired/selected aesthetic mapping
    displayPlot <- gapminderPlot %>%
      addGeom(geom = input$geom) %>%
      addScale(responseVar = input$yAxis)

    return(displayPlot)


  })
})
