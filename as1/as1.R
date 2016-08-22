setwd("~/Desktop/Assignment/STAT-2302")
data = read.csv("http://people.stern.nyu.edu/churvich/Forecasting/Data/GDP.CSV")
attach(data)
library("itsmr")
#a)

ts.plot(GDP,ylab = "GDP")
t = seq(1:length(GDP))
m1 = lm(GDP~t)
abline(coef = m1$coef,col = "red" )

#b)
ts.plot(log(GDP),ylab = "Log GDP",ylim = c(7.5,10.5))
m2 = lm(log(GDP)~t)
abline(coef = m2$coef,col  ="red")


#c) 
summary(m2)
pred = predict(m2,interval = "confidence")
points(t,pred[,2],type = "l",col = 'black',lty = 3)
points(t,pred[,3],type = "l",col = 'black',lty = 3)

new = data.frame(t = 275)
new.value = predict(m2,new,interval = "predict")
new.int = cbind(rep(as.numeric(new),3),as.numeric(new.value))

points(new.int[,1],new.int[,2],type = "b",col = "black",lty = 3,cex = 0.5,pch = 4)

#d)e)
plot(m2,1)

#2)
euro = read.csv("http://people.stern.nyu.edu/churvich/Forecasting/Data/EURO.CSV")
attach(euro)
ts.plot(EURO)
ts.plot(log(EURO))
#
t3 = c(1:700)
m3 = lm(EURO[1:700]~t3)

t4 = c(701:4158)
m4 = lm(EURO[701:4158]~ t4)

t5 = c(1:(4158-701+1))
m5 = lm(EURO[701:4158]~t5)
abline(m5)

pred_3 = data.frame(t3 = 4159)
p_3 = predict(m3,pred_3,interval = "prediction")

pred_4 = data.frame(t4 = 4159)
p_4 = predict(m4,pred_4,interval = "prediction")

pred_5 = data.frame(t5 = 4158-701+2)
p_5 = predict(m5,pred_5,interval = "prediction")

ts.plot(EURO,ylim = c(-0.7,1.6))
abline(m3,col = 'red')
abline(m4,col = 'red')
points(rep(as.numeric(data.frame(t = 4159)),3),p_3,type = 'b',col = 'red',lty = 3,cex = 0.5,pch = 4)
points(rep(as.numeric(data.frame(t = 4159)),3),p_4,type = 'b',col = 'red',lty = 3,cex = 0.5,pch = 4)
points(rep(as.numeric(data.frame(t = 4158-701+2)),3),p_5,type = 'b',col = 'red',lty = 3,cex = 0.5,pch = 4)

points(4159,EURO[4159],type = 'b',col = 'black',lty = 3)

