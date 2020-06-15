f= read.table("household_power_consumption.txt", sep=";", stringsAsFactors = F,header = T)


p1=grep("^1/2/2007",f$Date)
p2=grep("^2/2/2007",f$Date)

f1=f[c(p1[1]:p1[length(p1)]), ]
f2=f[c(p2[1]:p2[length(p2)]), ]
f3= rbind(f1,f2)
f3[ ,3]=as.numeric(f3[ ,3])
f3[ ,4]=as.numeric(f3[ ,4])
f3[ ,5]=as.numeric(f3[ ,5])
f3[ ,7]=as.numeric(f3[ ,7])
f3[ ,8]=as.numeric(f3[ ,8])
f3[ ,9]=as.numeric(f3[ ,9])

library(hms)
library(lubridate)
library(dplyr)


f3[ ,1]=dmy(f3[ ,1])
f3[,2]=as_hms(f3[,2])
f3= mutate(f3, Datetime=paste(Date,Time))
f3[,10]=ymd_hms(f3[,10])


par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))

with(f3, {
  
  plot(f3[,10],f3[,3], type="l",ylab="Global Active Power", xlab = "")
  plot(f3[,10],f3[,5], type="l",ylab="Voltage", xlab = "datetime")
  plot(f3[,10],f3[,7], type="l",ylab="Energy sub metering", xlab = "")
  lines(f3[,10],f3[,8], col="red")
  lines(f3[,10],f3[,9], col="blue")
  legend("topright", lty=1,lwd=2, cex=.5, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  plot(f3[,10],f3[,4], type="l",ylab="Global_reactive_power", xlab = "datetime")
  
})




dev.copy(png, file="plot4.png",height=480,width=480, units="px")

dev.off()


