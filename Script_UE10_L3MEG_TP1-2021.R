#--------------------------------------------------------------
# L3 MEG - 2020 - TP1
# UE10 Genetique Humaine
# Univ de Paris - UFR SDV
#--------------------------------------------------------------

#--------------------------------------------------------------
# set working directory
#--------------------------------------------------------------

#setwd("path_of_working_directory")

setwd("/srv/data/meg-l3-gh/DataTP1/SNP/")

#or

# click on "session", then select "set working directory" and 
# finaly click on "To source file location".

#--------------------------------------------------------------
# upload data in R with read.table()
#--------------------------------------------------------------

M01.map = read.table("MO1.map")
M01.dat = read.table("MO1.dat")
M01.don = read.table("MO1.don") 

#--------------------------------------------------------------
# to select specific line with grep()
#--------------------------------------------------------------

M01.map[grep("SNP_A-1780619", M01.map[,2]), ]
M01.map[grep("SNP_A-1780618", M01.map[,2]), ]
# grep function is used to select rows containing
# one string (chaine de caractere) in a specific column 

#or

for (snp in c("SNP_A-1780619","SNP_A-1780618")) {
  print(M01.map[grep(snp, M01.map[,2]), ])
}

#--------------------------------------------------------------
# upload LodScore data in R with read.table()
#--------------------------------------------------------------

# lecture de toute les résultats
LodScoreAllChr = read.table("MO1-snp-parametric.tbl", header=TRUE)

#subset function is used to select a part of the original dataframe
# Here only the chr 7 is selected

LodScoreChr7bis = subset(LodScoreAllChr, LodScoreChr7$CHR=7)

LodScoreChr7 = read.table("Chromosome-7-Lodscores.txt", header=TRUE)
LodScoreChr7=LodScoreChr7[order(LodScoreChr7$POS),]
# Order function is used only to sort the dataframe on the position

#--------------------------------------------------------------
# to visualize LodScore curve with plot()
#--------------------------------------------------------------

plot(LodScoreChr7$POS,LodScoreChr7$LOD, type="l",
     main="LodScore on Chromosome 7",
     xlab="Position", ylab="LodScore")
abline(h = 3, col="red")
abline(h = -2, col="green")
# abline function is used to add horizontal lines
# Here, two lines will be added on the plot with y=3 and y=-2 equations

# Pic 1
LodScoreChr7Pic1 = subset(LodScoreChr7, (LodScoreChr7$POS>=0.31 & LodScoreChr7$POS<=0.36))
#subset function is used to select a part of the original dataframe
# Here, only lines with the position between 0.31 and 0.36 will be selected

Pic1_Zmax <- max(LodScoreChr7Pic1$LOD) ; print(Pic1_Zmax)
Pic1_Zmax - 2

plot(LodScoreChr7Pic1$POS,LodScoreChr7Pic1$LOD, 
     type="l", main="LodScore on Chromosome 7",
     xlab="Position", ylab="LodScore")
abline(h = 3, col="red")
abline(h = -2, col="green")

# Pic 2 and 3
LodScoreChr7Pic2and3 = subset(LodScoreChr7, (LodScoreChr7$POS>=1.05 & LodScoreChr7$POS<=1.2))

Pic2and3_Zmax <- max(LodScoreChr7Pic2and3$LOD) ; print(Pic2_Zmax)
Pic2and3_Zmax - 2

plot(LodScoreChr7Pic2and3$POS,LodScoreChr7Pic2and3$LOD, type="l")
abline(h = 3, col="red")
abline(h = -2, col="green")

#--------------------------------------------------------------
# to visualize LodScore curve with plot() - version bis
#--------------------------------------------------------------

plot(LodScoreChr7bis$POS,LodScoreChr7bis$LOD, type="l",
     main="LodScore on Chromosome 7",
     xlab="Position", ylab="LodScore")
abline(h = 3, col="red")
abline(h = -2, col="green")
# abline function is used to add horizontal lines
# Here, two lines will be added on the plot with y=3 and y=-2 equations

# Pic 1
LodScoreChr7Pic1bis = subset(LodScoreChr7bis, (LodScoreChr7bis$POS>=0.31 & LodScoreChr7bis$POS<=0.36))
#subset function is used to select a part of the original dataframe
# Here, only lines with the position between 0.31 and 0.36 will be selected

Pic1_Zmax <- max(LodScoreChr7Pic1bis$LOD) ; print(Pic1_Zmax)
Pic1_Zmax - 2

plot(LodScoreChr7Pic1bis$POS,LodScoreChr7Pic1bis$LOD, 
     type="l", main="LodScore on Chromosome 7",
     xlab="Position", ylab="LodScore")
abline(h = 3, col="red")
abline(h = -2, col="green")

# Pic 2 and 3
LodScoreChr7Pic2and3bis = subset(LodScoreChr7bis, (LodScoreChr7bis$POS>=1.05 & LodScoreChr7bis$POS<=1.2))

Pic2and3_Zmax <- max(LodScoreChr7Pic2and3bis$LOD) ; print(Pic2_Zmax)
Pic2and3_Zmax - 2

plot(LodScoreChr7Pic2and3bis$POS,LodScoreChr7Pic2and3bis$LOD, type="l")
abline(h = 3, col="red")
abline(h = -2, col="green")
