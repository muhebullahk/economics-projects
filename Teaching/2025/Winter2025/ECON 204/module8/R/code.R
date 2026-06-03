getStats <- function(file, year=2019, quarter=4, type=c("income","expenditure"),
                     caption, label, addPerc=FALSE)
{
    type <- match.arg(type)
    M <- 1+(quarter-1)*3
    M <- ifelse(M<10, paste("0",M,sep=""), M)
    data <- read.csv(file, stringsAsFactors=FALSE)
    data <- subset(data, data[,1]==paste(year,"-",M,sep=""))
    seastype <- data$Seasonal.adjustment[1]
    data <- data[,c("Estimates", "VALUE")]
    if (type == "income")
    {
        main <- list(c(1, 4, 8, 11:14))
        main[[2]] <- (1:nrow(data))[-main[[1]]]
    } else {
        main <- list(c(1,10,19,23,26,29,30),
                     c(2,8,9,11,17, 18, 20, 24,25,27,28),
                     c(3,7,12,13,16,21,22),
                     c(4:6, 14:15))
    }
    data <- data[sort(do.call("c", main)),]    
    data$Estimates[main[[1]]] <- paste("\\textbf{",data$Estimates[main[[1]]], "}", 
                                       sep="")
    sp <- 2
    V <- data$VALUE
    data$VALUE[-main[[1]]] <- NA
    if (addPerc)
    {
        p <- abs(data$VALUE[-nrow(data)])/tail(data$VALUE,1)*100
        p <- c(paste("(",round(p,2),"\\%)",sep=""), "")
        p[grep("NA",p)] <- ""
        data$VALUE <- paste(formatC(data$VALUE, format="d", big.mark=","))
        data$VALUE[grep("NA",data$VALUE)] <- ""
        data$VALUE <- paste(data$VALUE, p, sep="") 
    }
    N <- length(main)
    for (i in 2:N)
    {
        spc <- paste("\\hspace{0.",sp,"cm}",sep="")
        data$Estimates[main[[i]]] <- paste("\\hspace{0.2cm}",
                                           data$Estimates[main[[i]]], 
                                           sep="")
        sub <- V
        sub[-main[[i]]] <- NA
        data <- cbind(data, sub)
    }
    colnames(data) <- ""
    n <- nrow(data)
    Tab <- xtable(data, label=label,align=c("l", "p{10cm}",rep("l",ncol(data)-1)),
                    caption=caption)
    list(data=data, table=Tab, seastype=seastype, Q=quarter, Y=year, n=n,
         main=main)
}



getS <- function()
{
    file1 <- "data/3610010301-eng.csv"
    file2 <- "data/3610010401-eng.csv"
    file3 <- "data/3610011101-eng.csv"
    file4 <- "data/3610047701-eng.csv"
    data1 <- read.csv(file1, stringsAsFactors=FALSE)
    data2 <- read.csv(file2, stringsAsFactors=FALSE)
    data3 <- read.csv(file3, stringsAsFactors=FALSE)
    data4 <- read.csv(file4, stringsAsFactors=FALSE)
    comp1 <- unique(data1$Estimates)
    comp2 <- unique(data2$Estimates)
    comp3 <- unique(data3$Estimates)
    S <- ts(data3$VALUE[data3$Estimates==comp3[2]], start=c(1961,1), frequency=4)
    I <- ts(data2$VALUE[data2$Estimates==comp2[10]], start=c(1961,1), frequency=4)+
        ts(data2$VALUE[data2$Estimates==comp2[19]], start=c(1961,1), frequency=4)
    CA <- S-I
    NX <- ts(data2$VALUE[data2$Estimates==comp2[23]], start=c(1961,1), frequency=4)-
        ts(data2$VALUE[data2$Estimates==comp2[26]], start=c(1961,1), frequency=4)
    NFP <- CA-NX
    C <-  ts(data2$VALUE[data2$Estimates==comp2[2]], start=c(1961,1), frequency=4)+
        ts(data2$VALUE[data2$Estimates==comp2[8]], start=c(1961,1), frequency=4)     
    G <-  ts(data2$VALUE[data2$Estimates==comp2[9]], start=c(1961,1), frequency=4)
    T_TR <- ts(data1$VALUE[data1$Estimates==comp1[11]], start=c(1961,1), frequency=4)+
        ts(data1$VALUE[data1$Estimates==comp1[12]], start=c(1961,1), frequency=4)     
    INT <- ts(data4$VALUE, start=c(1961,4), frequency=4)
    Spub <- T_TR-INT-G
    Sprv <- S-Spub
    plot(decompose(Sprv/GDP*100, filter=rep(1/5,5))$trend, ylim=c(-20,30),
         xlim=c(1961,2006))
    lines(decompose(I/GDP*100, filter=rep(1/5,5))$trend, col=2)
    lines(decompose(Spub/GDP*100, filter=rep(1/5,5))$trend, col=3)
    lines(decompose(CA/GDP*100, filter=rep(1/5,5))$trend, col=4)
    legend("topright", c(expression(S[pvt]), expression(I),expression(S[govt]), 
                         expression(CA)), col=1:4, lty=1, bty='n')
}

