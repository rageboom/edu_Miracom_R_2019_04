list.files(pattern = "R$")
list.dirs()

source("edu_Miracom_R_2019_04-master/Miracom_dataset/data_generator_folders_files.R", encoding = "UTF-8")
install.packages("lubridate")
file_list = list.files(path = "Item_19274_DB/", recursive = TRUE, full.names = TRUE, pattern = "promo")

df = data.frame()

for (n in 1:length(file_list)) {
  df_sub = read.csv(file_list[n], stringsAsFactors = FALSE)
  df = rbind(df, df_sub)
}

nrow(df_sub)
nrow(df)
