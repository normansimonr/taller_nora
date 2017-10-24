# Graficando la distribución de ingresos SIN INTERVENCIÓN

dT0 <- density(T0$ingresos)
dT1 <- density(T1$ingresos)
dT2 <- density(T2$ingresos)

plot(dT0, main="Ingresos sin intervención", xlab="Pesos per cápita", ylim=range(dT0$y, dT1$y, dT2$y), 
     xlim=range(dT0$x, dT1$x, dT2$x)/5, 
     lwd=3, col="black")
abline(v=mean(T0$ingresos), lwd=3, col="black")

lines(dT1, lwd=3, col="red")
abline(v=mean(T1$ingresos), lwd=3, col="red")
lines(dT2, lwd=3, col="blue")
abline(v=mean(T2$ingresos), lwd=3, col="blue")