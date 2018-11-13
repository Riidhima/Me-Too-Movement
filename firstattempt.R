library("tm")
library("SnowballC")
library("wordcloud")
library("RColorBrewer") 

importText <- Corpus(DirSource("C:/Users/Riidhima/Desktop/All the folders/Web mining/Project"))
importText

meta(importText[[1]])

#pre_processing
myStopwords <- c(stopwords("english"))
# your_corpus <- tm_map(your_corpus, tolower)
importText <- tm_map(importText, content_transformer(tolower))
meta(importText[[1]])

importText <- tm_map(importText, removeNumbers)
meta(importText[[1]])

importText <- tm_map(importText, removeWords, myStopwords) 
meta(importText[[1]])

importText <- tm_map(importText, stripWhitespace)
meta(importText[[1]])

importText <- tm_map(importText, removePunctuation)
meta(importText[[1]])

importText <- tm_map(importText, stemDocument)
meta(importText[[1]])



#creating a document term matrix
myDtm <- DocumentTermMatrix(importText, control=list(wordLengths=c(3,Inf)))

dim(myDtm)
inspect(myDtm)

myDM=as.matrix(myDtm) 

#myDM

myDtmfreq <- colSums(myDM)

myDtmfreq


#things run smooth till here

#sparse <- removeSparseTerms(myDM, 0.80)

#freq <- findFreqTerms(myDM, 2)

#removeSparseTerms(myDM,0.90)-> myDtmfreq

str(myDtmfreq)

wordcloud(words=colnames(myDtmfreq),freq=myDtmfreq,min.freq=5, scale(4,0.1), colors=brewer.pal(n=10,"Paired"), random.order=F) 



