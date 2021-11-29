library(dplyr)

file_path <- '~/School/Analysis Projects/AutoRUS/res'

mechacar_file <- paste(file_path, 'MechaCar_mpg.csv', sep='/')


mechacar.df = read.csv(file=mechacar_file, stringsAsFactors=TRUE)

# ?lm

# head(mechacar.df)

lm_stat <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, mechacar.df)

summary(lm_stat)

suspension_file = paste(file_path, 'Suspension_Coil.csv', sep='/')

suspension.df = read.csv(file=suspension_file, stringsAsFactors=TRUE)

head(suspension.df)

total_summary <- summarize(suspension.df, Mean=mean(PSI), 
                           Median=median(PSI),
                           Variance=var(PSI),
                           SD=sd(PSI))

lot_summary <- suspension.df %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI), 
                                                         Median=median(PSI),
                                                         Variance=var(PSI),
                                                         SD=sd(PSI))