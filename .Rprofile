options(tibble.width = Inf)
options(stringsAsFactors = F)
options(width = 80)

q <- function(save = 'no', ...) {
    quit(save = save)
}

options(repos = structure(c(CRAN = 'https://mirrors.dotsrc.org/cran/')))

look <- function(object) {
    if (class(object) == 'data.frame') {
        if (nrow(object) < 100 && ncol(object) < 10) object
        else if ('dplyr' %in% .packages()) glimpse(object)
        else str(object)
    }
    else if (class(object) %in% c('numeric', 'factor', 'character', 'integer', 'double')) {
        if (length(object) <= 200) object
        else str(object)
    }
    else summary(object)
}

