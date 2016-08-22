library('itsmr')
data = read.csv("http://people.stern.nyu.edu/churvich/Forecasting/Data/HousingStarts.CSV",header = T)
ts = data[,2]
d  =diff(log(ts))