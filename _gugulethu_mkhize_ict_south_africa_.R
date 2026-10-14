## ----warning=FALSE, message=FALSE-------------------------------------------------------------------------------------

library(ggplot2)
library(dplyr)
library(tidyr)
library(plotly)
library(gganimate)
library(gifski)
library(cowplot)
library(patchwork)
library(readr)
library(stringr)
library(ggrepel)
library(scales)
library(geodata)
library(sf)
library(ggtext) 




## ----warning=FALSE, message=FALSE-------------------------------------------------------------------------------------

tech_dev_SA <- read_csv("gugulethu_mkhize_data.csv")

head(tech_dev_SA)

str(tech_dev_SA)

summary(tech_dev_SA)


## ----warning=FALSE, message=FALSE-------------------------------------------------------------------------------------

ict_trade_exports_imports_billion_zar_data <- tech_dev_SA %>% 
  filter(str_detect(indicator, regex("ICT_Trade", ignore_case = TRUE)))
ict_trade_exports_imports_billion_zar_data

head(ict_trade_exports_imports_billion_zar_data)

line_graph_colours <- c("ICT_Trade_Exports_Billion_ZAR" = "#1b9e77",
                        "ICT_Trade_Imports_Billion_ZAR" = "#d95f02")
line_graph_colours

line_graph_indicator_labels <- c(
  "ICT_Trade_Exports_Billion_ZAR" = "ICT Exports (Billion ZAR)",
  "ICT_Trade_Imports_Billion_ZAR" = "ICT Imports (Billion ZAR)"
)
line_graph_indicator_labels




## ----warning=FALSE, message=FALSE-------------------------------------------------------------------------------------


ict_trade_line_graph <- ict_trade_exports_imports_billion_zar_data %>% 
  ggplot(aes(x = year, y = value, colour = indicator, group = indicator)) +
  geom_line(size = 1.2) +
  geom_point(size = 2) +
  scale_colour_manual(
    values = line_graph_colours,
    labels = line_graph_indicator_labels
  ) +
  labs(
    title = "More Bought Than Built",
    subtitle = "ICT Exports vs Imports Over Time",
    x = "Year", y = "Billion ZAR", colour = "Indicator Type"
  ) +
 theme_bw() +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold", size = 16, colour = "#22223B"),
    plot.subtitle = element_markdown(hjust = 0.5, size = 11, color = "grey30", face = "bold", margin = margin(b = 10)),
    axis.text.y = element_text(size = 10),
    axis.text.x = element_text(size = 10),
    axis.title.y = element_text(size = 10, face = "bold"),
    axis.title.x = element_text(size = 10, face = "bold"),
    plot.background = element_rect(colour = "black", fill = NA, linewidth = 1),
    plot.margin = margin(15, 15, 15, 15),
    legend.position = "inside",
    legend.position.inside = c(0.21, 0.80),
    legend.text = element_text(size = 9),
    legend.background = element_rect(fill = "white", colour = "black", linewidth = 0.4),
    legend.title = element_text(face = "bold")
  )
ict_trade_line_graph


ggsave("fig1_ICT_Exports_vs_Imports_Over_Time.png", ict_trade_line_graph, width = 9.5, height = 7, dpi = 300)




## ----warning=FALSE, message=FALSE-------------------------------------------------------------------------------------

ict_exports_imports_total_goods_percent_data <- tech_dev_SA %>% 
  filter(str_detect(indicator, regex("ICT_exports|ICT_imports", ignore_case = TRUE))) %>% 
  mutate(indicator = str_trim(indicator))

ict_exports_imports_total_goods_percent_data

head(ict_exports_imports_total_goods_percent_data)

indicator_labels_new <- c("ICT_exports_total_goods_percent" = "ICT Exports",
"ICT_imports_total_goods_percent" = "ICT Imports")

indicator_labels_new


ict_wide <- ict_exports_imports_total_goods_percent_data %>%
  select(year, indicator, value) %>%
  pivot_wider(names_from = indicator, values_from = value)



## ----warning=FALSE, message=FALSE-------------------------------------------------------------------------------------

