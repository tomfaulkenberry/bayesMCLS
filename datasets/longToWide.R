myWd <- "~/desktop/git/bayesMCLS/datasets/"
setwd(myWd)

longDat <- read.csv("~/desktop/git/bayesMCLS/datasets/anova.csv")

wideDat <- longDat %>% tidyr::pivot_wider(names_from=c(size, format), values_from=rt)

longDatAgain <- wideDat %>% tidyr::pivot_longer(cols=c("small_digit", "large_digit", "small_word", "large_word"), 
                                                names_to = c("size", "format"),
                                                names_pattern = "(.*)_(.*)",
                                                values_to = "rt")

longDatAgain <- tidyr::pivot_longer(dat=wideDat, cols=c("small_digit", "large_digit", "small_word", "large_word"), 
                                    names_to = c("size", "format"), names_pattern = "(.*)_(.*)", values_to = "rt")