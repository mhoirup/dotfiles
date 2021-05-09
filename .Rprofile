options(tibble.width = Inf)
options(stringsAsFactors = F)
options(width = 80)

q <- function(save = 'no', ...) {
    quit(save = save)
}

options(repos = structure(c(CRAN = 'https://mirrors.dotsrc.org/cran/')))

look <- function(object) {
    if ('data.frame' %in% class(object)) {
        if (nrow(object) < 100 && ncol(object) < 10) object
        else if ('dplyr' %in% .packages()) glimpse(object)
        else str(object)
    }
    else if (class(object) %in% c('numeric', 'factor', 'character', 'integer', 'double')) {
        if (length(object) <= 200) object
        else str(object)
    }
    else if (any(class(object) == c('formula', 'ggplot'))) object
    else summary(object)
}

dsummary <- function(data, digits = 3) {
    f <- c('min', 'mean', 'max', 'sd'); summaries <- list(
        'categorical' = data.frame(),
        'numeric' = data.frame()
        )
    for (i in seq_len(ncol(data))) {
        x <- data[, i]; vunique <- sort(unique(x))
        if (length(vunique) == 2 && sum(vunique == c(0, 1)) == 2) {
            x <- as.logical(x)
        }
        if (class(x) %in% c('character', 'factor', 'logical')) {
            freq <- table(x)[which.max(table(x))]
            summaries$categorical <- rbind(summaries$categorical, data.frame(
                var = names(data)[i],
                type = class(x),
                n.unique = length(vunique),
                mode = names(freq),
                prop.mode = round(freq / nrow(data), 4) * 100,
                NAs = sum(is.na(x))
                ))
        } else {
            descriptors <- as.numeric(sapply(f, do.call, list(x, na.rm = T)))
            summaries$numeric <- rbind(summaries$numeric, data.frame(
                var = names(data)[i],
                type = ifelse(all((x %% 1) == 0), 'integer', 'double'),
                min = descriptors[1],
                mean = descriptors[2],
                max = descriptors[3],
                sd = descriptors[4],
                NAs = sum(is.na(x))
                ))
        }
    }
    summaries$numeric[, 3:6] <- sapply(summaries$numeric[, 3:6],
        formatC, digits, format = 'f')
    rownames(summaries$categorical) <- NULL
    rownames(summaries$numeric) <- NULL
    summaries
}
