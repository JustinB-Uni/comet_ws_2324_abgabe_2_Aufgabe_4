#Aufgabe 4.3

# Histogramm für die Verteilung der Anzahl ausgeliehener Fahrräder
ggplot(station_filtered_cleaned, aes(x = count)) +
  geom_histogram(binwidth = 10, fill = "skyblue", color = "darkblue", alpha = 0.7, boundary = 0) +
  labs(title = "Verteilung der Anzahl ausgeliehener Fahrräder",
       x = "Anzahl Fahrräder", y = "Häufigkeit (in ganzen Zahlen)") +
  scale_x_continuous(expand = expansion(mult = c(0, 0.05)), breaks = seq(0, max(station_filtered_cleaned$count), by = 10)) +
  scale_y_continuous(expand = expansion(mult = c(0, 0.05)), breaks = seq(0, max(station_filtered_cleaned$count), by = 5)) +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold"),
    axis.text = element_text(size = 10, color = "black"),  # Achsentext in Schwarz
    axis.title = element_text(size = 12, color = "black"),  # Achsentitel in Schwarz
    axis.line = element_line(color = "darkgray"),
    panel.grid.major = element_line(color = "lightgray", linetype = "dashed"),
    panel.background = element_rect(fill = "white"),
    plot.background = element_rect(fill = "lightgray")
  )

# Histogramm für die Verteilung der Temperatur
ggplot(station_filtered_cleaned, aes(x = mean_temperature)) +
  geom_histogram(binwidth = 1, fill = "orange", color = "darkred", alpha = 0.5) +
  labs(title = "Verteilung der Temperatur",
       x = "Temperatur (in Fahrenheit)", y = "Häufigkeit (in ganzen Zahlen") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5, face = "bold"))

# Boxplot für die Verteilung der Niederschlagsmenge 
ggplot(station_filtered_cleaned, aes(y = precipitation)) +
  geom_boxplot(fill = "lightblue", color = "darkblue", alpha = 0.7) +
  labs(title = "Verteilung der Niederschlagsmenge",
       y = "Niederschlagsmenge (in ?)") +
  scale_y_continuous(expand = expansion(mult = c(0, 0.1)), breaks = seq(0, max(station_filtered_cleaned$precipitation), by = 0.1)) +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold")
  )

# Boxplot für die Verteilung der Windgeschwindigkeit
ggplot(station_filtered_cleaned, aes(y = wind_speed)) +
  geom_boxplot(fill = "lightgreen", color = "darkgreen", alpha = 0.7, outlier.shape = 16, outlier.color = "black") +
  labs(title = "Boxplot der Windgeschwindigkeit",
       y = "Windgeschwindigkeit (in mph.)") +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold"),
    axis.title.y = element_text(face = "italic"),
    axis.text.x = element_blank(),  # Entfernt die Beschriftung der x-Achse
    axis.line = element_line(color = "darkgray"),
    panel.grid = element_blank(),
    panel.border = element_rect(color = "darkgray", fill = NA)
  )
