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


psi_select <- suspension.df %>% filter(suspension.df$PSI == 1500)


t.test(log10(suspension.df$PSI), log10(psi_select$PSI))

lot1.df <- suspension.df %>% filter(suspension.df$Manufacturing_Lot == "Lot1")

lot2.df <- suspension.df %>% filter(suspension.df$Manufacturing_Lot == "Lot2")

lot3.df <- suspension.df %>% filter(suspension.df$Manufacturing_Lot == "Lot3")

t.test(log10(lot1.df$PSI), log10(psi_select$PSI))

t.test(log10(lot2.df$PSI), log10(psi_select$PSI))

t.test(log10(lot3.df$PSI), log10(psi_select$PSI))