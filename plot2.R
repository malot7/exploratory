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
B1=A1[c(w1,w2),]
w=which(B[,3]=='?')
#no missing data as the answer is integer(0)

#to create the plot2
b=format(as.Date(B1[,1],"%d/%m/%Y"), "%a")
b1=unique(b)
bb=B1[,2]
bb2=which(bb=='00:00:00')
plot(as.numeric(B[,1]),ylab='Global Active Power (kilowatts)',xlab='',main='',type='l',xaxt='n')
axis(1,c(bb2,length(bb)+1),c('Thu','Fri','Sat'))
dev.copy(png,file='plot2.png',width=480,height=480)
dev.off()