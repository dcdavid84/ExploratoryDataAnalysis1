# load library required for 
#       -fread (large datasets): data.table
#       -Date variable casting: lubridate
#       -handling data tables: dplyr

library(data.table)
library(dplyr)
library(lubridate)

# download file
url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
filename<-"ElectricpowerConsumption.zip"
download.file(url, destfile=filename)

# unzip downloaded zip file and store in wd
unzip(filename)

# read dataset, convert to tiblle and store in variable "epowercon"
epowercon <- as_tibble(fread("household_power_consumption.txt"))
epowercon %>% mutate(Data=dmy(Date),Time=hms(Time))->epowercon
