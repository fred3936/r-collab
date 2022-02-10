library(tidyverse)

mpg

cars

head(cars)

tail(cars, 10)

view(cars)

?ggplot

ggplot(data = mpg)+
  geom_point(mapping = aes(x=displ,y=hwy))

ggplot(data = mpg)+
  geom_point(mapping = aes(x=hwy,y=cyl))

ggplot(data = mpg)+
  geom_point(mapping = aes(x=displ, y=hwy, color= class, size =cyl), shape =1)

ggplot (data = mpg)+
  geom_point(mapping = aes(x =displ, y=hwy), color='blue')+
  geom_smooth(mapping = aes(x=displ, y=hwy))

ggplot (data = mpg, mapping = aes(x =displ, y=hwy))+
  geom_point(color='blue')+
  geom_smooth() +
  facet_wrap(~class, ncol = 3)
