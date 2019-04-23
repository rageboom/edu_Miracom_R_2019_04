############################################################3
## 네트워크 트래픽 분석
log = read.csv('csv001.csv', header = T, stringsAsFactors = F)

log$time = as.factor(log$time)
log$source_ip = as.factor(log$source_ip)
log$destination_ip = as.factor(log$destination_ip)
log$protocol = as.factor(log$protocol)
log$length = as.factor(log$length)
log$source_port = as.factor(log$source_port)
log$destination_port = as.factor(log$destination_port)

frequence_showPivot = function (x) {
  print(max(summary(x[, 3])))
  print(min(summary(x[, 3])))
  print(mean(summary(x[, 3])))
  
}

frequence_showPivot(log);

quatity_showPivot = function (x) {
  print(max(as.numeric(as.character(x[, 5])), na.rm = T)))
  print(min(as.numeric(as.character(x[, 5])), na.rm = T)))
  print(mean(as.numeric(as.character(x[, 5])), na.rm = T)))
}

quatity_showPivot(log)

## 그래프 창을 2개로 나누는 함수.
par(mfrow = c(1, 1))

plot(sort(table(log$destination_ip), decreasing = T))
plot(head(sort(table(log$destination_ip), decreasing = T), 10))
head(sort(table(log$destination_ip), decreasing = T), 10)

par(mfrow = c(1, 1))

freqSource = log$source_ip[log$destination_ip == "97.102.48.98"]
plot(sort(table(freqSource), decreasing = T))
plot(head(sort(table(freqSource), decreasing = T), 10))
head(sort(table(freqSource), decreasing = T), 10)

library(igraph)

par(mfrow = c(1, 1))
par(mar = c(0, 0, 0, 0))
gh = graph.data.frame(log[, 2:3])
plot(gh, layout = layout.fruchterman.reingold, vertex.size = 8, edge.arrow.size = 0.5, vertex.label = NA)
