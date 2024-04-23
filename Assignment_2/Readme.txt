To resolve import errors in Java

Go to the explorer option on vscode (top left corner when you open project folder) and select Java Projects
You will see a Java Projects drop down in the same window below your project folder
Over there you will see a folder called Referenced Libraries
Click on + and add all the jar files from the attached lucene_dependencies folder
It should work now

For python just do pip install py4j

To check java-python interop

First run StatsCalculator.java file (Server)
Then run pyj_server.py file (client - naming little bad, ik)
Server - Client conn should work
Check pyj_server.py file on how to use the java functions in python

*** Do note this is currently only working when both server and client are in the same directory