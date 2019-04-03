library(tidyverse)
library(stringr)
library(xtable)
library(ggthemes)
library(tikzDevice)
library(ggrepel)

SAVE_OUTPUT <- FALSE

# mickoulus alleged apies ---------------------------------------------------------

alleged_spies <- read_csv('./american-spies.csv')

clean_spies <- alleged_spies %>% 
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
  labs(y='Alleged American Spies', x='Decade') +
  theme_few()

# output a CSV
if (SAVE_OUTPUT) write_csv(clean_spies, './american-spies-clean.csv')  

# output a LaTeX table
latex <- clean_spies %>% 
  filter(year > 1945)
if (SAVE_OUTPUT) {
  tikz('decade_spies.tex',width=5, height=4)
  decade_spies
  dev.off()
}


# perserec active spies ----------------------------------------------------------

active_spies <- read_csv('./perserec-active-spies.csv')

emph_years = c(1953, 1960, 1973, 1985, 1995)
perserec_spies <- active_spies %>% 
  mutate(emph_points = ifelse(year %in% emph_years, num_spies, NA))

perserec_spies_chart <- ggplot(data = perserec_spies) + 
  geom_line(mapping = aes(x=year, y=num_spies), size = 1.5, stat = 'identity', color = 'darkblue') +
  geom_point(mapping = aes(x=year, y=emph_points), color = 'red') +
  geom_label_repel(mapping = aes(x=year, y=num_spies, label=emph_points)) +
  labs(x = 'Year', y = 'Active American Spies') +
  theme_few()

if (SAVE_OUTPUT) {
  tikz('perserec_spies.tex',width=6.5, height=4)
  perserec_spies_chart
  dev.off()
}
