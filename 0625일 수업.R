## p.38 시작
my_max <- function(x, y) {
  return(ifelse(x > y, x, y))
}
my_max(10, 15)
my_max(-1, -10)
# R에서 함수 만들기
# 함수명 <- fuction(i, z, ...){}
# 결과값 return 하는 것 잊지말기.
# 함수의 인자에 초기값 설정 가능 ex) function(x, y = 2)
### y 값을 기입하지 않으면 초기값으로 함수 실행.

my_func <- function(x, y) {
  my_sum <- x + y
  my_mul <- x * y
  return(list(sum = my_sum, mul = my_mul))
}

result <- my_func(4, 5)
# > result
# $sum
# [1] 9
#
# $mul
# [1] 20
result$sum
# [1] 9
result$mul
# [1] 20
# return해야 할 값이 여러 가지 일때는 list를 이용한다.

# which >> 위치값을 조회할 때 사용한다.
x <- c(4, 5, 2, 9, 1)
which(x > 5)
# [1] 4
which.max(x)
# [1] 4
which.min(x)
# [1] 5
order(x)    # order >> 작은 값의 위치 값 부터 순서대로 출력해준다.

################################################################ 첫 시간 끝

favorite <- c(
  "WINTER", "SUMMER", "SPRING", "SUMMER", "SUMMER",
  "FALL", "FALL", "SUMMER", "SPRING","SPRING"
)
print(favorite)
dat <- table(favorite)
# favorite
#  FALL SPRING SUMMER WINTER
#     2      3      4      1
barplot(dat, main = "Favorite Seasons")
pie(dat, main = "Favorite Seasons")
# 초기 favorite는 문자열 이였으나 그래프로 표현하기 위해서는 범주형 변수로 변경 해야 한다.
# 이를 통해 barplot, pie 차트 만들 수 있다.

par(mfrow = c(1,2))     # 차트를 보여주는 화면을 2분할 해준다. (사용하고 난 후 1,1로 원상복구 시켜놔야 함.)
barplot(dat, main = "Favorite Seasons")
pie(dat, main = "Favorite Seasons")

score <- c(60, 62, 64, 65, 68, 69, 120)
mean(score, trim = 0.2)     # 절사 평균 / trim 파라미터를 통해 몇 %를 제외 할 것인지 지정.
quantile(score)     # quantile : 사분위수 (Boxplot의 4분위수)
quantile(score, (0:10) / 10)       # 기존 알고있는 Boxplot이 아닌 비율 및 숫자를 지정하여 확인
summary(score)      # 최소, 1Q, 중앙값, 평균, 3Q, 최대값 확인 가능

range(score)       # 최소 최대 확인 가능
diff(range(score))      # 최소와 최대의 차이  
var(score)      # 분산
sd(score)       # 표준편차
IQR(score)      # boxplot IQR 값

head(cars)
hist(cars$speed, breaks = 10)       # 히스토그램의 막대 개수 지정 > breaks 파라미터 사용.
boxplot(cars$dist)
boxplot(iris$Petal.Length ~ iris$Species, notch = T)    # "~"을 이용하여 Y축, X축 변수 선택가능 / notch > 신뢰구간 확인 가능.

head(mtcars)
plot(mtcars$mpg, mtcars$wt, bg = 'blue', col = 'red', pch = 20)     # plot > 산점도 그려주는 함수명 / plot(x에 들어갈 변수, y에 들어갈 변수)
# col 파라미터 : 색상

##################################################################### 두번째 시간 끝

df <- iris[-5]
head(df)
pairs(df, main = "iris 4")      # pairs > 변수가 많을 경우 한번에 산점도를 표현할 때 사용한다.

df <- iris[, 3:4]
head(df)
plot(df, col = as.numeric(iris$Species), pch = 19)      # 산점도의 분류 현황을 확인 할 수 있다.
# 산점도의 해석을 통해 향후 모델 및 분석 방법 설정하는 것이 더 중요하다.

