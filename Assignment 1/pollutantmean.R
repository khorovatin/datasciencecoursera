pollutantmean <- function(directory, pollutant, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)
        alldata <- data.frame()
        
        for(monitor in id) {
                alldata <- rbind(alldata, 
                                 read.csv(paste0(directory, 
                                                "/", 
                                                formatC(monitor, width=3, flag="0"), 
                                                ".csv")))
        }
        
        mean(alldata[[pollutant]], na.rm = TRUE)
}