library(sf); library(viridis); library(ggplot2)
library(dplyr); library(data.table); library(stringr); library(ggspatial)
library(lubridate)

#load shp file of sido/sgg unit
sido_sf <- read_sf("data_badn_sgg, sido_2021/bnd_sido_00_2021_2021_2Q.shp") %>% st_transform(4326)
grid_1km <- read_sf("all_mean_shp/all_mean.shp") %>% st_transform(4326)
grid_1km = grid_1km %>% select(-c(geo_y_cen,geo_x_cen,PM2_5))
gc()

`%notin%` <- Negate(`%in%`)
korea <- sido_sf %>% filter(SIDO_CD < 39)

library(RColorBrewer)

period = scan("web/file.txt", what="", sep="\n")
period_diff = as.integer(as.Date(period[2])-as.Date(period[1]))

data <- fread("rf_concat_for_map.csv")
#dat <- data[data$month %in% seq(1,12,length=12), ]  #(period[1],period[2],length=as.integer(as.Date(period[2])-as.Date(period[1])))

gc()

dates = period[1]

for (i in seq(1,period_diff)) {
  #dat <- dat %>% group_by(month,geo_id) %>% summarise_all(list(mean))
  dat = data[data$date==dates]
  dat <- grid_1km %>% left_join(dat,by=c('geo_id'="geo_id"))

  #windows()
  #future_sf %>%
  
  pp <- ggplot(data=dat) +
    ggtitle(paste0(dates,' PM2.5 Concentration')) +
    geom_sf(aes(color=PM2_5)) +
    scale_color_viridis(option='H',
                        breaks = seq(5,60,by=5),
                        #limits=c(0.4,0.75),
                        name = "PM2.5\nconcentration") +
    geom_sf(data=korea,fill=NA,lwd=0.7) +
    coord_sf(xlim=c(126.2,129.5),ylim=c(34.4,38.5)) +
    theme_bw() +
    ggspatial::annotation_scale(
      location = "br",
      width_hint=0.5
    ) +
#    ggspatial::annotation_north_arrow(
#      location = "tr", which_north = "true",
#      height=unit(2,"cm"),width=unit(2,"cm"),
#      pad_x = unit(0.1, "in"), pad_y = unit(0.2, "in"),
#      style = north_arrow_fancy_orienteering
#    ) +
    
    #facet_wrap(~month,nrow = 3) + # (PM2_5~year,nrow = 3)    (year,nrow = 3)    vars(year)
    theme_bw() +
#    theme(plot.title = element_text(hjust=0.5,face='bold',size=20),
#          axis.text.x = element_blank(),axis.ticks = element_blank(),
#          plot.background = element_rect(fill = NA, color = NA),
#          panel.background = element_rect(fill = NA, color = NA),
#          panel.border = element_rect(colour = "black", fill = NA),
#          legend.key.height = unit(2, "cm"),
#          panel.grid.major = element_blank())
  
  
  
  png(filename = paste0("web/",dates,"_pm25.png"),
       width = 960, height = 960, units = "px", pointsize = 14,
       compression = c("none", "rle", "lzw", "jpeg", "zip", "lzw+p", "zip+p"),
       bg = "white", res = NA, family = "", restoreConsole = TRUE,
       type = c("windows", "cairo"))
  
  print(pp)
  dev.off()
  
  dates = as.Date(dates)+days(1)
}