ict_gap_plot <- ggplot(ict_wide, aes(x = year)) +
  geom_ribbon(aes(ymin = ICT_exports_total_goods_percent,
                   ymax = ICT_imports_total_goods_percent,
                   fill = "Gap"), alpha = 0.25) +
  geom_line(aes(y = ICT_exports_total_goods_percent, colour = "ICT Exports"), linewidth = 1.1) +
  geom_line(aes(y = ICT_imports_total_goods_percent, colour = "ICT Imports"), linewidth = 1.1) +
  geom_point(aes(y = ICT_exports_total_goods_percent, colour = "ICT Exports"), size = 2) +
  geom_point(aes(y = ICT_imports_total_goods_percent, colour = "ICT Imports"), size = 2) +
  scale_colour_viridis_d(begin = 0, end = 1) +
  scale_fill_manual(values = c("Gap" = "grey50"), guide = "none") +
  scale_y_continuous(labels = scales::percent_format(scale = 1)) +
  labs(
    title = "Baked Into the Economy",
    subtitle = "ICT Imports and Exports as % of Total Goods",
    x = "Year", y = "Percentage of Total Goods", colour = "Indicator Type"
  ) +
  theme_bw() +
 theme(
    plot.title = element_text(hjust = 0.5, face = "bold", size = 16, colour = "#22223B"),
    plot.subtitle = element_markdown(hjust = 0.5, size = 11, color = "grey30", face = "bold", margin = margin(b = 10)),
    axis.text.y = element_text(size = 10),
    axis.text.x = element_text(size = 10),
    axis.title.y = element_text(size = 10, face = "bold"),
    axis.title.x = element_text(size = 10, face = "bold"),
    plot.background = element_rect(colour = "black", fill = NA, linewidth = 1),
    plot.margin = margin(15, 15, 15, 15),
    legend.position = "inside",
    legend.position.inside = c(0.84, 0.80),
    legend.text = element_text(size = 9),
    legend.background = element_rect(fill = "white", colour = "black", linewidth = 0.4),
    legend.title = element_text(face = "bold")
  )

ict_gap_plot


ggsave("fig2_ICT_Imports_and_Exports_as_pct_of_Total_Goods.png", ict_gap_plot, width = 9.5, height = 7, dpi = 300)




## ----warning=FALSE, message=FALSE-------------------------------------------------------------------------------------

investment_primary_sector_percent_data <- tech_dev_SA %>% 
  filter(str_detect(indicator, regex("investment_primary_sector", ignore_case = TRUE)))

investment_primary_sector_percent_data

head(investment_primary_sector_percent_data)

ict_primary_sector_investment <- investment_primary_sector_percent_data %>% 
  filter(str_detect(indicator, regex("ICT", ignore_case = TRUE)))

ict_primary_sector_investment

legend_labels <- c(
  "investment_primary_sector_ICT_percent" = "Investment Flow into ICT Sector"
)
legend_labels

line_colours <- c("investment_primary_sector_ICT_percent" = "#1b9e77")

line_colours



## ----warning=FALSE, message=FALSE-------------------------------------------------------------------------------------


ict_primary_sector <- ggplot(ict_primary_sector_investment,
aes(x = as.numeric(year), y = value, colour = indicator, group = indicator)) +
  geom_line(size = 1) +
  geom_point(size = 2) +
  scale_colour_manual(values = line_colours, labels = legend_labels) +
  labs(
    title = "Where the Money Resides",
    subtitle = "Investment in ICT (as % of Total Primary Sector Investment)",
    x = "Year",
    y = "Percentage of Total Investment",
    colour = "Category"
  ) +
  theme_bw() +
  scale_x_continuous(
    breaks = seq(
      min(ict_primary_sector_investment$year, na.rm = TRUE),
      max(ict_primary_sector_investment$year, na.rm = TRUE), 
      by = 2
      )
    ) + 
  scale_y_continuous(labels = scales::percent_format(scale = 1)) +
  theme(
    plot.title = element_text(hjust = 0.5, size = 16, face = "bold", color = "#22223B"),
    plot.subtitle = element_markdown(hjust = 0.5, size = 11, color = "grey30", face = "bold", margin = margin(b = 10), lineheight = 1.4),
    axis.text.y = element_text(size = 10),
    axis.text.x = element_text(angle = 0, hjust = 0.5, size = 10),
    axis.title.y = element_text(size = 10, face = "bold"),
    axis.title.x = element_text(size = 10, face = "bold"),
    legend.title = element_text(face = "bold"),
    legend.text = element_text(size = 9),
    plot.background = element_rect(colour = "black", fill = NA, linewidth = 1),
    plot.margin = margin(15, 15, 15, 15),
    legend.position = "inside",
    legend.position.inside = c(0.25, 0.85),
    legend.background = element_rect(fill = "white", colour = "black", linewidth = 0.4)
  )

ict_primary_sector


ggsave("fig3_Investment_in_ICT_as_pct_of_Total_Primary_Sector_Investment.png", ict_primary_sector, width = 9.5, height = 7, dpi = 300)




## ----warning=FALSE, message=FALSE-------------------------------------------------------------------------------------
investment_by_sector_percent_data <- tech_dev_SA %>% 
  filter(str_detect(indicator, regex("investment_by_sector", ignore_case = TRUE)))

investment_by_sector_percent_data

head(investment_by_sector_percent_data)




## ----warning=FALSE, message=FALSE-------------------------------------------------------------------------------------


sa <- gadm(country = "ZAF", level = 1, path = tempdir()) |> st_as_sf()

