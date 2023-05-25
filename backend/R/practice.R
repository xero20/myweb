print("start")

period = scan("image/file.txt", what="", sep="\n")
period_diff = as.integer(as.Date(period[2])-as.Date(period[1]))

#sprintf("Number: %d", 123)
sprintf("Start date : %s", period[1])
sprintf("End date : %s", period[2])


args = commandArgs(trailingOnly=TRUE)
print(args)
# Rscript --vanilla practice.R file.txt



print("end")