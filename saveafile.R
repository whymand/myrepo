library("tidyverse")
ggplot2::mpg
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = class))
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), 22)
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)
#wednesdday week 1 notes
#grammar is system and structure of language: For graphics: "grammar of
#"graphics"... consistancy/syntax/fundamental principle of art/science
#layered grammar of graphics
# a graph is built in multiple layers, like a sandwhich: visualization task
#use ggplot2
#CHARLES MENARD THOOOOOO!!!!!!!!!!!!!!!!! many layers of info: number of troops alive, geographical
#location, temperature at a given point in time, retreat vs advance
#load Mendard data into R
#data files: troops table (lat, long, survivors, advance)
#& cities table (lat, long, city)... how to build Menard graph with these tables
#layer: data, mapping, stat, geom, posit + scale + coord + facet
#one layer is cities , one is troops?
#ANSWER: 2 layers
#axes are latitude longitude: (YES) "mapping"
#bridge between two layers, two datasets=axes

#Layer 1
#data=troops
#mapping= x long y lat .. size=survivors, color=advance retreat
#stat:= (transformation or adjustment we make to vars... we dont need
# to make bc latitude longitude values) no transformation= IDENTITY function
#geom:= what geometric object represents the data? here we are mapping raw values (data points).. use PATH
#PATH is something that connects
#(LINE reorders og dATA from least to greatest, PATH preserves ordering)
#position:= NO adjustment ("none")

#Layer 2 
#data=cities
#mapping x long y lat... city names=TEXT/LABEL
#stat = IDENTITY
#geom = TEXT (not just a point for the city long/lat, bc also the name LABEL/TEXT)
#position = NONE (no adjustment)
#scale-- how the elements visually appear... how many scales do we define
#scales apply to a specific mapping... which mapping needs a scale: survivors!
#scale= SIZE (for thickness of line-->survivors)
#scale= COLOR (defines which color used for advancing, retreating troops)

#coordinate system-- how its defined in 2d space 
#coordinate system= use a projection because map (use MERCATER projection!!!)

#facet: represent graphs side by side????
#unit of analysis in troops= troops location on map... in cities, it = city names
#location of city has no inherent meaning to troops because CITIES DONT MOVE advance retreat
#diff unit of analyiss
#facet NONE ????

#stat and position are defaulted to identity/none
#mapping gets passed on to next layer???

#now that we did "plot_both" we want to clean up




