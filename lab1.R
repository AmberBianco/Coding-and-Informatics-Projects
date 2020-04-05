# This script converts a CSV file with headers to XML or JSON, depending on
# the command line argument supplied.
#
# This script will be executed by calling:
#
#    ```
#    Rscript src/lab1.R xml/json <filename>
#    ```
#
# Output of XML and JSON should be printed to stdout.


require(jsonlite)
require(XML)




###################################
# Create your other functions here.
###################################
#CSV TO JSON
parse_csv <- function(filename) {
  csv_input<- read.csv(filename, header=T)
  # Parse a CSV file by separating it into headers and additional data.
  #
  # Args
  # filename: A path to a CSV file.
  #     
  # Returns
  # An R structure containing the headers from the csv file and the data.
}



df_to_XML<-function(df){
  root_fxn<- xmlOutputDOM(tag = "Record")
  for (i in 1:nrow(df)){  
    root_fxn$addTag("Patient", close=F)
    for (j in names(df)){ 
      root_fxn$addTag(j,df[i,j]) 
    }
    root_fxn$closeTag()
  }
  root_fxn$closeTag()
 print(root_fxn$value())
}

df_to_JSON<-function(df){
  df_2<-df
  df_2$Patients<-data.frame(df_2)
  df_2<-list("Records"=df_2["Patients"])
  CSV_JSON<-toJSON(df_2, pretty=T)
  return(CSV_JSON)
}


Main_fxn<-function(){
  
  extract_arg<-commandArgs(trailingOnly = T) 
  file_name<-extract_arg[2]  
  option<-extract_arg[1]
  df_output<-parse_csv(file_name)
  
  if(option=="xml"){
    df_to_XML(df_output)
  }
  else{
    df_to_JSON(df_output)
  }
  
}
Main_fxn()

#Reference: https://cran.r-project.org/web/packages/jsonlite/jsonlite.pdf