index <- function(Q, P, name, period, base=1, digits=2, addTot=FALSE)
{
    T <- ncol(Q)
    N <- nrow(Q)
    ## Laaspeyres    
    LQ <- colSums(Q*P[,base])/sum(Q[,base]*P[,base])*100
    LP <- colSums(P*Q[,base])/sum(Q[,base]*P[,base])*100
    CLQ <- numeric(T); CLQ[1] <- 1
    CLP <- numeric(T); CLP[1] <- 1
    CLQ[2:T] <- colSums(P[,-T]*Q[,-1])/colSums(P[,-T]*Q[,-T])
    CLQ <- cumprod(CLQ)*100
    CLP[2:T] <- colSums(P[,-1]*Q[,-T])/colSums(P[,-T]*Q[,-T])
    CLP <- cumprod(CLP)*100
    if (base != 1)
    {
        CLP <- CLP/CLP[base]*100
        CLQ <- CLQ/CLQ[base]*100
    }
    ## Paasch                      
    PQ <- colSums(Q*P)/colSums(Q[,base]*P)*100
    PP <- colSums(P*Q)/colSums(Q*P[,base])*100
    CPQ <- numeric(T); CPQ[base] <- 1
    CPP <- numeric(T); CPP[base] <- 1
    CPQ[2:T] <- colSums(P[,-1]*Q[,-1])/colSums(P[,-1]*Q[,-T])
    CPQ <- cumprod(CPQ)*100
    CPP[2:T] <- colSums(P[,-1]*Q[,-1])/colSums(P[,-T]*Q[,-1])
    CPP <- cumprod(CPP)*100
    if (base != 1)
    {
        CPP <- CPP/CPP[base]*100
        CPQ <- CPQ/CPQ[base]*100
    }
    ## Fisher    
    FQ <- sqrt(LQ*PQ)
    FP <- sqrt(LP*PP)
    CFP <- sqrt(CLP*CPP)
    CFQ <- sqrt(CLQ*CPQ)
    index <- rbind(LQ, CLQ, PQ, CPQ, LP, CLP, PP, CPP, FQ, CFQ, FP, CFP)
    rownames(index) <- c("Unchained Laspeyres Quantity",
                         "Chained Laspeyres Quantity",
                         "Unchained Paasch Quantity",
                         "Chained Paasch Quantity",
                         "Unchained Laspeyres Price",
                         "Chained Laspeyres Price",
                         "Unchained Paasch Price",
                         "Chained Paasch Price",
                         "Unchained Fisher Quantity",
                         "Chained Fisher Quantity",
                         "Unchained Fisher Price",
                         "Chained Fisher Price")
    colnames(index) <- period
    ## Latex table:
    tab <- paste("\\begin{center}\n",
                 "\\begin{tabular}{l",
                 paste(rep("cc", T), collapse="||", sep=""),"}\n", sep="")
    for (i in 1:ncol(Q))
        tab <- paste(tab,
                     "&\\multicolumn{2}{c}{", period[i],"}", sep="")
    tab <- paste(tab,"\\\\\\hline\n",
                 paste(rep("&Q&P", T), collapse="", sep=""),
                 "\\\\\n", sep="")  
    for (i in 1:nrow(Q))
        tab <- paste(tab, name[i],"&", paste(paste(Q[i,],"&",P[i,],sep=""), collapse="&"),
                     "\\\\\n", sep="") 
    tab <- paste(tab, "\\hline\n", sep="")
    if (addTot)
    {
        tot <- colSums(P*Q)
        tab <- paste(tab, "Total Value", sep="")
        for (i in 1:ncol(Q))            
            tab <- paste(tab,
                         "&\\multicolumn{2}{c}{", tot[i],"}", sep="")
        tab <- paste(tab, "\\\\\\hline\n", sep="") 
    }                 
    tab <- paste(tab,             
                 "\\end{tabular}\n",
                 "\\end{center}\n",sep="")
    list(index=index, tab=tab,LQ=LQ,CLQ=CLQ,PQ=PQ,CPQ=CPQ,
         LP=LP,CLP=CLP,PP=PP,CPP=CPP,FQ=FQ,CFQ=CFQ,FP=FP,CFP=CFP)
}


