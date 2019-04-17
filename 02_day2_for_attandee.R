#### .=========.####
#### | [[ Day 2 ]] ####
#### .=========.####

#### 2. 데이터 취득과 전처리 ####
#### __ [05] 다양한 함수의 활용 ####
#### _____ ● Pivoting ####
#### _____ ● 데이터 & 패키지 준비 ####
library("reshape2")
set.seed(123) # 랜덤 결과를 보정 시킴. argument: 참조하는 난수 테이블 번호. 
df = data.frame(Obs = 1:4,
                A = sample(10:99, size = 4), #10 ~ 에서 99까지 4가지 숫자 뽑는다. 
                B = sample(10:99, size = 4),
                C = sample(10:99, size = 4))
df
?set.seed
#### _____ ● melt() ####
df_melt = melt(data = df, id.vars = "Obs",
               variable.name = "Group", value.name = "Count")
head(df_melt)

?melt
#### _____ ● cast() ####

dcast(data = df_melt, formula = Obs ~ Group, value.var = "Count")
dcast(data = df_melt, formula = Obs ~ Group, value.var = "Count", fun.aggregate = length)
#### _____ ● t() ####
data(iris)
colnames(iris)
t(colnames(iris)) # 행열로 변경 시킴
t(t(colnames(iris)))
#### _____ ● 반복문 대체 ####

#### _____ ● ifelse() ####
df = data.frame(aa = 1:2,
                bb = c("a", "b"))
df
#
df[, "new"] = ifelse(test = df$aa != 1,
                     yes = "oh!", no = "no!")
df
#### _____ ● ifelse() 예제 ####
df = read.csv("./edu_Miracom_R_2019_04-master/Miracom_dataset/rating_ramyun.csv", stringsAsFactors = FALSE)
head(df)
df
df[, "kr"] = ifelse(test = df$Country == "South Korea", yes = "1", no = "0")
head(df)
#### _____ ● apply() ####
data("iris")
df = head(iris[, 1:4])
df
apply(X = df, MARGIN = 1, FUN = "sum")
apply(X = df, MARGIN = 2, FUN = "sum")
#### _____ ● apply() 예제 ####, 1:4
score = read.csv("./edu_Miracom_R_2019_04-master/Miracom_dataset/class_score.csv", stringsAsFactors = FALSE)
head(score[, c(5,6,7,8,9)]);

df_subject = data.frame(Subject = colnames(score)[5:ncol(score)],
                        Mean = apply(X = score[, 5:ncol(score)], MARGIN = 2, FUN = "mean"),
              Max = apply(X = score[, 5:ncol(score)], MARGIN = 2, FUN = "max"),
              Min = apply(X = score[, 5:ncol(score)], MARGIN = 2, FUN = "min"))
df_subject


data.frame(df_subject);
#### _____ ● sapply() ####

#### _____ ● Join ####
 
#### _____ ● 데이터 준비 ####
source("edu_Miracom_R_2019_04-master/Miracom_dataset/data_generator_join.R", encoding = "UTF-8") # 스크립트를 실행 시킴.
head(df_room)
head(df_list)
#### _____ ● 내장 함수 ####
# Left Join
# library("dplyr")
left_join(x = df_list, y = df_room, by = c("member" = "name"))
# Inner Join
inner_join(x = df_list, y = df_room, by = c("member" = "name"))
#### _____ ● SQL 문법 ####
# Left Join

# Inner Join

#### _____ ● dplyr 패키지 ####
# Left Join

# Inner Join

#### _____ ● magrittr 패키지 ####

#### _____ ● 파이프 연산자 실습 ####
library("magrittr")

text = "asdf12d3334!@#$" ## .[] 이전 값을 그대로 쓰겠다.
text %>% gsub(pattern = "[^0-9]", replacement = "") %>% as.numeric() + 3000 -> result
result
#### 3. 통계 ####

#### __ [01] 들어가며 ####
#### ____ ● 통계? ####

#### ____ ● 표본 ####

#### ____ ● 사건 ####

#### ____ ● 확률 ####

#### ____ ● 확률 ####

#### __ [02] 통계량 ####
#### ____ ● 통계량의 정의 ####


#### ____ ● 평균 - mean() ####
# 산술 평균


# 기하 평균


