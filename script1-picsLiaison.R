
#--------------------------------------------------------------
# L3 MEG - 2021 - TP2
# UE10 Genetique Humaine
# Université de Paris - UFR SDV
#--------------------------------------------------------------

#--------------------------------------------------------------
# set working directory
#--------------------------------------------------------------

#setwd("path_of_working_directory")

setwd("~/l3meg-gh-tp2-4-bash/")

#--------------------------------------------------------------
# upload LodScore data in R with read.table()
#--------------------------------------------------------------

# Loading of all results in a dataframe
LodScoreAllChr = read.table("~/l3meg-gh-tp1/MO1-snp-parametric.tbl", header=TRUE)

#subset function is used to select a part of the original dataframe
# Here only the chr 7 is selected

LodScoreChr7 = subset(LodScoreAllChr, LodScoreAllChr$CHR==7)
LodScoreChr7 = LodScoreChr7[order(LodScoreChr7$POS),]
# Order function is used only to sort the dataframe on the position

# A new data frame is created by ordering the lines according to the content of the MODEL column
# and its content is written in an output file
LodScoreChr7model = LodScoreChr7[order(LodScoreChr7$MODEL),]
write.table(LodScoreChr7model,row.names=FALSE,col.names=TRUE,quote=FALSE,file="lodscores-Chr7-byModel.txt")


#--------------------------------------------------------------
# to visualize LodScore curve with plot()
#--------------------------------------------------------------

plot(LodScoreChr7$POS,LodScoreChr7$LOD, type="l",
     main="LodScore on Chromosome 7",
     xlab="Position", ylab="LodScore à partir de AllChr")
abline(h = 3, col="red")
abline(h = -2, col="green")
# abline function is used to add horizontal lines
# Here, two lines will be added on the plot with y=3 and y=-2 equations

# Pic 1
LodScoreChr7Pic1 = subset(LodScoreChr7, (LodScoreChr7$POS>=0.31 & LodScoreChr7$POS<=0.36))
#subset function is used to select a part of the original dataframe
# Here, only lines with the position between 0.31 and 0.36 will be selected

Pic1_Zmax <- max(LodScoreChr7Pic1$LOD)

print("Pour le Pic 1, le Zmax est : ")
Pic1_Zmax
print("et Zmax-2 est : ")
Pic1_Zmax - 2

plot(LodScoreChr7Pic1$POS,LodScoreChr7Pic1$LOD, 
     type="l", main="LodScore on Chromosome 7",
     xlab="Position", ylab="LodScore")
abline(h = 3, col="red")
abline(h = -2, col="green")

# Pic 2 and 3
LodScoreChr7Pic2and3 = subset(LodScoreChr7, (LodScoreChr7$POS>=1.05 & LodScoreChr7$POS<=1.2))

Pic2and3_Zmax <- max(LodScoreChr7Pic2and3$LOD) 

print("Pour le Pic 2 et 3, le Zmax est : ")
Pic2and3_Zmax
print("et Zmax-2 est : ")
Pic2and3_Zmax - 2

plot(LodScoreChr7Pic2and3$POS,LodScoreChr7Pic2and3$LOD,      
     type="l", main="LodScore on Chromosome 7",
     xlab="Position", ylab="LodScore")
abline(h = 3, col="red")
abline(h = -2, col="green")