beers <- c(5, 2, 9 ,8, 3, 7, 3, 5, 3, 5)
bal <- c(0.1, 0.03, 0.19, 0.12, 0.04, 0.095, 0.07, 0.06, 0.02, 0.05)
df <- data.frame(beers, bal)        # DF 생성
plot(bal ~ beers, data = df)        # 산점도 확인
model <- lm(bal ~ beers, data = df) # 회귀모형 모델링 진행
abline(model, col = "red")          # 산점도에 모델링을 통해 나온 회귀선 표시
cor(beers, bal)
# [1] 0.8882323 >> 상관 계수 확인
summary(model)
# Call:
# lm(formula = bal ~ beers, data = df)
#
# Residuals:
#    Min      1Q  Median      3Q     Max
# -0.0275 -0.0187 -0.0071  0.0194  0.0357
#
# Coefficients:
#             Estimate Std. Error t value Pr(>|t|)
# (Intercept) -0.018500   0.019230  -0.962 0.364200
# beers        0.019200   0.003511   5.469 0.000595 ***
# ---
# Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

# Residual standard error: 0.02483 on 8 degrees of freedom
# Multiple R-squared:  0.789,     Adjusted R-squared:  0.7626
# F-statistic: 29.91 on 1 and 8 DF,  p-value: 0.0005953

## 모델의 회귀식은 bals = 0.0192beers - 0.0185이고 abline으로 표기 되었다.
## p value의 경우 0.000595로 유의 확률 0.05 이하이며 상관 계수는 0.76으로 두 변수는 상관이 있다고 판단된다.
## 해당 모델은 76%의 설명도를 보여주고 있다.
text(4, 0.15, "P Value : 0.000593")
text(4, 0.130, "R-squared : 0.76")

month <- 1:12
late <- c(5, 8, 7, 9, 4, 6, 12, 13, 8, 6, 6, 4)
plot(month, late, type = "l", lty = "solid", lwd = 1)

################################################################### 3번째 시간 끄읕 ㅋㄷ

library(mlbench)
names(BostonHousing)
df <- BostonHousing[, c("crim", "rm", "dis", "tax", "medv")]
df$grp <- ifelse(df$medv >= 25.0, "H", ifelse(df$medv <= 15.0, "L", "M"))
# DataFrame 그룹핑 및 변수 추가
# crim : 1인당 범죄율, rm : 1가구당 방의 개수, dis : 보스턴 5개 직업 센터까지의 거리, tax : 재산 세율, medv : 주택 가격
???
par(mfrow = c(2,3))
for (i in 1:5) {
  hist(df[, i], main = colnames(df)[i], col = "blue")
}
# 2,3의 그래프 출력 상태 만들고 for문을 통한 각 연속변수 히스토그램 확인
# 각각 변수가 어떠한 형태의 값을 가지고 있는지 대략적 확인 가능 
# (rm > 정규분포, dis > x++ 할 때 값이 작아짐, medv > 특정 이상값 제외시 정규분포의 형태를 띔)
# (대략 추측하건데 히스토그램을 통해 데이터의 신빙성을 유추해 낼 수 있을 듯 - 사실관계는 확인 필요.)

par(mfrow = c(2,3))
for (i in 1:5) {
  boxplot(df[, i], main = colnames(df)[i])
}
# 각 변수의 상태를 확인하기 위해 boxplot으로 표현
# crim : 이상값이 너무 많고 median이 낮은 위치에 작은 범위로 신뢰 데이터 확인됨.
# 나의 판단으로 데이터의 신빙성을 가질 수 있는 변수로는 rm, tax, medv 라고 판단됨.
# 그 이유는 이상값을 제외하였을 때 상자의 위치가 대부분 중앙에 위치해 있으므로 데이터가 한쪽을 편향된 경향을 보이지 않다는 근거 하에 선정.

