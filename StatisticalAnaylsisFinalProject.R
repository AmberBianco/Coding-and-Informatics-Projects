#Author: Amber Bianco
#R Programming Final Project

library(MASS)
library(ggplot2)
library(corrplot)
library(car)
library(rgl)
library(pwr)
library(pscl)
library(stats)

setwd("/Users/amber/OneDrive/Documents/631")
file.exists("C:/Downloads/births.RData")
download.file(downloadURL, "temp.rData")
load(file="births.rDat")
summary(births)
births$dad_age[births$dad_age==999]<-NA
sum(is.na(births$dad_age))
births$mom_wt_gain[births$mom_wt_gain==999]<-NA
sum(is.na(births$mom_wt_gain))
births$len_preg[births$len_preg==999]<-NA
sum(is.na(births$len_preg))
births$num_visits[births$num_visits==999]<-NA
sum(is.na(births$num_visits))
births$is_premie[births$is_premie=="unknown"]<-NA
sum(is.na(births$is_premie))
births$marital[births$marital=="unknown"]<-NA
sum(is.na(births$marital))
births$smoke[births$smoke=="unknown"]<-NA
sum(is.na(births$smoke))
births$mom_white[births$mom_white=="unknown"]<-NA
sum(is.na(births$mom_white))


levels(births$mom_age_level)
lev <- c("teens","early20s", "late20s","early30s","35+")
births$mom_age_level <- factor(births$mom_age_level,ordered=T, levels=lev)
levels(births$mom_age_level)

levels(births$maturity)
lev1<-c("younger", "advnced")
births$maturity<- factor(births$maturity,ordered=T, levels=lev1)
levels(births$maturity)

levels(births$is_premie)
lev2<-c("premie", "fullterm")
births$is_premie<- factor(births$is_premie,ordered=T, levels=lev2)
levels(births$is_premie)
as.factor(lev2)



levels(births$marital)
lev3<-c("married","unmarried")
births$marital<- factor(births$marital,ordered=T, levels=lev3)
levels(births$marital)

levels(births$low_bwt)

levels(births$sex)

levels(births$smoke)

levels(births$mom_white)
lev4<-c("nonwhite","white")
births$mom_white<- factor(births$mom_white,ordered=T, levels=lev4)
levels(births$mom_white)


summary(births)
#FREQUENCY#

       
g <- na.omit(ggplot(data=births))
g + geom_histogram(aes(x=dad_age, fill=factor(low_bwt)), binwidth=10,position="dodge")

g + geom_histogram(aes(x=mom_age, fill=factor(low_bwt)), binwidth=10,position="dodge")

g + geom_histogram(aes(x=len_preg, fill=factor(low_bwt)), binwidth=10,position="dodge")

g + geom_histogram(aes(x=num_visits, fill=factor(low_bwt)), binwidth=10,position="dodge")

g + geom_histogram(aes(x=mom_wt_gain, fill=factor(low_bwt)), binwidth=10,position="dodge")

g + geom_histogram(aes(x=bwt, fill=factor(low_bwt)), binwidth=10,position="dodge")

ggplot(data=births, aes(x=maturity, y=low_bwt)) +
  geom_bar(stat="identity", color="coral2", fill="white")

ggplot(data=births, aes(x=!is.na(is_premie), y=low_bwt)) +
  geom_bar(stat="identity", fill="steelblue")

ggplot(data=births, aes(x=marital, y=low_bwt)) +
  geom_bar(stat="identity", fill="turquoise")


ggplot(data=births, aes(x=sex, y=low_bwt)) +
  geom_bar(stat="identity", fill="deeppink2")

ggplot(data=births, aes(x=smoke, y=low_bwt)) +
  geom_bar(stat="identity", fill="seagreen3")

ggplot(data=births, aes(x=mom_white, y=low_bwt)) +
  geom_bar(stat="identity", fill="sienna1")

ggplot(data=births, aes(x=low_bwt_level, y=mom_age)) +
  geom_bar(stat="identity", fill="pink3")

births2<-births

births2$maturity<-as.numeric(births2$maturity)
births2$is_premie<-as.numeric(births2$is_premie)
births2$marital<-as.numeric(births2$marital)
births2$low_bwt<-as.numeric(births2$low_bwt)
births2$sex<-as.numeric(births2$sex)
births2$smoke<-as.numeric(births2$smoke)
births2$mom_white<-as.numeric(births2$mom_white)
births2$mom_age_level<-as.numeric(births2$mom_age_level)


