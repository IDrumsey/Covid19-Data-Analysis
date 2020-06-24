WorldMobility <- read.csv("data\\Mobility\\Global_Mobility_Report.csv")

OhioMob <- subset(WorldMobility, WorldMobility$country_region == "United States" 
                    & WorldMobility$iso_3166_2_code == "US-OH")

ggplot(data = OhioMob, aes(as.Date(date), workplaces_percent_change_from_baseline, colour = "Work")) +
  geom_line() +
  geom_line(data = OhioMob, aes(x = as.Date(date),y = retail_and_recreation_percent_change_from_baseline, colour = "Retail") 
                                 ) +
  geom_line(data = OhioMob, aes(y = grocery_and_pharmacy_percent_change_from_baseline, colour = "Grocery")) +
  geom_line(data = OhioMob, aes(y = parks_percent_change_from_baseline, colour = "Parks")) +
  geom_line(data = OhioMob, aes(y = transit_stations_percent_change_from_baseline, colour = "Transit")) +
  ylim(c(-100, 100)) +
  theme(panel.grid = element_blank(), panel.background = element_rect(fill = "white"), panel.border = 
          element_rect(colour = "black", fill = NA, size = 1)) +
  labs(x = "", y = "percent change from baseline (%)", title = "Ohio Mobility over Time") +
  theme(plot.title = element_text(hjust = .5)) +
  scale_color_manual("", values = c("Grocery"= "#a960d2","Parks" = "#ff9933",
                                    "Retail" = "#0033cc", "Transit" = "#eb002a", "Work" = "#53c155"))

ggsave("OhioMobility.png", width = 5, height = 4)  
        