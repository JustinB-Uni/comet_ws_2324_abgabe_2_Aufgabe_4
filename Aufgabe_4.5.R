# Aufgabe 4.5

install.packages("plotly")
library(plotly)

# Erstellen des 3D-Scatterplots
scatter_plot <- plot_ly(data = station_filtered_cleaned, 
                        x = ~mean_temperature, 
                        y = ~wind_speed, 
                        z = ~count,
                        color = ~count, 
                        colors = "Blues", 
                        marker = list(size = 5),
                        type = "scatter3d", 
                        mode = "markers",
                        text = ~paste("Temperatur (in Fahrenheit): ", mean_temperature, "<br>Windgeschwindigkeit (in mph.): ", wind_speed, "<br>Anzal der ausgeliehenen Fahrräder: ", count))

# Hinzufügen der Achsentitel
scatter_plot <- scatter_plot %>%
  layout(scene = list(xaxis = list(title = "Temperatur (in Fahrenheit)", range = c(0, max(station_filtered_cleaned$mean_temperature)) ),
                      yaxis = list(title = "Windgeschwindigkeit (in mph.)"),
                      zaxis = list(title = "Anzahl der ausgeliehenen Fahrräder")))

# Zeigt den Plot an
scatter_plot

