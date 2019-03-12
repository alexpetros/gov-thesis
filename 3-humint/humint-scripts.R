library(tidyverse)
library(stringr)
library(xtable)
library(ggthemes)
library(tikzDevice)


spies <- read_csv('./american-spies.csv')

clean_spies <- spies %>% 
  mutate(year = str_extract(Date1, "([0-9]{4})")) %>% 
  rename(spy = Spy) %>% 
  select(spy, year) %>% 
  arrange(year)

year_breaks <- seq(1940, 2010, 10)
year_labels <- head(paste(year_breaks, 's', sep=''), -1)
spies_by_year <- clean_spies %>%
  filter(year >= 1945, year <= 2010) %>% 
  mutate(year = cut(as.numeric(year), breaks=year_breaks, labels=year_labels, right=FALSE)) %>% 
  group_by(year) %>% 
  summarise(count = n()) %>% 
  ungroup()

decade_spies <- ggplot(data = spies_by_year) + 
  geom_bar(mapping = aes(x=year, y=count), stat = 'identity', fill='#BC271A') +
  labs(y='Number of Americans \nrevealed spying for the USSR', x='Decade') +
  theme_few()



# output ------------------------------------------------------------------

# write_csv(clean_spies, './american-spies-clean.csv')

latex <- clean_spies %>% 
  filter(year > 1945)
# print(xtable(latex), include.rownames=FALSE)

tikz('decade_spies.tex',width=5, height=4)
decade_spies
dev.off()