# 결측치가 포함되어 있는 값의 평균 계산
mean(c(1:3, NA, 23))
dd = c(1, 2, NA, 5)
is.na(dd)
dd[is.character(dd)] = 22
mean(dd);
dd = as.numeric(dd)
# na.rm 파라미터 추가
mean(c(1:3, NA, 23), na.rm = TRUE)
mean(c(1:3, NA, 23), na.rm = T)

# 글자가 포함되어 있는 값의 평균 계산
mean(c(1:3, "사과", 23))

# na.rm 파라미터 추가
mean(c(1:3, "사과", 23), na.rm = TRUE)

=#### ____ ● 중앙값 - median() ####


#### ____ ● 최빈값 ####
mode = function(x){
  ux = unique(x)
  ux[which.max(tabulate(match(x, ux)))]
}

mode(c(1, 1, 1, 2, 3, 4, 4))


#### ____ ● 분산과 표준편차 - var(), sd() ####


#### ____ ● 통계량의 함정 ####
# https://github.com/stephlocke/datasauRus

library("ggplot2")
library("datasauRus")
ggplot(datasaurus_dozen) + 
  aes(x = x,
      y = y,
      color = dataset) + 
  geom_point() + 
  theme(legend.position = "none") + 
  facet_wrap( ~ dataset, nrow = 3)

#### __ [03] 가설 검정 Ⅰ ####
#### ____ ● 용어 정리 ####

#### ____ ● 가설검정 절차 ####

#### ____ ● 분할표와 오류 ####

#### ____ ● 분할표의 해석 ####
# 정확도

# 정밀도

# 재현율

#### ____ ● 분할표 ####
set.seed(1234)
Truth = factor(sample(0:1, size = 150, replace = TRUE), levels = 1:0)
Result = factor(sample(0:1, size = 150, replace = TRUE), levels = 1:0)
table = table(Result, Truth)
table

sum(table[1, 1], table[2, 2]) / sum(table) #Accuracy
table[1, 1] / sum(table[1, 1:2]) #Precision
table[1, 1] / sum(table[1:2, 1]) #Recall

install.packages("e1071")
library("caret")
confusionMatrix(table)
#### __[04] 추론 통계 ####
#### ____ ● 개념 ####

#### ____ ● 용어 정리 ####

#### ____ ● 점추정 ####
library("MASS")
mean(survey$Height, na.rm = TRUE)
head(survey)
is.na(survey$Sex)
gender.response = na.omit(survey$Sex)
sum(gender.response == "Female") / length(gender.response)
#### ____ ● 용어 정리 ####

#### ____ ● 예제 코드 ####

#### ____ ● 좋은 점 추정량의 조건 ####

#### ____ ● 구간 추정 ####

#### ____ ● 용어 정리 - 구간 추정 ####

#### ____ ● 정규분포 신뢰 구간 관련 코드 1 ####

#### ____ ● 정규분포 신뢰 구간 관련 코드 2 ####

#### ____ ● 모평균의 신뢰구간 ####
set.seed(123)
x = sample(30:70, size = 15)
mean(x) # 표본 평균.
var(x)
?var
sd(x)

t.test(x,
       alternative = "greater",
       mu = 63.0, # 모평균
       conf.level = 0.95) #신뢰 수준 0.95
#### ____ ● 모비율의 신뢰구간 ####
prop.test(x = 130,
          n = 200,
          p = 0.50,
          alternative = c("two.sided"),
          conf.level = 0.95)
#### __ [05] 표본 추출 ####
#### ____ ● 표본 추출의 정의 ####

#### ____ ● 표본 추출의 종류 ####

#### ____ ● 확률적 표본 추출의 정의 ####

#### ____ ● 단순 임의 추출의 정의 ####

#### ____ ● 단순 임의 추출의 특징 ####

#### ____ ● 단순 임의 추출 ####
# 복원 추출


# 비복원 추출


#### ____ ● 군집 표본 추출의 정의 ####


#### ____ ● 군집 표본 추출의 특징 ####


#### ____ ● 예시 ####
# 행정구역 기준 표본 추출


# 교육기관 기준 표본 추출


#### ____ ● 체계적 표본 추출의 정의 ####

#### ____ ● 체계적 표본 추출의 특징 ####




#### .==================. ####

#### __ ● 제품 및 브랜드 평가 ####
library("dplyr")
library("tidyr")
library("ggplot2")

