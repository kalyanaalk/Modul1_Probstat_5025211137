# Modul1_Probstat_5025211137

### IDENTITAS

Nama  : Kalyana Putri Al Kanza

NRP   : 5025211137

Kelas : A

## SOAL 1

fotoooooooooooooooooooooooooooooooooooooooooooooo

>Seorang penyurvei secara acak memilih orang-orang di jalan sampai dia bertemu dengan seseorang yang menghadiri acara vaksinasi sebelumnya. 

### 1-A

>Berapa peluang penyurvei bertemu x = 3 orang yang tidak menghadiri acara vaksinasi  sebelum keberhasilan pertama ketika p = 0,20 dari populasi menghadiri acara vaksinasi ? (distribusi Geometrik)

Penyelesaian dilakukan dengan menggunakan distribusi geometrik dengan bantuan fungsi dgeom(). Dari fungsi tersebut, didapatkan bahwa peluang penyurvei bertemu 3 orang yang tidak menghadiri acara vaksinasi  sebelum keberhasilan pertama ketika p = 0,20 dari populasi menghadiri acara vaksinasi adalah sebesar 0.1024.

```R
#1a
p = 0.20
x = 3
peluang <- dgeom(x, p)
peluang
```

### 1-B

>Mean Distribusi Geometrik dengan 10000 data random , prob = 0,20 dimana distribusi geometrik acak tersebut X = 3 ( distribusi geometrik acak () == 3 )

Penyelesaian dilakukan dengan menggunakan rumus mean dengan parameter berupa angka acak dari distribusi Geometri yang telah dilakukan dengan bantuan fungsi rgeom(). Fungsi rgeom() berisi banyaknya data acak peluang kehadiran dalam menghadiri acara vaksinasi. Dari rerata fungsi tersebut, didapatkan hasil yang berubah-ubah. Salah satu hasilnya adalah rerata sebesar 0.1069.

```R
#1b
mean = mean(rgeom(n = 10000, prob = p) == 3)
```

### 1-C

>Bandingkan Hasil poin a dan b , apa kesimpulan yang bisa didapatkan?

Poin A melakukan distribusi geometrik biasa, dan mendapatkan nilai sebesar 0.1024, yang merupakan nilai terbesar dari peluang kejadian yang dapat terjadi pada kejadian tersebut. Poin B mengambil rata-rata dari semua peluang kejadian yang dapat terjadi pada kejadian tersebut, dengan nilai sebesar 0.1069. Untuk kebutuhan sampling, lebih baik menggunakan poin B daripada poin A.

### 1-D

>Histogram Distribusi Geometrik , Peluang X = 3 gagal Sebelum Sukses Pertama

Histogram distribusi geometrik dibuat sebagai berikut.

```R
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
```

### 1-E

>Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Geometrik.

Rataan dan varian didapatkan dengan formula sebagai berikut.

```R
# 1e
rataan = 1 / p
rataan 

varian = (1 - p) / p^2
varian
```

## SOAL 2

fotooooooooooooooooooo

>Terdapat 20 pasien menderita Covid19 dengan peluang sembuh sebesar 0.2. Tentukan :

### 2-A

>Peluang terdapat 4 pasien yang sembuh.

Penyelesaian dilakukan dengan menggunakan distribusi binomial dengan bantuan fungsi dbinom(). Dari fungsi tersebut, didapatkan bahwa peluang terdapat 4 pasien yang sembuh adalah sebesar 0.218199401946101.

```R
p = 0.2
nS = 20

# 2a
nA = 4
peluang = dbinom(nA, nS, p)
peluang
```

### 2-B

>Gambarkan grafik histogram berdasarkan kasus tersebut.

Histogram digambar dengan bantuan fungsi hist() sebagai berikut.

```R
# 2b
x = rbinom(nA, nS, p)
hist(x, main = "Binomial Histogram", xlab = "Sembuh", ylab = "Frekuensi")
```

### 2-C

>Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Binomial.

Rataan didapatkan dengan mengalikan banyak data dengan peluang kejadian, sedangkan varian didapatkan dengan mengalikan rataan dengan komplemen peluang kejadian.

```R
# 2c
rataan = nS * p
rataan

varian = nS * p * (1 - p)
varian
```

## SOAL 3

fotooooooooooooooooooo

