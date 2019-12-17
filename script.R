# Este es un ejemplo de "script" de R
# Las líneas que comienzan con el símbolo "#" son 
# comentarios que no se ejecutan. 
# Para ejecutar una instrucción de R se 
# presionan simultáneamente CRTL + ENTER (Windows)
# CMD + ENTER (Mac)
###
# Como ejemplo, generamos dos caminatas aleatorias independientes
# con 1000 observaciones cada una.
# Se define la semilla para poder reproducir los resultados
# en sesiones sucesivas.
# La función "sample()" toma un muestreo, con el valor de n dado, 
# de los valores -1 (paso a la izquierda), 1 (paso a la derecha).
# El parámetro lógico, "TRUE" permite un muestreo con remplazo. 
# La función "cumsum()" calcula la suma acumulada. 

set.seed(123)
n <- 1000
x <- cumsum(sample(c(-1,1), n, TRUE))
y <- cumsum(sample(c(-1,1), n, TRUE))

# Después, graficamos las dos caminatas aleatorias como series de tiempo

plot.ts(x, col = "red")
lines(y, col = "blue")
legend(1,-25, legend = c("x", "y"), col = c("red", "blue"), lty = 1)

# Probamos la hipótesis que las caminatas aleatorias tienen correlación cero,
# (H0), contra la alternativa de correlación diferente de cero:
# La función "cor.test()" calcula el valor de correlación muestral
# y prueba de hipótesis estadística correspondiente. 
cor.test(x,y)

# Definimos el objeto "m" como el resultado de la regresión lineal 
# de y sobre x:
m <- lm(y ~ x)

# La función "summary()" despliega el resultado de la regresión lineal:
summary(m)