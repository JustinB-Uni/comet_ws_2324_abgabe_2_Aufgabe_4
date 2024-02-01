# Aufgabe 4.1

# Benötigte Pakete installieren und laden
install.packages("ggplot2")
library(ggplot2)
install.packages("dplyr")
library(dplyr)
install.packages("ggthemes")
library(ggthemes)


station_filtered_cleaned <- read.table(
  file = "C:/Uni/WS_2023_2024/CoMet/CoMet_Abgabe_2/station_filtered_cleaned_winddurchschnitt.csv", # Pfad zur cdata.csv-Datei
  header = TRUE, # die Datei hat eine Kopfzeile
  sep = ",", # die Zellen sind durch Kommata getrennt
  dec="."
)


#  Zusammenhang zwischen der Anzahl ausgeliehener Fahrraeder und der Temperatur
ggplot(station_filtered_cleaned, aes(x = mean_temperature, y = count)) +
  geom_point(color = "#bababa", alpha = 0.7) +
  geom_line(stat = "summary", fun = "mean", color = "red", linewidth = 1) +
  
  labs(title = "Zusammenhang zwischen der Anzahl ausgeliehener Fahrräder und der Temperatur", 
       x = "Temperatur (in Fahrenheit)", y = "Anzahl ausgeliehener Fahrräder") +
  scale_x_continuous(expand = c(0, 0), breaks = seq(0, max(station_filtered_cleaned$mean_temperature), by = 10)) +
  scale_y_continuous(expand = c(0, 0), breaks = seq(0, max(station_filtered_cleaned$count), by = 10)) +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold")  # Hier wird die Überschrift mittig und fett ausgerichtet
  )



# Zusammenhang zwischen der Anzahl ausgeliehener Fahrraeder und der Niederschlagsmenge

# Diagramm erstellen
ggplot(filtered_data, aes(x = precipitation_factor)) +
  stat_summary(aes(y = count), fun = "sum", geom = "bar", fill = "#91bfdb", alpha = 0.7, position = position_dodge(width = 0.1)) +
  labs(title = "Gesamtanzahl der Fahrradverleihzahlen nach Niederschlagsniveau", 
       x = "Niederschlagsmenge", y = "Gesamtanzahl Fahrräder") +
  theme_minimal() +
  scale_y_continuous(breaks = seq(0, 18000, by = 1000),
                     limits = c(0, 18000)) +
  theme(
    plot.title = element_text(hjust = 0.5)  # Hier wird die Überschrift mittig ausgerichtet
  )



# Scatterplot für den Zusammenhang zwischen Windgeschwindigkeit und Anzahl ausgeliehener Fahrräder

ggplot(station_filtered_cleaned, aes(x = wind_speed, y = count)) +
  geom_point(color = "#bababa", alpha = 0.7, size = 3) +
  geom_smooth(method = "lm", se = FALSE, color = "red", size = 1) +
  labs(title = "Zusammenhang zwischen Windgeschwindigkeit und Fahrradverleih", 
       x = "Windgeschwindigkeit (in mph)", y = "Anzahl Fahrräder") +
  scale_x_continuous(expand = expansion(mult = c(0.05, 0.1)), 
                     breaks = seq(0, 25, by = 2.5)) +
  scale_y_continuous(expand = expansion(mult = c(0.05, 0.1)), 
                     breaks = seq(0, 300, by = 10)) +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold", size = 14),
    axis.title.x = element_text(size = 12),
    axis.title.y = element_text(size = 12),
    axis.text = element_text(size = 10),
    legend.position = "none",  # Entfernt die Legende
    panel.grid.major = element_line(color = "lightgray", linetype = "dashed"),
    panel.background = element_rect(fill = "white"),
    plot.background = element_rect(fill = "lightgray"),
    axis.ticks = element_line(linewidth = 0.5)  # Fügt Achsenticks hinzu
  )



# Zusammenhang zwischen der Anzahl ausgeliehener Fahrraeder und der Zeit

# Konvertiere die Spalte "date" in das Date-Format
station_filtered_cleaned$date <- as.Date(station_filtered_cleaned$date)

# Diagramm erstellen
ggplot(station_filtered_cleaned, aes(x = date, y = count)) +
  geom_line(color = "red", alpha = 0.7, linewidth = 1) +
  labs(title = "Zusammenhang zwischen Anzahl ausgeliehener Fahrräder und Zeit",
       x = "Zeit", y = "Anzahl der ausgeliehenen Fahrräder") +
  scale_y_continuous(expand = c(0, 0), breaks = seq(0, max(station_filtered_cleaned$count), by = 10)) + 
  scale_x_date(date_breaks = "1 month", date_labels = "%b %Y") +
  theme_minimal()