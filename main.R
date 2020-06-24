WorldMobility <- read.csv("data\\Mobility\\Global_Mobility_Report.csv")

OhioMob <- subset(WorldMobility, WorldMobility$country_region == "United States" 
                    & WorldMobility$iso_3166_2_code == "US-OH")

qplot(x = as.Date(OhioMob$date), y = OhioMob$workplaces_percent_change_from_baseline,
      data = OhioMob, geom = "line", col = "orange", xlab = "Date", ylab = "Percent from base
      line", main = "Percent from base traveling to work",  ylim = c(-60, 100)) +
  geom_line(y = OhioMob$retail_and_recreation_percent_change_from_baseline, col = "blue") +
  geom_line(y = OhioMob$grocery_and_pharmacy_percent_change_from_baseline, col = "green") +
  geom_line(y = OhioMob$parks_percent_change_from_baseline, col = "red")
  
        