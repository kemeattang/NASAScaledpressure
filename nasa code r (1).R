library(bnlearn)                       # Load the package in R

library(forecast)


head(nasa)
summary(nasa)
relationships<- cor(nasa)
relationships
train =  nasa[1:1200,]

test = nasa[1201:1503,]

nasa$Frequency <- NULL

nasa$angle <- NULL

and = hc(train) 

plot(and)

fitted = bn.fit(and, train) 

pred = predict(fitted, "scaled.output.pressure", test)

cbind(pred, test[, "scaled.output.pressure"])

accuracy(f = pred, x = test[, "scaled.output.pressure"])