summary(births2)
sapply(births2,sd,na.rm=TRUE)#SD: Standard deviation
sapply(births2,var,na.rm=TRUE) #VAR: Variance
sapply(births2,quantile,na.rm=TRUE)# Quantiles
sapply(births2,IQR,na.rm=TRUE) #Inter quartile rage

###CORRELATION###


Cor1<-cor(births2, use="pairwise.complete.obs")
corrplot(Cor1,method="circle")


t.test(births$bwt~births$maturity)


t.test(births$bwt~births$is_premie, na.rm=T)


g + geom_histogram(aes(x=bwt, fill=is_premie), binwidth=10,position="dodge")



t.test(births$bwt~births$marital, na.rm=T)


g + geom_histogram(aes(x=bwt, fill=marital), binwidth=10,position="dodge")


marital_box<-ggplot(data=births,aes(x=marital, y=bwt))
marital_box+geom_boxplot(fill=heat.colors(3))+ggtitle("Birth Weight of Baby in Pounds vs Low Birth Weight")+
  xlab("Marital Status")+ylab("Birth Weight of Baby in Pounds")


t.test(births$bwt~births$low_bwt)


bwt_box<-ggplot(data=births,aes(x=factor(low_bwt), y=bwt))
bwt_box+geom_boxplot(fill=heat.colors(2))+ggtitle("Birth Weight of Baby in Pounds vs Low Birth Weight")+
  xlab("Low Birth Weight( 1: Low 2:Not Low)")+ylab("Birth Weight of Baby in Pounds")

t.test(births$bwt~births$maturity)

t.test(births$bwt~births$sex)
#

MF_box<-ggplot(data=births,aes(x=sex, y=bwt))
MF_box+geom_boxplot(fill=cm.colors(2))+ggtitle("Birth Weight of Baby in Pounds vs Sex of Baby")+
  xlab("Baby Female or Male")+ylab("Birth Weight of Baby in Pounds")

t.test(births$bwt~births$mom_white, na.rm=TRUE)
 

g + geom_histogram(aes(x=bwt, fill=mom_white), binwidth=10,position="dodge")

MW_box<-ggplot(data=births,aes(x=mom_white, y=bwt))
MW_box+geom_boxplot(fill=rainbow(3))+ggtitle("Birth Weight of Baby in Pounds vs Mother Classified as White")+
  xlab("Mother classified as white")+ylab("Birth Weight of Baby in Pounds")


###CHISQUAREDTEST###
chisq.test(births2$maturity,births2$low_bwt)

ggplot(data=births, aes(x=maturity, y=low_bwt)) +
  geom_bar(stat="identity", fill="seagreen3")

pwr.chisq.test(w =, N =1000 , df =999 , sig.level =0.05, power =0.8 )
            

chisq.test(births2$is_premie,births2$low_bwt)

ggplot(data=births, aes(x=is_premie, y=low_bwt)) +
  geom_bar(stat="identity", fill="darkmagenta")


chisq.test(births2$marital,births2$low_bwt)

ggplot(data=births, aes(x=marital, y=low_bwt)) +
  geom_bar(stat="identity", fill="cyan")

chisq.test(births2$sex,births2$low_bwt)

chisq.test(births2$smoke,births2$low_bwt)

ggplot(data=births, aes(x=smoke, y=low_bwt)) +
  geom_bar(stat="identity", fill="darkslategray")


chisq.test(births2$mom_white,births2$low_bwt)

ggplot(data=births, aes(x=mom_white, y=low_bwt)) +
  geom_bar(stat="identity", fill="darksalmon")


###POWER###
pwr.r.test()
pwr.r.test(n = 1000, r =NULL , sig.level =0.05 , power = 0.80)


pwr.t2n.test(n1=867, n2=133, d = .2, sig.level = .05)
t.test(births$bwt~births$maturity)


t.test(births$bwt~births$is_premie, na.rm=T)
pwr.t2n.test(n1=152, n2=846, d = .2, sig.level = .05)

t.test(births$bwt~births$marital, na.rm=T)
pwr.t2n.test(n1=613, n2=386, d = .2, sig.level = .05)


t.test(births$bwt~births$low_bwt)
pwr.t2n.test(n1=111, n2=889, d = .2, sig.level = .05)


t.test(births$bwt~births$sex)
pwr.t2n.test(n1=503, n2=497, d = .2, sig.level = .05)



t.test(births$bwt~births$mom_white,na.rm=T)
pwr.t2n.test(n1=284, n2=714, d = .2, sig.level = .05)

