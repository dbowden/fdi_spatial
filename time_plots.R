##### Here are several plots to serve as a first cut at the data #####
#install.packages("ggplot2")
require(ggplot2)

####first the distributions of our primary variables of interest

#FDI
qplot(fdiRisk$value,main="Histogram of Raw FDI",xlab="FDI (million USD)",ylab="Count")

qplot(fdiRisk$value/fdiRisk$NY.GDP.MKTP.KD,main="Histogram of FDI Normalized by GDP",xlab="FDI (million USD)/GDP",ylab="Count")

qplot(log(fdiRisk$value),main="Histogram of Logged FDI",xlab="Log(FDI) (million USD)",ylab="Count")
qplot(log(fdiRisk$value)/fdiRisk$NY.GDP.MKTP.KD,main="Histogram of Logged FDI Normalized by GDP",xlab="Log(FDI) (million USD)/GDP",ylab="Count")

qplot(log(fdiRisk$value)/fdiRisk$NY.GDP.MKTP.KD,main="Histogram of Logged FDI Normalized by Logged GDP",xlab="Log(FDI) (million USD)/Log(GDP)",ylab="Count")

#pv sum
qplot(fdiRisk$pv_sum,main="Histogram of Total Intensity of Violence (pv_sum)",xlab="Violence Level",ylab="Count")

qplot(fdiRisk$pv_sum_5,main="Histogram of Total Intensity of Violence (pv_sum_5)",xlab="Violence Level",ylab="Count")

#pv mean
qplot(fdiRisk$pv_mean,main="Histogram of Total Intensity of Violence (pv_mean)",xlab="Violence Level",ylab="Count")

qplot(fdiRisk$pv_mean_5,main="Histogram of Mean Intensity of Violence (pv_mean_5)",xlab="Violence Level",ylab="Count")

### Now some bivariate relationships

#pv sum
ggplot(fdiRisk, aes(pv_sum,value)) + ggtitle("Raw FDI vs. Total Violence Intensity (pv_sum)") + xlab("Violence Intensity") + ylab("FDI (million USD)") + geom_point() + stat_smooth(method="loess")

ggplot(fdiRisk, aes(pv_sum,log(value))) + ggtitle("Logged FDI vs. Total Violence Intensity (pv_sum)") + xlab("Violence Intensity") + ylab("Log(FDI) (million USD)") + geom_point() + stat_smooth(method="loess")

qplot(fdiRisk$pv_sum_5,fdiRisk$value,geom="boxplot",main="Raw FDI vs. Total Violence Intensity (pv_sum_5)",xlab=("Violence Intensity"),ylab="FDI (million USD)")

qplot(fdiRisk$pv_sum_5,log(fdiRisk$value),geom="boxplot",main="Logged FDI vs. Total Violence Intensity (pv_sum_5)",xlab=("Violence Intensity"),ylab="Log(FDI) (million USD)")

#pvmean
ggplot(fdiRisk, aes(pv_mean,value)) + ggtitle("Raw FDI vs. Mean Violence Intensity (pv_mean)") + xlab("Violence Intensity") + ylab("FDI (million USD)") + geom_point() + stat_smooth(method="loess")

ggplot(fdiRisk, aes(pv_mean,log(value))) + ggtitle("Logged FDI vs. Mean Violence Intensity (pv_sum)") + xlab("Violence Intensity") + ylab("Log(FDI) (million USD)") + geom_point() + stat_smooth(method="loess")

qplot(fdiRisk$pv_mean_5,fdiRisk$value,geom="boxplot",main="Raw FDI vs. Mean Violence Intensity (pv_mean_5)",xlab=("Violence Intensity"),ylab="FDI (million USD)")

qplot(fdiRisk$pv_mean_5,log(fdiRisk$value),geom="boxplot",main="Logged FDI vs. Mean Violence Intensity (pv_mean_5)",xlab=("Violence Intensity"),ylab="Log(FDI) (million USD)")

###