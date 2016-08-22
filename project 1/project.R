setwd("/Users/cryan/Desktop/Assignment/STAT-2302/project")
data = read.csv('npi.csv',fill = T)[2:5]
data = as.numeric(as.vector(t(as.matrix(data))))