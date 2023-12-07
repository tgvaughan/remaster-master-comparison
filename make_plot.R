require(tidyverse)
require(scales)

df <- read_tsv("times.txt") %>%
    rename(MASTER=t_master, ReMASTER=t_remaster) %>%
    mutate(events=lambda^2 * 4e4) %>%
    pivot_longer(-c("events","lambda"))

p <- ggplot(df, aes(events, value, col=name)) + geom_line() + geom_point() +
    scale_x_log10(labels=label_log()) +
    scale_y_log10() +
    xlab("Trajectory event count") + ylab("Running time (seconds)") +
    theme_bw() +
    theme(legend.position=c(0.83,0.19), legend.title=element_blank(),
          legend.box.background=element_rect(fill=NA, color="black"),
          legend.margin=margin(c(-0.18,0.1,0.1,0.1), unit="cm"))

ggsave("time_comparison.pdf", p, width=10, height=5.5, units="cm")