getTab <- function(n,T)
{
    Q <- matrix(nrow=n,ncol=T)
    P <- matrix(nrow=n,ncol=T)
    gP <- runif(n,-.2,.4)
    gQ <- runif(n,-.1,.3)*(gP<0) + runif(n,-.2,.2)*(gP>=0)   
    gQ <- gQ*(abs(gQ)>=0.03) + 0.03*sign(gQ)*(abs(gQ)<0.03)
    gP <- gP*(abs(gP)>=0.03) + 0.03*sign(gP)*(abs(gP)<0.03) 
    Q[,1] <- sample(50:150, n)
    P[,1] <- sample(10:40, n)
    for (i in 2:T)
    {
        Q[,i] <- Q[,i-1]*(1+gQ)
        P[,i] <- P[,i-1]*(1+gP)
    }
    Q <- round(Q,0)
    P <- round(P,0)
    list(Q=Q,P=P)
}


myDecomp <- function(X, type=c("lin","qua"))
{
    type <- match.arg(type)
    f <- frequency(X)
    t <- time(X)
    if (type == "lin")
    {
        b <- lm(X~t)$coef
        Tt <- b[1]+b[2]*t
    } else {
        b <- lm(X~t+I(t^2))$coef
        Tt <- b[1]+b[2]*t+b[3]*t^2
    }
    d <- decompose(X-Tt, filter=rep(1/(f+1), f+1))
    Ct <- d$trend
    St <- d$seasonal
    It <- d$random
    w <- which(cycle(X) == 1)[1]
    S <- St[w:f]
    list(S=S,Xt=X,Tt=Tt,Ct=Ct,St=St,It=It)
    }

addRec <- function(cl, col=gray(.2,.5), drop=NULL, nper=2, ...)
    {
        cl <- na.omit(cl)
        f <- frequency(cl)
        dif <- diff(cl)<0
        end <- time(dif)[which(diff(dif)==-1)]
        start <- time(dif)[which(dif)[1]]
        start <- unique(c(start, time(dif)[which(diff(!dif)==-1)+1]))
        start <- start[1:length(end)]
        ress <- as.data.frame(cbind(start, end))
        ress <- ress[ress[,2]-ress[,1]>= nper/f,]
        r <- range(cl)
        r[1] <- ifelse(r[1]<0, r[1]*1.5, r[1]*.5)
        r[2] <- ifelse(r[2]<0, r[2]*.5, r[2]*1.5)
        y <- c(r,r[c(2,1)])
        rec <- 1:nrow(ress)
        if (!is.null(drop))
            rec <- rec[-drop]
        for (i in rec)
            {
                x <- c(rep(ress[i,1],2), rep(ress[i,2],2))
                polygon(x,y,col=col, border=NA,  ...)
            }
        invisible()
    }



getLabor <- function(dat,
                     age = unique(dat[,"Age.group"]),
                     geo = unique(dat[,"GEO"]),
                     sex = unique(dat[,"Sex"]),
                     stats= unique(dat[,"Statistics"]),
                     type = unique(dat[,"Labour.force.characteristics"]),
                     datatype = unique(dat[,"Data.type"]))
{
    age <- match.arg(age)
    geo <- match.arg(geo)
    sex <- match.arg(sex)
    stats <- match.arg(stats)
    type <- match.arg(type)
    datatype <- match.arg(datatype)
    
    
    dat <- subset(dat, Age.group == age & GEO == geo & Sex == sex &
                       Statistics == stats &
                       Labour.force.characteristics == type &
                       Data.type == datatype)

    start <- as.numeric(c(substr(dat[1,1], 1, 4),
                          substr(dat[1,1], 6, 7)))

    list(Y=ts(dat$VALUE, start, frequency=12), desc=c(age, geo, sex,
                                                      stats, type, datatype))
}

