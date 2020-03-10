#EPI5143 Data visualization lecture - March 27, 2019
#If you have not installed the packages in the library() calls before:
#Tools --> Install packages --> then search and install each before running the codes below

#to see available ColorBrewer pallettes:
library (RColorBrewer)
display.brewer.all()

#ggplot example #1: using mtcars (built-in R dataset)

library (ggplot2)
library (dplyr) #for calls such as glimpse()

glimpse (mtcars) 
head (mtcars)

ggplot(mtcars, aes(x=hp, y=mpg)) +
  geom_point(size=3, aes(color=factor(cyl), shape=factor(cyl))) +
  geom_smooth(method="lm", aes(color=factor(cyl), fill=factor(cyl))) +
  geom_smooth(method="loess", color="black", se=FALSE)

#ggplot example #2 - animated 
#install and load gapminder dataset and ggnimate package
library(gapminder)
library (gganimate)

glimpse(gapminder)

#each country is represented by a shade of that particular family of colors
#country_colors is a variable already in the gapminder package. 
#It encodes the color schemes for the countries in the gapminder dataset
plot2 <- ggplot(gapminder, aes(gdpPercap, lifeExp, size = pop, color = country)) +
  geom_point(alpha = 0.7, show.legend = FALSE) +
  scale_colour_manual(values = country_colors) +
  scale_size(range = c(2, 12)) +
  scale_x_log10() +
  facet_wrap(~continent) 

plot2

# now the gganimate specific bits
plot2 +labs(title = 'Year: {frame_time}', x = 'GDP per capita', y = 'life expectancy') +
  transition_time(year) +
  ease_aes('linear')