>Diketahui data dari  sebuah tempat bersalin di rumah sakit tertentu menunjukkan rata-rata historis 4,5 bayi lahir di rumah sakit ini setiap hari. (gunakan Distribusi Poisson)

### 3-A

>Berapa peluang bahwa 6 bayi akan lahir di rumah sakit ini besok?

Penyelesaian dilakukan dengan menggunakan distribusi Poisson dengan bantuan fungsi dpois(). Dari fungsi tersebut, didapatkan bahwa peluang terdapat 6 bayi akan lahir di rumah sakit ini besok adalah 0.128120143864584

```R
# 3a
lamda = 4.5
nA = 6
p = dpois(nA, lamda)
p
```

### 3-B

>Simulasikan dan buatlah histogram kelahiran 6 bayi akan lahir di rumah sakit ini  selama setahun (n = 365)

Histogram digambar dengan bantuan fungsi geom_histogram() sebagai berikut.

```R
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
```

### 3-C

>dan bandingkan hasil poin a dan b , Apa kesimpulan yang bisa didapatkan

Dari poin A, didapatkan nilai mendekati 13%, sedangkan dari poin B yang merupakan simulasi untuk melakukan pengerjaan hal tersebut, didapatkan hasil sekitar 12%. Hasil keduanya cukup mirip karena nilai A berada di dalam range B. Oleh karena itu, estimasi selama 365 hari akan memberikan hasil yang hampir sama dengan estimasi jumlah bayi yang akan dilahirkan besoknya.

### 3-D

>Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Poisson.

Nilai rataan dan varian sama dengan lamda.

```R
# 3d
rataan = varian = lamda
rataan
varian
```

## SOAL 4

fotooooooooooooooooooo

>Diketahui nilai x = 2 dan v = 10. Tentukan:

### 4-A

>Fungsi Probabilitas dari Distribusi Chi-Square.

Penyelesaian dilakukan dengan menggunakan distribusi Chi-Square dengan bantuan fungsi dchisq(). Dari fungsi tersebut, didapatkan bahwa probabilitasnya sebesar 0.00766415502440505.

```R
# 4a
p = dchisq(x, 10)
p
```

### 4-B

>Histogram dari Distribusi Chi-Square dengan 100 data random.

Histogram distribusi Chi-Square dengan 100 data random digambar dengan bantuan fungsi curve() sebagai berikut.

```R
# 4b
x <- rchisq(100, v)
hist(x, freq = FALSE, xlim = c(0,31), ylim = c(0,0.2), main = "Chisquare Distribution Histogram")

curve(dchisq(x, v), from = 0, to = 30, n = 100, col = "red", lwd = 2, add = TRUE)
```

### 4-C

>Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Chi-Square.

Rataan sama dengan v, sedangkan varian sama dengan v dikali dua.

```R
# 4c
rataan = v
rataan

varian = v * 2
varian
```

## SOAL 5

fotooooooooooooooooooo

>Diketahui bilangan acak (random variable) berdistribusi exponential (λ = 3). Tentukan

### 5-A

>Fungsi Probabilitas dari Distribusi Exponensial

Penyelesaian dilakukan dengan menggunakan distribusi eksponensial dengan bantuan fungsi dexp(). Dari fungsi tersebut, didapatkan bahwa probabilitasnya sebesar 0.0497870683678639.

```R
# 5a
p = dexp(lamda, rate = 1, log = FALSE)
p
```

### 5-B

>Histogram dari Distribusi Exponensial untuk 10, 100, 1000 dan 10000 bilangan random

Histogram distribusi eksponensial 10, 100, 1000, dan 10000 bilangan random digambar dengan bantuan fungsi hist() sebagai berikut, sedangkan fungsi par() digunakan untuk menampilkan 4 histogram bersamaan.

```R
# 5b
par(mfrow = c(2,2))
set.seed(1)
hist(rexp(10, lamda), main = "Distribusi Eksponensial 10 Bilangan Random")
hist(rexp(100,lamda), main = "Distribusi Eksponensial 100 Bilangan Random")
hist(rexp(1000, lamda), main = "Distribusi Eksponensial 1000 Bilangan Random")
hist(rexp(10000, lamda), main = "Distribusi Eksponensial 10000 Bilangan Random")
```

### 5-C