getU <- function(dat, reg, adj=FALSE)
{
    adjn <- ifelse(adj, "Seasonally adjusted", "Unadjusted")
    LF <- unique(dat[,"Labour.force.characteristics"])
    dat <- subset(dat, GEO==reg &
                       Data.type == adjn)
    fname <- c("Canada", "Newfoundland and Labrador", "Prince Edward Island",
               "Nova Scotia", "New Brunswick", "Quebec", "Ontario",
               "Manitoba", "Saskatchewan", "Alberta", "British Columbia")
    abb <- c("CA", "NL", "PE", "NS", "NB", "QC", "ON", "MB", "SK", "AB", "BC")
    abb <- abb[which(fname==reg)]
    age.abb <- c("15plus","15_64","15_24","15_19","20_24","25plus", "25_54", "55plus",
                 "55_64")
    sex <- unique(dat[,"Sex"])
    age <- unique(dat[,"Age.group"])
    sexn <- sapply(sex, function(s) strsplit(s, " ")[[1]][1]) 
    varn <- character()
    n <- 1
    for (e in LF)
    {
        for (a in age)
        {
            for (s in sex)
            {
                tmp <- subset(dat, Labour.force.characteristics == e &
                                   Age.group == a &
                                   Sex == s)
                start <- tmp[1,"REF_DATE"]
                start <- as.numeric(c(substr(start,1,4), substr(start,6,7)))
                if (dim(tmp)[1] == 0)
                    next
                if (n == 1){
                    Data <- ts(tmp$VALUE, frequency=12, start=start)
                } else {
                    Data <- cbind(Data, ts(tmp$VALUE, frequency=12, start=start))
                }
                varn <- c(varn, paste(e, age.abb[which(age==a)], sexn[which(sex==s)]))
                n <- 2
            }
        }
    }
    colnames(Data) <- varn
    filen <- paste("data/",abb,sep="")
    if (adj) filen <- paste(filen, "adj", sep="")
    filen <- paste(filen, ".rda", sep="")
    save(Data, reg, age, adj, LF, varn, file=filen)
    invisible()
    }

#dat <- read.csv("data/1410028701.csv", stringsAsFactors=FALSE)
#dat <- read.csv("data/1410034201.csv", stringsAsFactors=FALSE) #Duration
#geo <- unique(dat[,"GEO"])
#for (g in geo)
#    getUD(dat,g,FALSE)

getUD <- function(dat, reg, adj=FALSE)
{
    adjn <- ifelse(adj, "Seasonally adjusted", "Unadjusted")
    LF <- unique(dat[,"Duration.of.unemployment"])
    dat <- subset(dat, GEO==reg &
                       Data.type == adjn)
    fname <- c("Canada", "Newfoundland and Labrador", "Prince Edward Island",
               "Nova Scotia", "New Brunswick", "Quebec", "Ontario",
               "Manitoba", "Saskatchewan", "Alberta", "British Columbia")
    abb <- c("CA", "NL", "PE", "NS", "NB", "QC", "ON", "MB", "SK", "AB", "BC")
    abb <- abb[which(fname==reg)]
    age.abb <- c("15plus","15_24","25_54", "55_64")
    sex <- unique(dat[,"Sex"])
    age <- unique(dat[,"Age.group"])
    sexn <- sapply(sex, function(s) strsplit(s, " ")[[1]][1]) 
    varn <- character()
    n <- 1
    for (e in LF)
    {
        for (a in age)
        {
            for (s in sex)
            {
                tmp <- subset(dat, Duration.of.unemployment == e &
                                   Age.group == a &
                                   Sex == s)
                start <- tmp[1,"REF_DATE"]
                start <- as.numeric(c(substr(start,1,4), substr(start,6,7)))
                if (dim(tmp)[1] == 0)
                    next
                if (n == 1){
                    Data <- ts(tmp$VALUE, frequency=12, start=start)
                } else {
                    Data <- cbind(Data, ts(tmp$VALUE, frequency=12, start=start))
                }
                varn <- c(varn, paste(e, age.abb[which(age==a)], sexn[which(sex==s)]))
                n <- 2
            }
        }
    }
    colnames(Data) <- varn
    filen <- paste("data/Dur_",abb,sep="")
    if (adj) filen <- paste(filen, "adj", sep="")
    filen <- paste(filen, ".rda", sep="")
    save(Data, reg, age, adj, LF, varn, file=filen)
    invisible()
    }


getDist <- function(dat, reg="Canada")
    {
        d <- subset(dat, dat[,"GEO"] == reg)
        start <-  d[1,"REF_DATE"]
        inc <- unique(d[,"Statistics"])
        d <- lapply(inc, function(i)  
            ts(d[d[,"Statistics"]==i,"VALUE"], start))
        d <- do.call(cbind, d)
        colnames(d) <- inc        
        d
    }