par(mfrow = c(1, 1))
df$grp <- factor(df$grp)
boxplot(dis ~ grp, data = df)
# grp 변수는 medv(가격) 을 기준으로 하여 H, L, M을 나눈 변수.
# 이 grp 변수를 dis변수와 비교 하였을 때 알 수 있는 것.
### 전체적인 박스의 위치를 확인하였을 때 보스턴 5개 직업 센터와의 거리가 멀지 않다.
### H, L, M의 min/max를 보았을 때 보스턴 집의 가격은 높은 편에 속한다.
### 직업 센터와의 거리가 가까운 집단의 경우 집의 가격이 낮은 편에 속함.
### 직업 센터와의 거리가 집의 가격에 영향을 미칠 경우가 낮다고 판단됨.

pairs(BostonHousing[, c("crim", "rm", "dis", "tax", "medv")])
cor(BostonHousing[, c("crim", "rm", "dis", "tax", "medv")])
################################################################### 점심시간 스따뜨

# 산포도를 확인 하였을 때 상관 계수가 1에 가까운 모습을 보여주는 변수는 medv, rm으로 확인 됨.
# 실제 상관 계수 확인 시 절대값 1에 가까운 변수는 medv, rm 으로 확인됨.

# 결측값의 종류는 ",", ".", "0" 으로 다양하므로 R에서 인식할 수 있게 "NA"로 치환.
x <- c(1, 2, 3, NA, 5, NA, 8)
is.na(x)
# [1] FALSE FALSE FALSE  TRUE FALSE  TRUE FALSE
sum(is.na(x))
# [1] 2 >> TRUE 는 1, FALSE는 0 이므로 sum의 값이 2가 나옴.
# 이걸 통해 결측치가 얼마나 존재하는지 확인할 수 있다.
sum(!is.na(x))
# [1] 5 >> 위와 반대 되므로 TRUE 는 0, FALSE는 1 이니까 5가 나옴.
sum(x, na.rm = T)
# [1] 19 >> na.rm 파라미터로 결측치를 제거할 것인지 설정 가능.

x[is.na(x)] <- median(x, na.rm = T)
# na를 치환하는 방법 >> x[is.na(x)] <- O >>>>>>>> 위의 예는 중앙값으로 치환 한 것이고, 중앙값으로 치환할 때
# 우변이 NA가 제외되지 않은 상태에서는 Median 값이 NA가 나오므로 na.rm 파라미터로 na를 지워서 중앙값을 구하게 한다.

boxplot.stats(iris$Sepal.Width)
# boxplot을 그릴때 사용했던 수치를 표현
# $stats (이걸 이용하여 boxplot을 그린다.)
# [1] 2.2 2.8 3.0 3.3 4.0
#
# $n (원소개수)
# [1] 150
#
# $conf (신뢰구간)
# [1] 2.935497 3.064503
#
# $out (이상치 )
# [1] 4.4 4.1 4.2 2.0
boxplot.stats(iris$Sepal.Width)$out
# [1] 4.4 4.1 4.2 2.0
# 이상치만 확인하고 싶을때 지시어를 추가한다.
# DF명(complete.cases(DF명)) > 결측치가 존재할 경우 결측치를 제외하고 가져온다. (복습할 때 확인)

iris[order(iris$Sepal.Length), ]
# order 지시어를 이용해 오름차순 정렬을 할 수 있다.
# 위의 명령어는 iris의 자료를 Sepal.Length를 기준으로 정렬하라는 명령어이다.

lst <- split(iris, iris$Species)
# split(Data이름, 분리 기준 컬럼)
head(lst$setosa)
#   Sepal.Length Sepal.Width Petal.Length Petal.Width Species
# 1          5.1         3.5          1.4         0.2  setosa
# 2          4.9         3.0          1.4         0.2  setosa
# 3          4.7         3.2          1.3         0.2  setosa
# 4          4.6         3.1          1.5         0.2  setosa
# 5          5.0         3.6          1.4         0.2  setosa
# 6          5.4         3.9          1.7         0.4  setosa

# 데이터 샘플림
# 복원 추출 : 한번 뽑은 것을 다시 뽑을 수 있다.
# 비복원 추출 : 한번 뽑은 것은 다시 뽑을 수 없다.

