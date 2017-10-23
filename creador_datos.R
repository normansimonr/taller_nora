# Simulando los datos
id <- 1:n

# En t=0 (línea base)

# Variable efecto

ingresos <- sort(rexp(1000, rate=1/200)*2000)


## Variables observadas

sexo <- sample(c(0,1), replace=TRUE, size=n, prob=c(0.5,0.5)) # 1 es mujer, 0 es hombre

edad <- rnorm(n, mean=40, sd=5); a <- subset(edad, edad<18); edad <- edad [! edad %in% a]; a <- rep(18, NROW(a)); edad <- c(edad,a); edad <- sort(edad)

anioseduc <- jitter(sort(rbeta(n, 20, 5, ncp = 0)*15), amount=2)

empresario <- sample(c(0,1), replace=TRUE, size=n, prob=c(0.8,0.2))

cursofinanzas <- rep(0,n)

ocupado <- sample(c(0,1), replace=TRUE, size=n, prob=c(0.85,0.15))

salariounitario <- rep(200000,n) # Por unidad de año de educación

costoeduc <- rep(1000000,n) # Costo del año de educación

# Variables omitidas

conexiones <- trunc(sort(rlnorm(n, meanlog = 0, sdlog = 2)))

estadosalud <- jitter(1 - (edad / max(edad)), amount=0.1)

nivelingles <- sort(sample(c(0,1,2,3), replace=TRUE, size=n, prob=c(0.4,0.3, 0.2, 0.1))) # o es que no sabe nada, 3 es nivel nativo.

chocolatinasdia <- rpois(n, lambda=2)

marginpropS <- ingresos/(10*max(ingresos))+cursofinanzas/runif(1, min=10, max=20)

cedula <- seq(from=4306, to=4306+n-1, by=1)

T0 <- data.frame(id, ingresos, sexo, edad, anioseduc, empresario, cursofinanzas, ocupado, conexiones, estadosalud, nivelingles, chocolatinasdia, marginpropS, cedula, costoeduc, salariounitario)
