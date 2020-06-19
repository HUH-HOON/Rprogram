anscombe$x1
mean(anscombe$x1)
mean(anscombe$x2)
lm(y1-x1, data=anscombe)
lm(y2-x2, data=anscombe)

par(mfrow=c(1,2))
plot(anscombe$x1, anscombe$y2, col='red', pch=20)
plot(anscombe$x2, anscombe$y2)


x <- 1:12
y <- runif(n=12, min=70, max=80)
plot(x, log(y), ylim =c(0,100), type='l')
plot(x[1:4], y[1:4], ylim =c(65,85), type='l')

