setwd("D://IRRI task//Vinay sir work")

# Generation sorting
# reading files
library(readxl)
library("openxlsx")
df = read_excel("Results sorted.xlsx")



for (x in unique(df$Generation)){
  x = as.character(x)
  dfgen = df[df$Generation== x,]
  directory = file.path(as.character(getwd()), x)
  
  if(file.exists(directory)){
    unlist(directory,recursive = TRUE)
  }
  
  dir.create(directory)
  
  write.xlsx(dfgen,file = paste(as.character(getwd()),"/",x,"/",x,".xlsx",sep = ""),colnames = TRUE)
  dfgenx = read_excel(paste(as.character(getwd()),"/",x,"/",x,".xlsx",sep = ""))
 
   
  for (a in unique(dfgenx$Traits)){
    dftrait = dfgenx[ dfgenx$Traits == a,]
    a = as.character(a)
    
    #write.xlsx(dftrait,file = paste(as.character(getwd()),"/",x,"/",a,".xlsx",sep = ""),
               #colnames =TRUE)
    
    cross<- createWorkbook()
    #dff = read_excel(paste(as.character(getwd()),"/",x,"/",a,".xlsx",sep = ""))
    
    for (k in unique(dftrait$Designation)){
      k = as.character(k)
      
      dfcross = dftrait[dftrait$Designation == k,]
     
      
      addWorksheet(cross,paste(as.character(k),"."))
      writeData(cross,paste(as.character(k),"."),dfcross)
      
      
    
   
      
    }
    saveWorkbook(cross, paste(as.character(getwd()),"/",x,"/",a,"sheets",".xlsx",sep = ""))
   
    
  }
}

# @author Sudipan Paul

