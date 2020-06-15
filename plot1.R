f= read.table("household_power_consumption.txt", sep=";", stringsAsFactors = F,header = T)


p1=grep("^1/2/2007",f$Date)
p2=grep("^2/2/2007",f$Date)

f1=f[c(p1[1]:p1[length(p1)]), ]
f2=f[c(p2[1]:p2[length(p2)]), ]
f3= rbind(f1,f2)
f3[ ,3]=as.numeric(f3[ ,3])
hist(f3[ ,3],col="red",xlab="Global Active Power (kilowatts)", main="Global Active Power")

dev.copy(png, file="plot1.png",height=480,width=480, units="px")

dev.off()




