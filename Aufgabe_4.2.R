# Aufgabe 4.2

# Zusammenhang mit Regen
ggplot(data = filter(station_filtered_cleaned, precipitation > 0), aes(x = mean_temperature, y = count)) +
  geom_area(fill = "lightblue", color = "blue", alpha = 0.3, size = 1) +
  labs(title = "Zusammenhang zwischen Temperatur und Fahrradverleih an Regentagen", 
       x = "Temperatur (in Fahrenheit)", y = "Anzahl ausgeliehener Fahrräder") +
  scale_x_continuous(expand = c(0, 0), breaks = seq(0, max(station_filtered_cleaned$mean_temperature, na.rm = TRUE), by = 5)) +
  scale_y_continuous(expand = c(0, 0), breaks = seq(0, max(station_filtered_cleaned$count), by = 10)) +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, size = 16, face = "bold"),
    axis.title.x = element_text(size = 14),
    axis.title.y = element_text(size = 14),
    axis.text = element_text(size = 12),
    panel.grid.major = element_line(color = "lightgray", linetype = "dashed"),
    panel.background = element_rect(fill = "white"),
    plot.background = element_rect(fill = "lightgray")
  )

# Zusammenhang ohne Regen
ggplot(data = filter(station_filtered_cleaned, precipitation == 0), aes(x = mean_temperature, y = count)) +
  geom_area(fill = "lightblue", color = "blue", alpha = 0.5, size = 1) +
  labs(title = "Zusammenhang zwischen Temperatur und Fahrradverleih an trockenen Tagen", 
       x = "Temperatur (in Fahrenheit)", y = "Anzahl ausgeliehener Fahrräder") +
  scale_x_continuous(expand = c(0, 0), breaks = seq(0, max(station_filtered_cleaned$mean_temperature, na.rm = TRUE), by = 5)) +
  scale_y_continuous(expand = c(0, 0), breaks = seq(0, max(station_filtered_cleaned$count), by = 10)) +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, size = 16, face = "bold"),
    axis.title.x = element_text(size = 14),
    axis.title.y = element_text(size = 14),
    axis.text = element_text(size = 12),
    panel.grid.major = element_line(color = "lightgray", linetype = "dashed"),
    panel.background = element_rect(fill = "white"),  # Hintergrund über dem Graphen weiß
    plot.background = element_rect(fill = "lightgray")
  )
