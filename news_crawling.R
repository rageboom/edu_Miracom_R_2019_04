install.packages("KoNLP")
install.packages("rJava")
install.packages("wordcloud")
library(rJava)
library(KoNLP)
library(wordcloud)
library(RColorBrewer)

f = file("news.txt", blocking = F)
txtLines = readLines(f)
nouns = sapply(txtLines, extractNoun, USE.NAMES = F)
head(unlist(nouns), 20)
write(unlist(nouns), "news_1.txt")
revised = read.table("news_1.txt")
nrow(revised)
wordcount = table(revised)
length(wordcount)
head(sort(wordcount, decreasing = T), T)

pal = brewer.pal(9, "Set1")
##x11()
wordcloud(names(wordcount), freq = wordcount,
          scale = c(5, 1), rot.per = 0.25, min.freq = 1,
          random.order = F, random.color = T, colors = pal)
