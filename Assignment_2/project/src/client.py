from py4j.java_gateway import JavaGateway 

gateway = JavaGateway() 
luceneServer = gateway.entry_point 

n = luceneServer.numDocs("Assignment_2/index")

print(luceneServer.checkFn("Assignment_2/index", "title", "study"))
# print("Number of documents = " + str(n))

# df = luceneServer.getDocFreq("Assignment_2/index", "title", "deep")
# print("Doc Freq = " + str(df))

# cf = luceneServer.getCollectionFreq("Assignment_2/index", "title", "deep")
# print("Collection Freq = " + str(cf))

# x = 0
# for i in range(n):
#     tf = luceneServer.getTermFreq("Assignment_2/index", "title", "deep", i)
#     if(tf != 0):
#         x += tf
#         print("Doc = " + str(i) + " Term Freq = " + str(tf))
# print(x)

# coln_len = luceneServer.getCollectionLen("Assignment_2/index", "title")
# print("Collection Length = " + str(coln_len))

# avg_len = luceneServer.getAvgDocLen("Assignment_2/index", "title")
# print("Average Document Length = " + str(avg_len))
