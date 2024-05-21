PETDF <-
  read.csv2("PE TDF.csv")

p1<-PETDF %>% 
  select(-Provincia) %>% 
  mutate(Varones=100*Varones, Mujeres=100*Mujeres,
         Grupos.de.edad=factor(PETDF$Grupos.de.edad,
                               levels = PETDF$Grupos.de.edad)) %>% 
  ggplot()+geom_col(aes(Grupos.de.edad, Mujeres),
                    fill="green")+
  geom_col(aes(Grupos.de.edad, Varones), fill="orange")+
  coord_flip()+
  scale_y_continuous(
    breaks=seq(-5.0,5.0,.5),
    labels=abs(seq(-5.0,5.0,.5)))+
  ylab("Porcentaje de población")+xlab("Grupo de edades")+
  theme_tufte()+labs(title="Población de la Provincia de Tierra del Fuego",
                     subtitle = "Censo 2010", caption="INDEC (2024)")


p1
