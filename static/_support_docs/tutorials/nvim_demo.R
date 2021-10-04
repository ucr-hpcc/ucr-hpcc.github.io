library(tidyverse)                                                                                                                                                            
write_tsv(iris, "iris.txt") # Creates sample file                                                                                                                             
read_tsv("iris.txt") %>% # Import with read_tbv from readr package                                                                                                            
    as_tibble() %>%                                                                                                                                                           
    group_by(Species) %>%                                                                                                                                                     
    summarize_all(mean) %>%                                                                                                                                                   
    reshape2::melt(id.vars=c("Species"), variable.name = "Samples", value.name="Values") %>%                                                                                  
    ggplot(aes(Samples, Values, fill = Species)) +                                                                                                                            
    geom_bar(position="dodge", stat="identity")
