library(tidyverse)
library(ggthemes)
library(tikzDevice)

SAVE_OUTPUT <- FALSE
ucs_db <- read_tsv('./UCS_Satellite_Database_12-1-2018.tsv')

# number of military satellites -------------------------------------------

satellites <- ucs_db %>% 
  rename(name = `Name of Satellite, Alternate Names`,
         responsible_country = `Country/Org of UN Registry`,
         operator_country = `Country of Operator/Owner`,
         users = Users, purpose = Purpose) %>% 
  select(name, responsible_country, operator_country, users) 

# number of satellites by country
space_powers <- c('USA', 'Russia', 'China')
satellites %>% filter(operator_country %in% space_powers) %>% count(operator_country)

satellites_by_category <- satellites %>% 
  separate(users, into = paste0('cat',seq(3)), sep = '/', fill = 'right') %>% 
  gather('catnum', 'cat', 4:6) %>%
  filter(!is.na(cat)) %>% 
  select(-catnum, -responsible_country)

country_sats <- satellites_by_category %>% 
  group_by(operator_country, cat) %>% 
  summarise(num = n()) %>% 
  filter(operator_country %in% space_powers) %>%
  arrange(desc(num))
  
country_sats_chart <- ggplot(data = country_sats) +
  geom_col(mapping = aes(x = operator_country, y = num, fill = cat), position = 'dodge') +
  scale_fill_brewer(type = 'div', palette = 5, direction = -1) +
  theme_few() +
  theme(legend.position = 'bottom', legend.spacing.x = unit(1, 'cm')) +
  labs(x = '', y = 'Number of satellites in operation', 
       title = 'Space is crowded', subtitle = 'Active satellites in orbit (December 1, 2018)') +
  guides(fill = guide_legend(title = ''))
country_sats_chart

if (SAVE_OUTPUT) {
  tikz('country_sats.tex',width=5.5, height=5)
  country_sats_chart
  dev.off()
}