x <- 1:20
sample(x, size = 10, replace = F)
# [1]  5  3  4  8 14 16  2 10 20 19
# replace 파라미터를 이용하여 복원 추출할 것인지 비복원 추출할 것인지 정한다.
sample(x, size = 10, replace = T)
# [1] 17  3  3  7  5 12  9 15  6  9

td <- iris
idx <- sample(length(td$Sepal.Length), 30, replace = F)   # length(td$Sepal.Length)로 iris 각 행의 개수 구함.
test <- iris[idx, ]     # 추출한 30개를 test로 지정.
train <- iris[-idx, ]       # 위의 test를 제외하고 나머지를 train Data로 지정하기 위해 -idx로 위의 값을 제외.
dim(test)
# test확인 >> [1] 30  5
dim(train)
# train >> [1] 120   5

############################################################### 5번째 시간 끝.

# Random Sampling
# 통계에서의 Random 
# >> 나타날 확률이 동일한 조건일때 (ex) 동전을 던졌을 때 앞, 뒤가 나올 경우 >> 앞 50%, 뒤 50%)
# >> 임의로 Sampling 진행
# Systematic Sampling ★★★★★
# 구간단위로 점프를 하여 Sampling (5 ~ 15 ~ 25 ~ 35)
# Stratified Sampling ★★★★★
# 남과 여를 구분하여 놓고 남자 쪽에서 Random, 여자 쪽에서 Random Sampling진행.
# Clustering Sampling
# 지역단위로 분류하여 여기서 Sampling

# set.seed(숫자) >> sampling 구문 바로 앞에 작성 (어디서나 Random 값을 일정하게 하기 위한 방법)

aggregate(iris[, -5], list(iris$Species), mean)
#      Group.1 Sepal.Length Sepal.Width Petal.Length Petal.Width
# 1     setosa        5.006       3.428        1.462       0.246
# 2 versicolor        5.936       2.770        4.260       1.326
# 3  virginica        6.588       2.974        5.552       2.026
# aggregate(정리할 Data, 기준, 진행 함수)
# Data를 기준점을 잡아 함수로 연산한 후 결과를 출력 한다.

x <- data.frame(name = c("a", "b", "c"), math = c(90, 80, 40))
y <- data.frame(name = c("a", "b", "d"), eng = c(75, 60, 90))
merge(x, y, all.x = T)
#   name math eng
# 1    a   90  75
# 2    b   80  60
# 3    c   40  NA
merge(x, y, all.y = T)
#   name math eng
# 1    a   90  75
# 2    b   80  60
# 3    d   NA  90
merge(x, y, all = T)
#   name math eng
# 1    a   90  75
# 2    b   80  60
# 3    c   40  NA
# 4    d   NA  90
## 2개의 Data Frame을 합칠 때 사용하는 함수 >> merge
## merge(x, y, all.x >> x를 기준으로 병합, all.y >> y를 기준으로 병합, all >> 기준없이 그대로 병합)

install.packages("ggplot2")
library(ggplot2)

month <- 1:6
rain <- c(55, 50, 45, 50, 60, 70)
df <- data.frame(month, rain)
ggplot(df, aes(x = month, y = rain)) +      # ggplot(DF명, aes(x = x축, y = y축)) +
  geom_bar(                               # bar >> 막대 그래프
    stat = "identity",                  # stat = "identity" >> 열에 의해서 결정되게 설정.
    width = 0.7,                        # 막대 넓이
    fill = "steelblue"                  # 막대 색깔
  ) +
  coord_flip()                            # 세워져 있는 막대를 눕혀버림. (행과 열을 반대로)

ggplot(iris, aes(x = Petal.Length)) +
  geom_histogram(binwidth = 0.5)          # hostogram >> 히스토그램 생성, binwidth >> 막대 넓이

ggplot(iris, aes(x = Sepal.Width, fill = Species, col = Species)) +
  geom_histogram(binwidth = 0.5, position = "dodge") +
  theme(legend.position = "top")      # 분류를 설명한 내용을 어디에 표기할 것인가

ggplot(iris, aes(x = Petal.Length, y = Petal.Width, col = Species)) +
  geom_point()        # 점으로 그래프를 나타내기 위한 지시어
