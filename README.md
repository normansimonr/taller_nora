Taller
================
Norman Simón Rodríguez
23 de octubre de 2017

Preliminares
------------

Vamos a cargar nuestros datos (son datos creados a través de una simulación). Debemos definir el tamaño de la muestra:

``` r
n <- 10000
source("creador_datos.R")
```

Y ahora vamos a crear una función para hacer que pase el tiempo sobre los datos (un año a la vez). La función se llamar `pasartiempo()`:

``` r
source("pasartiempo_def.R")
```

Pasamos unos años:

``` r
T1 <- pasartiempo(T0)
T2 <- pasartiempo(T1)
```

Notemos que hasta este momento no hemos implementado ninguna intervención (curso de finanzas). Miremos la distribución de ingresos en cada tiempo.

``` r
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
```

La notación es la siguiente:
$$
Y=ingreso\\\\
X\_1=ocupado\\\\
X\_2=anioseduc\\\\
X\_3=salariounitario \\, (promedio\\, del\\, mercado)\\\\
X\_4=conexiones\\\\
X\_5=sexo\\\\
X\_6=nivelingles
X\_7=estadosalud\\\\
X\_8=empresario\\\\
X\_9=marginpropS\\\\
X\_{10}=costoeduc \\, (promedio\\, del\\, mercado)\\\\
X\_{11}=cursofinanzas
$$

La función ingreso es la siguiente (para *t* &gt; 0): $$ Y\_t=X\_1 \[ aX\_2 X\_3 (X\_4+b) - cX\_3X\_5 + dX\_6^3 + Y\_{t-1}X\_7^2\] + eX\_8 (X\_4+b) + Y\_{t-1}X\_{9, t-1} - X\_{10} X\_2 \\

X\_9= $$