pwr.chisq.test()



###ANOVA###

summary(aov(births2$low_bwt~births2$mom_age_level))


ggplot(data=births, aes(x=factor(mom_age_level), y=low_bwt)) + geom_bar(stat="identity", fill="blue", width=0.8) +xlab("mom_age_level")
  + ylab("low_bwt")
+ scale_x_discrete(breaks=c("1", "2", "3", "4", "5"),
                         + labels=c("teens", "early20s", "late20s", "early30s", "35+"))


summary(aov(births2$smoke~births2$mom_age_level))

ggplot(data=births, aes(x=factor(mom_age_level), y=smoke)) + geom_bar(stat="identity", fill="cornflowerblue", width=0.8) +xlab("mom_age_level")
+ ylab("smoke")
+ scale_x_discrete(breaks=c("1", "2", "3", "4", "5"),
                   + labels=c("teens", "early20s", "late20s", "early30s", "35+"))

ggplot(data=births2, aes(x=smoke, y=low_bwt, group = Gender, fill = Gender)) + 
  geom_bar(stat = "identity", position = position_dodge(), width =  0.5)

summary(aov(births2$num_visits~births2$mom_age_level))

ggplot(data=births, aes(x=factor(mom_age_level), y=num_visits)) + geom_bar(stat="identity", fill="violetred2", width=0.8) +xlab("mom_age_level")
+ ylab("num_visits")
+ scale_x_discrete(breaks=c("1", "2", "3", "4", "5"),
                   + labels=c("teens", "early20s", "late20s", "early30s", "35+"))
summary(aov(births2$marital~births2$mom_age_level))

ggplot(data=births, aes(x=factor(mom_age_level), y=marital)) + geom_bar(stat="identity", fill="darkorchid", width=0.8) +xlab("mom_age_level")
+ ylab("marital status")
+ scale_x_discrete(breaks=c("1", "2", "3", "4", "5"),
                   + labels=c("teens", "early20s", "late20s", "early30s", "35+"))

summary(aov(births2$sex~births2$mom_age_level))

ggplot(data=births, aes(x=factor(mom_age_level), y=sex)) + geom_bar(stat="identity", fill="peachpuff2", width=0.8) +xlab("mom_age_level")
+ ylab("sex")
+ scale_x_discrete(breaks=c("1", "2", "3", "4", "5"),
                   + labels=c("teens", "early20s", "late20s", "early30s", "35+"))

summary(aov(births2$len_preg~births2$mom_age_level))

ggplot(data=births, aes(x=factor(mom_age_level), y=len_preg)) + geom_bar(stat="identity", fill="hotpink", width=0.8) +xlab("mom_age_level")+ ylab("length of pregnancy in weeks")
+ scale_x_discrete(breaks=c("1", "2", "3", "4", "5"),
                   + labels=c("teens", "early20s", "late20s", "early30s", "35+"))

kruskal.test(births2$mom_age_level~births2$low_bwt)



TukeyHSD(model_without_da.ma.mat.ip.nv.mar.mal)
modelT=lm( births2$smoke ~ births2$mom_age_level )
ANOVA=aov(modelT)


summary(aov(smoke~as.factor(mom_age_level), births2))
TUKEY<-TukeyHSD(aov(smoke~as.factor(mom_age_level), births2))
plot(TUKEY , las=1 , col="magenta")

summary(aov(num_visits~as.factor(mom_age_level), births2))
TUKEY2<-TukeyHSD(aov(num_visits~as.factor(mom_age_level), births2))
plot(TUKEY2 , las=1 , col="green")


summary(aov(marital~as.factor(mom_age_level), births2))
TUKEY3<-TukeyHSD(aov(marital~as.factor(mom_age_level), births2))
plot(TUKEY3 , las=1 , col="purple")


###LINEAR REGRESSION###
names(births2)
summary(births2)

model_all<-lm(bwt~dad_age+mom_age+maturity+len_preg+is_premie+num_visits+marital+mom_wt_gain+low_bwt+sex+smoke+mom_white+mom_age_level, data=births)
summary(model_all)

model_without_dad_age<-lm(bwt~mom_age+maturity+len_preg+is_premie+num_visits+marital+mom_wt_gain+low_bwt+sex+smoke+mom_white+mom_age_level, data=births)
summary(model_without_dad_age)

model_without_da.ma<-lm(bwt~maturity+len_preg+is_premie+num_visits+marital+mom_wt_gain+low_bwt+sex+smoke+mom_white+mom_age_level, data=births)
summary(model_without_da.ma)

