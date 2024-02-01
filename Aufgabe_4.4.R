# Aufgabe 4.4

# Installiert und Laden von lubridate

install.packages("lubridate")
library(lubridate)

# Erstellen einer Spalte für die Jahreszeiten basierend auf den Daten

station_filtered_cleaned$season <- factor(
  ifelse(month(station_filtered_cleaned$date) %in% c(3, 4, 5), "Frühling",
         ifelse(month(station_filtered_cleaned$date) %in% c(6, 7, 8), "Sommer",
                ifelse(month(station_filtered_cleaned$date) %in% c(9, 10, 11), "Herbst", "Winter"))),
  levels = c("Frühling", "Sommer", "Herbst", "Winter")
)

# Histogramm mit überlagerten Kerndichteschätzern 

ggplot(station_filtered_cleaned, aes(x = count, fill = season)) +
  geom_density(alpha = 0.7, position = "identity") +
  labs(title = "Verteilung der Anzahl ausgeliehener Fahrräder nach Jahreszeiten",
       x = "Anzahl Fahrräder", y = "Dichte", fill = "Jahreszeit") +
  scale_x_continuous(expand = expansion(mult = c(0, 0.05)), breaks = seq(0, max(station_filtered_cleaned$count), by = 10)) +
  scale_y_continuous(expand = expansion(mult = c(0, 0.05)), breaks = seq(0, 0.03, by = 0.01)) +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold"),
    axis.text = element_text(size = 10, color = "black"),
    axis.title = element_text(size = 12, color = "black"),
    axis.line = element_line(color = "darkgray"),
    panel.grid.major = element_line(color = "lightgray", linetype = "dashed"),
    panel.background = element_rect(fill = "white"),
    plot.background = element_rect(fill = "lightgray")
  )
