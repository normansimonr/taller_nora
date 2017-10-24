# Distribución de muestreo

#Podemos crear la distribución de muestreo de la media para cada conjunto de datos:
  

m <- 300

mediasT0 <- matrix(data=NA, nrow=m , ncol=NCOL(T0))
colnames(mediasT0) <- colnames(T0)
for (j in 1:m) {
  
  muestraid <- sample(T0$id, size=n/10, replace=F)
  muestraT0 <- subset(T0, T0$id %in% muestraid)
  mediasT0[j,] <- data.frame(apply(muestraT0, 2, mean))[,1]
  rm(muestraid, muestraT0)
  
}
mediasT0 <- data.frame(mediasT0)

mediasT1 <- matrix(data=NA, nrow=m , ncol=NCOL(T1))
colnames(mediasT1) <- colnames(T1)
for (j in 1:m) {
  
  muestraid <- sample(T1$id, size=n/10, replace=F)
  muestraT1 <- subset(T1, T1$id %in% muestraid)
  mediasT1[j,] <- data.frame(apply(muestraT1, 2, mean))[,1]
  rm(muestraid, muestraT1)
  
}
mediasT1 <- data.frame(mediasT1)

mediasT2 <- matrix(data=NA, nrow=m , ncol=NCOL(T2))
colnames(mediasT2) <- colnames(T2)
for (j in 1:m) {
  
  muestraid <- sample(T2$id, size=n/10, replace=F)
  muestraT2 <- subset(T2, T2$id %in% muestraid)
  mediasT2[j,] <- data.frame(apply(muestraT2, 2, mean))[,1]
  rm(muestraid, muestraT2)
  
}
mediasT2 <- data.frame(mediasT2)


#Y graficar, por ejemplo, la distribución de muestreo de años de escolaridad en línea base (contra la media poblacional):
  

plot(density(mediasT0$anioseduc))
abline(v=mean(T0$anioseduc))
```

