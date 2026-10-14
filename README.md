# Information and Communication Technologies (ICT) in South Africa: Quantitative Data Analysis and Exploratory Data Visualisation




**Problem**

This project showcases quantitative data analysis and 
exploratory data analysis (EDA) undertaken as part of my Master's research. 
It demonstrates my ability to independently construct and consolidate a research
dataset from published sources, prepare and clean inconsistent data for 
analysis, and use statistical summaries and visualisations to investigate 
patterns over time and across geographical areas.

A key challenge was bringing together data from multiple sources with 
differences in indicator definitions, formats, units, and temporal coverage. 
The project addressed these challenges through structured data cleaning, 
standardisation, transformation, and exploratory analysis using R.

This portfolio project highlights my ability to manage and prepare complex 
datasets, apply quantitative and exploratory analytical techniques, and 
communicate findings through effective data visualisation. It showcases my 
technical skills and analytical judgement while preserving the confidentiality 
of my full thesis and consolidated research dataset.



**Dataset**

The analysis uses a bespoke secondary dataset that I independently constructed 
and consolidated from publicly available and institutional sources.

The source material included data from the World Bank Open Data, South African 
government data portals, the South African Venture Capital and Private Equity 
Association (SAVCA), and the UNCTADStat data centre.

The consolidated data covered several analytical dimensions, including:

- **Economic and trade indicators:** Imports, exports, and investment patterns.
- **Research and development:** Indicators relating to research investment and 
innovation.
- **Innovation and intellectual property:** Patent activity and indicators of 
domestic and foreign innovation.
- **Geographical distribution:** The spatial distribution of investment and 
related activity across South Africa.
- **Temporal patterns:** Changes in selected indicators over time.

The original data was downloaded  off of the internet and converted to CSV 
format and combined into a master dataset named `gugulethu_mkhize_data.csv`. 
The dataset was subsequently cleaned and transformed in R to support descriptive
analysis and visualisation.

The complete consolidated dataset and downloaded source files are not included 
in this public portfolio.



**Methods**

The project involved a structured data preparation and exploratory analysis 
workflow.

*Data cleaning and wrangling*

- Consolidated data from multiple published sources into a single dataset.
- Inspected data structures, variables, missing values, duplicate records, and 
inconsistencies across indicators and years.
- Removed missing and duplicate values where appropriate.
- Standardised numerical entries by removing non-numeric symbols, including 
currency and percentage symbols.
- Converted relevant monetary values into billions of South African rand (ZAR) 
to support comparison.
- Renamed variables and organised the data into a consistent structure.
- Reshaped data from wide to long format, using `indicator`, `year`, and `value` 
variables.
- Created focused subsets using indicator-based filtering to support targeted 
analysis.

*Quantitative analysis and exploratory data analysis*

- Applied descriptive statistical techniques to examine data characteristics 
and patterns.
- Explored temporal trends in selected economic, investment, and innovation 
indicators.
- Compared imports and exports over time and examined their proportions of total
goods trade.
- Investigated changes in investment allocation across the observed period.
- Examined the geographical distribution of investment across South African 
provinces.
- Compared domestic and foreign patent activity to explore patterns in 
innovation and intellectual property.
- Used exploratory visualisation to identify distributions, relationships, 
irregularities, and patterns requiring interpretation.

*Data visualisation*

Created charts and graphical outputs to communicate patterns in the data, 
including line graphs, bar charts, heatmap tile plots, histograms, and spatial 
visualisations where appropriate.

The analysis was primarily descriptive. Its purpose was to identify and 
interpret observed patterns rather than establish causation from descriptive 
statistics alone.



**Tools**

- **R and RStudio:** Data cleaning, transformation, quantitative analysis, and 
visualisation.
- **`tidyverse`:** A collection of tools for data manipulation, transformation, 
and visualisation.
- **`readr`:** Importing CSV data.
- **`dplyr`:** Filtering, selecting, grouping, and summarising observations.
- **`tidyr`:** Reshaping data between wide and long formats.
- **`stringr`:** Cleaning and filtering text-based indicator names.
- **`ggplot2`:** Creating exploratory charts and visualisations.
- **R Markdown:** Organising analytical code, explanatory text, and research 
outputs and visualisations into a structured report.



**Key Insights and Outcomes**

The exploratory analysis produced several findings across trade, investment, 
innovation, and geographical distribution.

- **Trade patterns:** ICT imports exceeded exports throughout the 2010-2024 
period examined, with the reported trade gap widening over time.
- **Investment patterns:** The share of investment allocated to ICT showed an 
overall upward trajectory, alongside fluctuations across the period.
- **Geographical concentration:** Investment in the observed investee companies 
was concentrated in the Western Cape and Gauteng, with substantially lower 
representation elsewhere.
- **Patent activity:** The visualisation compares resident and non-resident 
patent application counts over the period 1980-2021. The analysis found 
considerably more non-resident than resident patent filings in the period 
examined.
- **Data management outcomes:** Consolidating and standardising the source data 
created a consistent structure suitable for filtering, subsetting, comparison, 
descriptive analysis, and visualisation.

Together, these outputs demonstrate how data preparation and exploratory 
visualisation can turn disparate secondary data into a structured empirical 
basis for examining economic, innovation, and geographical patterns of a country.

The results are descriptive findings from the selected data and periods; they 
should not, by themselves, be interpreted as proof of causation.



**Project Outputs**

This portfolio of this project focuses on selected materials that demonstrate 
the research and technical work undertaken.

- **README:** A summary of the analytical work, methods, tools, and selected 
findings.
- **R scripts:** Selected code demonstrating data cleaning, consolidation, 
transformation, subsetting, and visualisation.
- **Research visualisations:** Selected charts, graphs, and maps illustrating 
analytical patterns.
- **Supporting documentation:** Descriptions of the data preparation workflow 
and analytical techniques.

The complete consolidated dataset, downloaded source files, and full thesis PDF 
are not included in this portfolio.



**Reproducibility**

This repository is designed primarily as a portfolio showcase of my research and 
analytical capabilities, rather than as a complete reproducible research archive.

The selected scripts and visualisations demonstrate aspects of the analytical 
workflow, including data preparation, transformation, exploratory analysis, and 
visualisation. The full analysis depends on the consolidated dataset and source 
materials, which are not included in the public repository.

The project therefore highlights my ability to construct and prepare research 
data, apply quantitative and exploratory techniques, and communicate findings 
through analytical outputs.





