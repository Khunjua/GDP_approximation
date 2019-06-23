library(ggplot2)

GDP_R7 <- read.csv("~/Documents/GE/2019/AirProhibition/Statistic/GDP_R7.csv", sep=";")


GDP_R7 <- mutate(GDP_R7, TouristGDP = Hotels+Restaurants+Travel ) #GDP from tourists (Hotels,Restaraunts,Travels)
GDP_R7 <- mutate(GDP_R7, TouristGDP_r = TouristGDP/GDP ) #Weight of the tourism in GDP
GDP_R7 <- mutate(GDP_R7, non_Russia = Total-Russia ) #Non-Russian Tourists
GDP_R7 <- mutate(GDP_R7, non_Russia_r = non_Russia/Total ) #Weight of the non-Russian tourists
GDP_R7 <- mutate(GDP_R7, Russia_r = Russia/Total ) #Weight of the Russian tourists
GDP_R7 <- mutate(GDP_R7, Russia_GDP_weight = Russia_r*TouristGDP_r*100 ) #Weight of the Russian tourists in the GDP %
GDP_R7 <- mutate(GDP_R7, Russia_GDP_weight_approx = Russia_r*TouristGDP_r*0.5 ) #Approximate embargo impact



ggplot(GDP_R7, aes(Year)) + geom_point(aes(y = Russia_GDP_weight, col = "Доля туристов из РФ в ВВП")) +  
  geom_point(aes(y = TouristGDP_r*100, col = "Доля всех туристов в ВВП")) + ylim(0,7.5)+ 
  theme_linedraw()+xlab("Год")+ylab("Туристические вклады в ВВП, %")+geom_line(aes(Year,Russia_GDP_weight,colour = "Доля туристов из РФ в ВВП"))+geom_line(aes(Year,TouristGDP_r*100,colour = "Доля всех туристов в ВВП"))+
  theme(legend.text = element_text(size=11),legend.title=element_blank(),legend.position = "bottom",legend.direction = "horizontal",axis.title.y=element_text(size=14, colour="black"), axis.title.x=element_text( size=14, colour="black"),  axis.text.x = element_text(family="Times", face="italic", colour="black", size=rel(1.5)) , axis.text.y = element_text(family="Times", face="italic", colour="black", size=rel(1.5)), plot.title = element_text(size=rel(2), lineheight=1, family="Times",  colour="black") )













