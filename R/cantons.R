library(sp)
 require(gridExtra) # also loads grid

con <- url("http://biogeo.ucdavis.edu/data/gadm2/R/CHE_adm1.RData")
print(load(con))
close(con)



language <- c("german", "german", "german","german",
 "german","german","french", "french",
 "german","german","french", "french", 
 "german", "french","german","german",
 "german","german","german", "german",
 "german","italian","german","french",
 "french","german")

gadm$language <- as.factor(language)
col = rainbow(length(levels(gadm$id)))
spplot(gadm, "id", col.regions=col, main="lol title")

data <- c(
4.525, NA, NA, NA, 4.675, 4.67188, 4.60593, 4.578835, NA, 4.951613, 4.63015, 5, 4.626792, NA, 4.6125, 5.043478, 4.634454, 5.163265, NA, 4.862903, 4.473956, 5.194915, 4.624559, 4.562128, 4.659449, 4.439297
)
gadm$data <- data
#col = rainbow(length(levels(gadm$id)))
#lty=0
palette <- colorRampPalette(c("red", "orange", "yellow", "green"), bias=1, space = c("rgb", "Lab"), interpolate = c("linear", "spline"))(1000)
p1 = spplot(gadm, "data", col.regions = palette,  colorkey = list(space="bottom"), main="Grade Average All")

data <- c(
NA, NA, NA, NA, NA, 4.67188, 4.60593, 4.578835, NA, NA, 4.63015, NA, 4.626792, NA, NA, NA, NA, NA, NA, NA, 4.473956, NA, 4.624559, 4.562128, NA, 4.439297
)
gadm$data <- data
#col = rainbow(length(levels(gadm$id)))
#lty=0
palette <- colorRampPalette(c("red", "orange", "yellow", "green"), bias=1, space = c("rgb", "Lab"), interpolate = c("linear", "spline"))(1000)
p2 = spplot(gadm, "data", col.regions = palette,  colorkey = list(space="bottom"), main="Grade Average (>3 observations)")

 grid.arrange(p1,p2, ncol=2)

print(p1, position = c(.5,.5,1,1),more=T)
print(p2, position = c(.5,.5,1,1),more = T)
