from py4j.java_gateway import JavaGateway 

gateway = JavaGateway() 
java_object = gateway.entry_point 
print("Hi from python client")

df = java_object.getDocFreq("Assignment_2/index", "abstract", "birth")
print("Doc Freq = " + str(df))
cf = java_object.getCollectionFreq("Assignment_2/index", "abstract", "birth")
print("Collection Freq = " + str(cf))
tf = java_object.getTermFreq("Assignment_2/index", "title", "birth")
for t in tf[20:30]:
    print("Term Freq = " + str(t))

# c = java_object.add(2,3)
# print(c)
# b = java_object.test()
# print(b)