df = read.csv("prods_scores.csv", stringsAsFactors = FALSE)
df[, "score_phrase"] = factor(df$score_phrase,
                              levels = c("Disaster", "Unbearable", "Painful", "Awful", "Bad",
                                         "Mediocre",
                                         "Okay", "Good", "Great", "Amazing", "Masterpiece"))

Microsoft = paste0("Xbox", c(" One", "", " 360"))
Sony = paste0("PlayStation", c(" Portable", " 4", " 2", " 3", " Vita", ""))
PC = c("Linux", "Macintosh", "SteamOS", "PC")
Nintendo = c(paste0("Nintendo ", c("3DS", 64, "64DD", "DS", "DSi")),
             "New Nintendo 3DS",
             paste0("Game Boy", c("", " Color", " Advance")),
             "Wii",
             "Wii U",
             "NES",
             "GameCube",
             "Super NES")

df[, "company"] = ifelse(df$platform %in% Microsoft, "Microsoft",
                         ifelse(df$platform %in% Sony, "Sony",
                                ifelse(df$platform %in% PC, "PC",
                                       ifelse(df$platform %in% Nintendo,
                                              "Nintendo", "Other"))))

my.palette = c("Sony"      = "#EDC951",
               "Nintendo"  = "#EB6841",
               "PC"        = "#CC2A36",
               "Microsoft" = "#4F372D",
               "Other"     = "#00A0B0")

ggplot(data = df, 
       aes(x = score_phrase,
           y = company,
           color = company)) +
  # geom_point(size = 12, 
  #            alpha = 0.02) +
  geom_jitter(alpha = 0.2) +
  scale_color_manual(values = my.palette) +
  labs(x = "Score category", y = NULL, title = "Reviews by Score categories") +
  theme_bw() +
  theme(legend.position = "none")


#### __ ● Nebraska 지역 기온 시각화 ####
library("lubridate")
library("viridis")
library("ggridges")

df_weather = read.csv("nebraska_2016.csv", stringsAsFactors = FALSE)
df_weather[, "Month"] = month(df_weather$CST)
df_weather[, "Month_order"] = factor(month.name[df_weather$Month],
                                     levels = month.name)

ggplot(df_weather, 
       aes(x = Mean.TemperatureF, 
           y = Month_order, 
           fill = ..x..)) +
  geom_density_ridges_gradient(scale = 3, 
                               rel_min_height = 0.01, 
                               gradient_lwd = 1) +
  scale_x_continuous(expand = c(0.01, 0.01)) +
  scale_y_discrete(  expand = c(0.01, 0.01)) +
  scale_fill_viridis(name = "Temp. [F]", option = "C") +
  labs(title = 'Temperatures in Lincoln NE') +
  theme_ridges(font_size = 13, grid = TRUE) + 
  theme(axis.title.y = element_blank())


#### __ ● 반응형 3D 그래프 ####
library("reshape2")
library("plotly")

x = seq(from = -4 * pi, to = 4 * pi, length.out = 100)
df = expand.grid(x = x, y = x)
df$r = sqrt(df$x^2 + df$y^2)
df$z = cos(df$r^2) * exp(-df$r/6)


#### __ ● 반응형 네트워크 그래프 ####
library("networkD3")
library("d3Network")

src = c(rep("A",4), rep("B", 2), rep("C", 2), "D")
target = c("B", "C", "D", "J", "E", "F", "G", "H", "I")

#### __ ● Sankey 다이어그램 ####
install.packages("RCurl")
library("networkD3")
library("d3Network")
library("RCurl")
URL = "https://raw.githubusercontent.com/christophergandrud/networkD3/master/JSONdata/energy.json"
Energy = getURL(URL, ssl.verifypeer = FALSE)

EngLinks = JSONtoDF(jsonStr = Energy,
                    array = "links")
EngNodes = JSONtoDF(jsonStr = Energy,
                    array = "nodes")

sankeyNetwork(Links = EngLinks,
              Nodes = EngNodes,
              Source = "source",
              Target = "target",
              Value = "value",
              NodeID = "name",
              width = 700,
              nodeWidth = 30)

#### __ ● 병합 ####
library("ggExtra")
library("ggplot2")

set.seed(1234)
df = data.frame(x = c(rnorm(500, mean = -1), rnorm(500, mean = 1.5)),
                y = c(rnorm(500, mean = -1), rnorm(500, mean = 1.7)))

p = ggplot(df, aes(x, y)) +
  geom_point()

