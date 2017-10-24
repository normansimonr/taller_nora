pasartiempo <- function(A) {
  
  B <- A
  
  B$edad <- A$edad + 1
  costoeduc <- mean(A$costoeduc)
  

  for (i in NROW(B)) {
    
    if (A$ingresos[i]*A$marginpropS[i] > costoeduc){B$anioseduc[i] <- A$anioseduc[i]+1} else {B$anioseduc[i] <- A$anioseduc[i]}
    
  }
  

  B$ocupado <- sample(c(1,0), replace=TRUE, size=NROW(B), prob=c(0.85,0.15))
  B$estadosalud <- jitter(1 - (B$edad / max(B$edad)), amount=0.15)
 
  #Función propensión marginal a ahorrar
  B$marginpropS <- B$ingresos*(1+(B$cursofinanzas/2))/(1.1*max(B$ingresos))
  
  #Función ingresos
  B$ingresos <- B$ocupado*( # Si está empleado, tiene estos ingresos, si no, tiene cero por este componente.
                  B$anioseduc*2*mean(B$salariounitario)*(B$conexiones+1)
                  -(mean(B$salariounitario)*B$sexo/20) # Si es mujer, gana menos.
                  +(B$nivelingles^3)*50000 # Si sabe inglés, gana un poquito más.
                  +B$ingresos*(B$estadosalud^2)) # Si está saludable, gana más.
  
                +B$empresario*10*(mean(B$salariounitario)*(B$conexiones+1)) # Si es empresario, tiene estos ingresos.
                + A$ingresos*A$marginpropS # Sumando los ahorros del año anterior.
                - ((B$anioseduc - A$anioseduc)*costoeduc) # Restando lo que la persona pagó para educarse.
  

  #Función propensión marginal a ahorrar (recalculando)
  B$marginpropS <- B$ingresos*(1+(B$cursofinanzas/2))/(1.1*max(B$ingresos))
  
  return(B)  
  
}
