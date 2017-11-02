# Simulando los datos
id <- 1:n

# En t=0 (línea base)


## Variables observadas

sexo <- sample(c(0,1), replace=TRUE, size=n, prob=c(0.5,0.5)) # 1 es mujer, 0 es hombre

edad <- rnorm(n, mean=40, sd=5); a <- subset(edad, edad<18); edad <- edad [! edad %in% a]; a <- rep(18, NROW(a)); edad <- c(edad,a); edad <- sort(edad)

anioseduc <- jitter(sort(rbeta(n, 20, 5, ncp = 0)*15), amount=2)

empresario <- sample(c(0,1), replace=TRUE, size=n, prob=c(0.8,0.2))

cursofinanzas <- rep(0,n)

ocupado <- sample(c(1,0), replace=TRUE, size=n, prob=c(0.85,0.15))

salariounitario <- rep(200000,n) # Por unidad de año de educación

costoeduc <- rep(100000,n) # Costo del año de educación

# Variables omitidas

conexiones <- trunc(sort(rexp(n, rate=1/2)))

estadosalud <- jitter(1 - (edad / max(edad)), amount=0.15)

nivelingles <- sort(sample(c(0,1,2,3), replace=TRUE, size=n, prob=c(0.4,0.3, 0.2, 0.1))) # o es que no sabe nada, 3 es nivel nativo.

chocolatinasdia <- rpois(n, lambda=2)

ingresos <- sort(rlnorm(n, meanlog = 0, sdlog = 0.5)*1000000)

marginpropS <- ingresos*(1+(cursofinanzas/2))/(1.1*max(ingresos))

cedula <- seq(from=4306, to=4306+n-1, by=1); cedula <- sample(cedula)

# Variable explicada

# Variable efecto

ingresos <- sort(rlnorm(n, meanlog = 0, sdlog = 0.5)*1000000)
#sort(rexp(1000, rate=1/200)*20000)



#Función ingresos
ingresos <- ocupado*( # Si está empleado, tiene estos ingresos, si no, tiene cero por este componente.
  anioseduc*2*mean(salariounitario)*(conexiones+1)
  -(mean(salariounitario)*sexo/20) # Si es mujer, gana menos.
  +(nivelingles^3)*50000 # Si sabe inglés, gana un poquito más.
  +salariounitario*10*(estadosalud^2)) # Si está saludable, gana más.

+empresario*10*(mean(salariounitario)*(conexiones+1)) # Si es empresario, tiene estos ingresos. # Restando lo que la persona pagó para educarse.



T0 <- data.frame(id, ingresos, sexo, edad, anioseduc, empresario, cursofinanzas, ocupado, conexiones, estadosalud, nivelingles, chocolatinasdia, marginpropS, cedula, costoeduc, salariounitario)
