# Coverage Analysis ######################
fdiRisk<-read.csv("http://dl.dropboxusercontent.com/u/10692900/fdiRisk.csv")
# UNCTAD has less missing data for the time period (1989-2010)
# UNCTAD - 336 NAs
# World Bank - 1289 NAs
summary(fdiRisk$value) # UNCTAD's fdi variable
summary(fdiRisk$BN.KLT.DINV.CD) # WB's fdi variable
# There is some overlap. the World Bank data has information on 103 cases that UNCTAD is missing (most of them are for 2010, which UNCTAD misses by design)
with(fdiRisk, table(UNCTADmissing, WBmissing))

# In terms of violence, the missing cases are somewhat evenly distributed, though there are a few more missing FDI numbers when things are very violent
with(fdiRisk, table(UNCTADmissing, pv_sum_5))
with(fdiRisk, table(UNCTADmissing, pv_mean_5))

# It's kind of scattered for the World Bank as well
with(fdiRisk, table(WBmissing, pv_sum_5))
with(fdiRisk, table(WBmissing, pv_mean_5))

# Interpret these however you like. It seems that there is some relationships between the level of violence and missingness (depending on the choice of indicator)
summary(lm(UNCTADmissing~pv_sum_5, data=fdiRisk))
summary(lm(UNCTADmissing~pv_mean_5, data=fdiRisk))

summary(lm(WBmissing~pv_sum_5, data=fdiRisk))
summary(lm(WBmissing~pv_mean_5, data=fdiRisk))
