from py4j.java_gateway import JavaGateway 

gateway = JavaGateway() 
java_object = gateway.entry_point 
print("Hi from python client")

n = java_object.numDocs("Assignment_2/index")
print("Number of documents = " + str(n))
df = java_object.getDocFreq("Assignment_2/index", "abstract", "deep")
print("Doc Freq = " + str(df))
cf = java_object.getCollectionFreq("Assignment_2/index", "abstract", "deep")
print("Collection Freq = " + str(cf))
x = 0
for i in range(n):
    tf = java_object.getTermFreq("Assignment_2/index", "abstract", "deep", 0)
    if(tf != 0):
        x += tf
    #print("Doc = " + str(i) + " Term Freq = " + str(t))
print(x)
coln_len = java_object.getCollectionLen("Assignment_2/index", "abstract")
print("Collection Length = " + str(coln_len))
avg_len = java_object.getAvgDocLen("Assignment_2/index", "abstract")
print("Average Document Length = " + str(avg_len))
