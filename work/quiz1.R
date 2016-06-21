#Question 18
o <- read.csv("hw1_data.csv");
v <- o[,1];

bad <- is.na(o[,1]);
#bad1 <- is.na(o[,2]);
bad2 <- is.na(o[,4]);

b <- bad | bad2;
b;

naM <- o[!b,];

good <- naM[,1] > 31;
good1 <- naM[,4] > 90;

g <- good & good1;

gM <- naM[g,];
sV <- gM[,2];
mean(sV);



#########################3
#Question 19
o <- read.csv("hw1_data.csv");
mean(o[o[,5] == 6,4], na.rm=T);


#########################3
#Question 20
o <- read.csv("hw1_data.csv");
max(o[o[,5] == 5,1], na.rm=T);



good <- o[,5];
good == 6;

gM <- naM[o[,5] == 6,];
gM;
sV <- gM[,4];
mean(sV);





f <- factor(bad);
table(f);
val <- v[!bad];
val;
v1 <- v > 31;
v1;
mean(val);
o[1:6,];