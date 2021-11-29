library(dplyr)

file_path <- '~/School/Analysis Projects/AutoRUS/res'

mechacar_file <- paste(file_path, 'MechaCar_mpg.csv', sep='/')


mechacar.df = read.csv(file=mechacar_file, stringsAsFactors=TRUE)

# ?lm

# head(mechacar.df)

lm_stat <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, mechacar.df)

summary(lm_stat)