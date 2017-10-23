pasartiempo <- function(A) {
  
  B <- A
  
  B$edad <- A$edad + 1
  costoeduc <- mean(A$costoeduc)
  
  # Restando lo que la persona pagó para educarse
  for (i in NROW(B)) {
    
    if (A$ingresos[i]*A$marginpropS[i] > costoeduc){B$anioseduc[i] <- A$anioseduc[i]+1} else {B$anioseduc[i] <- A$anioseduc[i]}
    
  }
  

  B$ocupado <- sample(c(0,1), replace=TRUE, size=n, prob=c(0.85,0.15))
  B$estadosalud <- jitter(1 - (B$edad / max(B$edad)), amount=0.1)
 
  #Función ingresos
  B$ingresos <- B$ocupado*(B$anioseduc*mean(B$salariounitario)*(B$conexiones+1)-(mean(B$salariounitario)*B$sexo/3)+B$nivelingles^3+B$ingresos*0.5*(B$estadosalud^2)) + B$empresario*(mean(B$salariounitario)*(B$conexiones+1)) + A$ingresos*A$marginpropS
  B$ingresos <- B$ingresos - ((B$anioseduc - A$anioseduc)*costoeduc)
 
  #Función propensión marginal a ahorrar
  B$marginpropS <- B$ingresos/(10*max(B$ingresos))+B$cursofinanzas/runif(1, min=10, max=20)
  
  return(B)  
  
}
