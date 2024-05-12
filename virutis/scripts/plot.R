pacman::p_load(tidyr, dplyr, ggplot2, ggridges, patchwork)

cplot = function(title, pattern){
    g = list.files(path = "~/Desktop/test/results/depth", 
                       pattern = pattern, full.names = T)
    data = data.frame()
    for (f in g) {
        name = gsub(".depth.txt", "", basename(f))
        tmp = read.table(f, header = T, sep = "\t")
        tmp$name = name
        data = rbind(data, tmp)
    }
    p = ggplot(data, aes(x = position, y = depth, group = name, fill = name)) + 
        geom_area() + 
        geom_line(color = "black", linewidth = 0.1) + 
        facet_grid(~name) + 
        scale_x_continuous(expand = c(0, 0)) +
        scale_y_continuous(expand = c(0, 0)) + 
        ggtitle(title) +
        theme(legend.position="none")
    return(p)
}
g1 = cplot("JEV1", "jevg1.*.depth.txt")
g2 = cplot("JEV2", "jevg2.*.depth.txt")
g3 = cplot("JEV3", "jevg3.*.depth.txt")
g4 = cplot("JEV4", "jevg4.*.depth.txt")
g5 = cplot("JEV5", "jevg5.*.depth.txt")

all = g1 / g2 / g3 / g4 / g5

ggsave("all.depths.pdf", plot = all, height = 210, width = 297, units = "mm")