model_without_da.ma.mat<-lm(bwt~len_preg+is_premie+num_visits+marital+mom_wt_gain+low_bwt+sex+smoke+mom_white+mom_age_level, data=births)
summary(model_without_da.ma.mat)

model_without_da.ma.mat.ip<-lm(bwt~len_preg+num_visits+marital+mom_wt_gain+low_bwt+sex+smoke+mom_white+mom_age_level, data=births)
summary(model_without_da.ma.mat.ip)

model_without_da.ma.mat.ip.nv<-lm(bwt~len_preg+marital+mom_wt_gain+low_bwt+sex+smoke+mom_white+mom_age_level, data=births)
summary(model_without_da.ma.mat.ip.nv)

model_without_da.ma.mat.ip.nv.mar<-lm(bwt~len_preg+mom_wt_gain+low_bwt+sex+smoke+mom_white+mom_age_level, data=births)
summary(model_without_da.ma.mat.ip.nv.mar)

model_without_da.ma.mat.ip.nv.mar.mal<-lm(bwt~len_preg+mom_wt_gain+low_bwt+sex+smoke+mom_white, data=births)
summary(model_without_da.ma.mat.ip.nv.mar.mal)



plot(model_without_da.ma.mat.ip.nv.mar.mal,1)






###LOGISTIC REGRESSION###
fit_all <- glm(low_bwt~., family=binomial(), data=births)
summary(fit_all)

pR2(fit_all)


exp(coef(fit_all))


alias(fit_all)
vif(fit_all)

fit_without_mal <- glm(low_bwt~dad_age+mom_age+maturity+len_preg+is_premie+num_visits+marital+mom_wt_gain+bwt+sex+smoke+mom_white, family=binomial(), data=births)
summary(fit_without_mal)
pR2(fit_without_mal)

fit_without_mal_da <- glm(low_bwt~mom_age+maturity+len_preg+is_premie+num_visits+marital+mom_wt_gain+bwt+sex+smoke+mom_white, family=binomial(), data=births)
summary(fit_without_mal_da)
pR2(fit_without_mal_da)

fit_without_mal_da_ma<- glm(low_bwt~maturity+len_preg+is_premie+num_visits+marital+mom_wt_gain+bwt+sex+smoke+mom_white, family=binomial(), data=births)
summary(fit_without_mal_da_ma)
pR2(fit_without_mal_da_ma)

fit_without_mal_da_ma_mat<- glm(low_bwt~len_preg+is_premie+num_visits+marital+mom_wt_gain+bwt+sex+smoke+mom_white, family=binomial(), data=births)
summary(fit_without_mal_da_ma_mat)
pR2(fit_without_mal_da_ma_mat)

fit_without_mal_da_ma_mat_ip<- glm(low_bwt~len_preg+num_visits+marital+mom_wt_gain+bwt+sex+smoke+mom_white, family=binomial(), data=births)
summary(fit_without_mal_da_ma_mat_ip)
pR2(fit_without_mal_da_ma_mat_ip)

fit_without_mal_da_ma_mat_ip_nv<- glm(low_bwt~len_preg+marital+mom_wt_gain+bwt+sex+smoke+mom_white, family=binomial(), data=births)
summary(fit_without_mal_da_ma_mat_ip_nv)
pR2(fit_without_mal_da_ma_mat_ip_nv)

fit_without_mal_da_ma_mat_ip_nv_mar<- glm(low_bwt~len_preg+mom_wt_gain+bwt+sex+smoke+mom_white, family=binomial(), data=births)
summary(fit_without_mal_da_ma_mat_ip_nv_mar)
pR2(fit_without_mal_da_ma_mat_ip_nv_mar)

fit_without_mal_da_ma_mat_ip_nv_mar<- glm(low_bwt~len_preg+mom_wt_gain+bwt+sex+smoke+mom_white, family=binomial(), data=births)
summary(fit_without_mal_da_ma_mat_ip_nv_mar)
pR2(fit_without_mal_da_ma_mat_ip_nv_mar)

exp(coef(fit_without_mal_da_ma_mat_ip_nv_mar))

vif(fit_without_mal_da_ma_mat_ip_nv_mar)

exp(cbind(OR=coef(fit_without_mal_da_ma_mat_ip_nv_mar), confint(fit_without_mal_da_ma_mat_ip_nv_mar)))

exp(coef(fit_without_mal_da_ma_mat_ip_nv_mar))
