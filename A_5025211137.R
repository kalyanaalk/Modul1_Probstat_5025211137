# ------------ NO 1 ---------------

library(dplyr)
library(ggplot2)

# 1a
p = 0.20
x = 3
peluang <- dgeom(x, p)
peluang

# 1b
mean = mean(rgeom(n = 10000, prob = p) == 3)

# 1c

# 1d
x = 0:10
data.frame(x, prob = dgeom(x, p)) %>%
  mutate(Failures = ifelse(x == 3, 3, "other")) %>%
  ggplot(aes(x = factor(x), y = prob, fill = Failures)) +
  geom_col() + 
  geom_text(
    aes(label = round(prob, 2), y = prob + 0.01),
    position = position_dodge(0.9),
    size = 3,
    vjust = 0
  )
labs(title = "Peluang X = 3 gagal Sebelum Sukses Pertama",
     y = "Probability")

# 1e
rataan = 1 / p
rataan 

varian = (1 - p) / p^2
varian

# ------------ NO 2 ---------------

p = 0.2
nS = 20

# 2a
nA = 4
peluang = dbinom(nA, nS, p)
peluang

# 2b
x = rbinom(nA, nS, p)
hist(x, main = "Binomial Histogram", xlab = "Sembuh", ylab = "Frekuensi")

# 2c
rataan = nS * p
rataan

varian = nS * p * (1 - p)
varian

# ------------ NO 3 ---------------

# 3a
lamda = 4.5
nA = 6
p = dpois(nA, lamda)
p

# 3b
set.seed(2)

poisson_data  <- data.frame('data' = rpois(365, lamda))

poisson_data  %>% ggplot() +
  geom_histogram(aes(x = data,
                     y = stat(count / sum(count)),
                     fill = data == nA),
                 binwidth = 1,
                 color = 'black',) +
  scale_x_continuous(breaks = 0:10) + 
  labs(x = 'Born per period',
       y = 'Proportion',
       title = 'Poisson Distribution Histogram') +
  theme_bw()

# 3c

# 3d
rataan = varian = lamda
rataan
varian

# ------------ NO 4 ---------------

x = 2
v = 10

# 4a
p = dchisq(x, 10)
p

# 4b
x <- rchisq(100, v)
hist(x, freq = FALSE, xlim = c(0,31), ylim = c(0,0.2), main = "Chisquare Distribution Histogram")

curve(dchisq(x, v), from = 0, to = 30, n = 100, col = "red", lwd = 2, add = TRUE)

# 4c
rataan = v
rataan

varian = v * 2
varian

# ------------ NO 5 ---------------

lamda = 3

# 5a
p = dexp(lamda, rate = 1, log = FALSE)
p

# 5b
par(mfrow = c(2,2))
set.seed(1)
hist(rexp(10, lamda), main = "Distribusi Eksponensial 10 Bilangan Random")
hist(rexp(100,lamda), main = "Distribusi Eksponensial 100 Bilangan Random")
hist(rexp(1000, lamda), main = "Distribusi Eksponensial 1000 Bilangan Random")
hist(rexp(10000, lamda), main = "Distribusi Eksponensial 10000 Bilangan Random")

# 5c
n = 100
simnum <- 100
simdata <- matrix(rexp(simnum * n, lamda), simnum)
sim_rowmean <- apply(simdata, 1, mean)
sim_var <- var(sim_rowmean)

# ------------ NO 6 ---------------

n = 100
m = 50
std = 8

# 6a
set.seed(100)
random <- rnorm(100)
rerata <- mean(random)
x1 <- floor(rerata)
x2 <- ceiling(rerata)

z1 <- (x1 - m) / std
z2 <- (x2 - m) / std

rnorm(n = 100, mean = m, sd = std)
plot(rnorm(n = 100, mean = m, sd = std))

# 6.B
hist(rnorm(n = 100, mean = m, sd = std), xlab="x", ylab="y", breaks = 50,
     main = "5025211137_Kalyana_Probstat_A_DNhistogram")

# 6.C
varian <- std ** 2