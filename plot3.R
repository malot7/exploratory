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

#to create the plot3
name=colnames(B)
b=format(as.Date(B1[,1],"%d/%m/%Y"), "%a")
b1=unique(b)
bb=B1[,2]
bb2=which(bb=='00:00:00')

y=c(as.numeric(B[,5]),as.numeric(B[,6]),as.numeric(B[,7]))
plot(as.numeric(B[,5]),ylim=c(min(0,y),max(y)),ylab='Energy sub metering',xlab='',main='',type='n',xaxt='n')
points(as.numeric(B[,5]),type='l')
points(as.numeric(B[,6]),type='l',col='red')
points(as.numeric(B[,7]),type='l',col='blue')
legend('topright',name[5:7],col=c('black','red','blue'),lty=c(1,1,1))
axis(1,c(bb2,length(bb)+1),c(b1,'Sat'))
dev.copy(png,file='plot3.png')
dev.off()