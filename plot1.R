# use the setwd() function to go to the directory that contains the file household_power_consumption.txt 

A2=read.table("household_power_consumption.txt",sep=";",header=TRUE,colClasses=c("NULL","NULL",rep('numeric',7)),na.strings='?')
A1=read.table("household_power_consumption.txt",sep=";",header=TRUE,colClasses=c("factor","factor",rep('NULL',7)),na.strings='?')
#to verify that the dimension are the good ones
dim(A1)
dim(A2)

#to extract the data
a1=A1[,1]
w1=which(a1=='1/2/2007')
w2=which(a1=='2/2/2007')

B=A2[c(w1,w2),]
w=which(B[,3]=='?')
#no missing data as the answer is integer(0)

#to create the plot1
hist(as.numeric(B[,1]),col='red',main='Global Active Power', xlab='Global Active Power (kilowatts)')

dev.copy(png,file='plot1.png')
dev.off()