library(tidyverse)
read_csv("gapminder_1997.csv")
gapminder_1997 <- read.csv("gapminder_1997.csv")
name <- "Courtney"
age <- 97
Age <- 43
?read_csv
round(3.1415,digits = 2)
ggplot(data = gapminder_1997) + 
  aes(x=gdpPercap) + 
  labs(x="GDP Per Capita") +
  aes(y=lifeExp) +
  labs(y="Life Expectancy") +
  geom_point() +
  labs(title="Do people in wealthy countries live longer?") +
  aes(color=continent) +
  scale_color_brewer(palette = "Set1") +
  aes(size=pop/1000000) +
  labs(size="Population (in millions)")

ggplot(data=gapminder_1997)+
  aes(x=gdpPercap, y=lifeExp, color=continent, size=pop/1000000) +
  geom_point()+
  labs(x="GDP Per Capita", y="Life Expectancy",
       title="Do people in wealthy countries live longer?", size="Population (in millions)") +
  scale_color_brewer(palette="Set1")

gapminder_data <- read_csv("gapminder_data.csv")

ggplot(data=gapminder_data)+
  aes(x=year, y=lifeExp, color=continent, group=country)+
  geom_line()

ggplot(data=gapminder_data)+
  aes(x=continent, y=lifeExp)+
  geom_jitter(aes(color=continent))+
  geom_boxplot(fill="yellow")

ggplot(data=gapminder_data)+
  aes(x=continent, y=lifeExp)+
  geom_boxplot(aes(fill="green"))+
  geom_jitter(alpha=0.5)

ggplot(gapminder_1997)+
  aes(x=lifeExp)+
  geom_histogram(bin = 20)+
  theme_bw()

ggplot(gapminder_1997)+
  aes(x=gdpPercap, y= lifeExp)+
  geom_point()+
  facet_wrap(vars(continent))

ggplot(gapminder_1997)+
  aes(x=gdpPercap, y= lifeExp)+
  geom_point()+
  facet_grid(rows=vars(continent))

ggplot(gapminder_1997)+
  aes(x=continent, y=lifeExp)+
  geom_violin(aes(fill=continent))+
  theme_classic()

ggsave("awesome_plot.jpg")

violin_plot <- ggplot(gapminder_1997)+
  aes(x=continent, y=lifeExp)+
  geom_violin(aes(fill=continent))+
  theme_classic()

violin_plot

ggsave("awesome_plot.jpg", plot=violin_plot,width=6, height=4)

install.packages("gganimate")
install.packages("gifski")
library(gganimate)
library(gifski)

ggplot(data=gapminder_data)+
  aes(x=log(gdpPercap), y=lifeExp, color=continent, size=pop/1000000)+
  geom_point(alpha=0.5)+
  theme_classic()+
  labs(x="GDP per capita", y="Life Expectancy", color="Continent", size="Population (in millions)")+
  scale_color_brewer(palette = "Set1")

staticPlot <- ggplot(data=gapminder_data)+
  aes(x=log(gdpPercap), y=lifeExp, color=continent, size=pop/1000000)+
  geom_point(alpha=0.5)+
  theme_classic()+
  labs(x="GDP per capita", y="Life Expectancy", color="Continent", size="Population (in millions)")+
  scale_color_brewer(palette = "Set1")
animatedPlot <- staticPlot+
  transition_states(year)+
  ggtitle("{closest_state}")
animatedPlot

anim_save("animatedPlot.gif", plot=animatedPlot, renderer=gifski_renderer())

