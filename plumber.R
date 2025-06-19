options(scipen = 999)

library(plumber)

#* @apiTitle API examen Nombre Apellido 
#* @apiDescription API que permite a los usuarios buscar áreas que cumplan cierto criterio de calidad del agua.

#* @param Calidad_de_agua
#* @get /water_q

water_q=function(Calidad_de_agua=100){
  Calidad_de_agua=as.numeric(Calidad_de_agua)
  df=read.csv("C:/DS RETO4/recu2/DF_DC_na.csv")
  a=df%>%filter(Value>=Calidad_de_agua)%>%dplyr::select(Area,Site)
  return(a)
}
  
  