bubbles <- tibble::tibble(
  label = c("Western Cape", "Gauteng", "KwaZulu-Natal",
            "Rest of SA\n(6 provinces, aggregate)"),
  lon   = c(21.0, 28.05, 30.5, 26.7),
  lat   = c(-33.2, -26.05, -28.5, -28.9),
  share = c(53.0, 33.8, 3.2, 3.5)
)

p <- ggplot() +
  geom_sf(data = sa, fill = "white", color = "#3D5A80", linewidth = 0.9) +
  geom_point(data = bubbles,
             aes(x = lon, y = lat, size = share, fill = share),
             shape = 21, color = "white", stroke = 1.2, alpha = 1) +
  geom_label_repel(data = bubbles,
                    aes(x = lon, y = lat, label = paste0(label, ": ", share, "%")),
                    size = 3.2, fontface = "bold", color = "black",
                    fill = "white", label.size = 0.3, label.r = unit(0.15, "lines"),
                    segment.color = "#3D5A80", segment.size = 0.4) +
  scale_size_continuous(range = c(4, 30), guide = "none") +
  scale_fill_viridis_c(option = "viridis", guide = "none") +
  labs(
    title = "Where the Capital Lands",
    subtitle = "ICT investee company locations by province, *2013 - 2024*",
    caption = "***Note***. Circle size = Share (%). *'Rest of SA'* combines six provinces (Eastern Cape, Free State, Limpopo, Mpumalanga, North West, Northern Cape) - the source data reports no per-province breakdown for them. An additional 6.5% of investees are based outside South Africa and are not mapped here. Adapted from SAVCA 2025 Venture Capital Industry Survey, p.12."

  ) +
  coord_sf(clip = "off") +
  theme_void(base_size = 13) +
  theme(
    legend.position = "none",
    plot.title = element_text(hjust = 0.5, face = "bold", size = 16, color = "#22223B"),
    plot.subtitle = element_markdown(hjust = 0.5, size = 11, color = "grey30", face = "bold"),
    plot.caption = element_textbox_simple(
      size = 7.5, color = "grey40", hjust = 0, halign = 0,
      width = unit(1, "npc"), lineheight = 1.2,
      padding = margin(18, 0, 0, 0)   # was margin(4, 0, 0, 0) — more top space
    ),
    plot.margin = margin(10, 20, 15, 10)  # slightly more bottom room too
  )

p
ggsave("fig4_ICT_investee_company_locations_by_province_2013_2024.png", p, width = 9.5, height = 7, dpi = 300)



## ----warning=FALSE, message=FALSE-------------------------------------------------------------------------------------

patent_data <- tech_dev_SA %>% 
  filter(str_detect(indicator, regex("patent", ignore_case = TRUE)))
patent_data
head(patent_data)

patent_activity <- patent_data %>% 
  filter(str_detect(indicator, regex("patent", ignore_case = TRUE))) %>% 
  mutate(year = as.numeric(year),
         value = as.numeric(value))

year_breaks <- seq(min(patent_activity$year, na.rm = TRUE),
                    max(patent_activity$year, na.rm = TRUE), by = 5)



## ----warning=FALSE, message=FALSE-------------------------------------------------------------------------------------

patent_activity <- ggplot(patent_activity, aes(x = factor(year), y = indicator, fill = value)) +
  geom_tile(colour = "white", linewidth = 0.3) +
  scale_fill_viridis_c(name = "Number of\nPatents") +
  scale_x_discrete(breaks = as.character(year_breaks), expand = c(0, 0)) +
  scale_y_discrete(labels = c("patent_applications_nonresidents" = "Foreign Patents",
                               "patent_applications_residents" = "Domestic Patents"),
                    expand = c(0, 0)) +
  labs(
    title = "Where the Ideas Come From",
    subtitle = "**Patent Activity: Domestic vs. Foreign (1980 - 2021)**<br><span style='font-size:9pt;color:gray40'>Number of Patents Filed by Origin</span>",
    x = "Year", y = NULL
  ) +
  theme_minimal(base_size = 13) +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold", size = 16, color = "#22223B"),
    plot.subtitle = element_markdown(size = 11, lineheight = 1.4, margin = margin(b = 10), hjust = 0.5, color = "grey30"),
    plot.title.position = "plot",
    axis.text.y = element_text(size = 10, face = "bold"),
    axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5, size = 10),
    axis.title.x = element_text(size = 10, face = "bold"),
    axis.title.y = element_text(size = 10, face = "bold"),
    axis.ticks.x = element_line(colour = "black", linewidth = 0.4),
    axis.ticks.length.x = unit(4, "pt"),
    panel.grid = element_blank(),
    plot.background = element_rect(colour = "black", fill = NA, linewidth = 1),
    plot.margin = margin(15, 15, 15, 15),
    legend.position = "right",
legend.title = element_text(face = "bold", size = 10),
legend.text = element_text(size = 9)
  )

patent_activity 


ggsave("fig5_Patent_Activity_Domestic_vs_Foreign_1980_2021.png", patent_activity, width = 9.5, height = 7, dpi = 300)


