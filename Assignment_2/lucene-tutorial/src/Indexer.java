import java.io.File;
import java.io.FileFilter;
import java.io.FileReader;
import java.io.IOException;
import java.io.BufferedReader;

import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.TextField;
import org.apache.lucene.index.CorruptIndexException;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import py4j.GatewayServer;

public class Indexer {

   private IndexWriter writer;

   private static boolean isFileEqualsName(File file, String fileName) {
      return file.getName().equals(fileName);
  }

   public Indexer(String indexDirectoryPath) throws IOException {
      Directory indexDirectory = FSDirectory.open(new File(indexDirectoryPath).toPath());

      writer = new IndexWriter(indexDirectory, new IndexWriterConfig());
   }

   public void close() throws CorruptIndexException, IOException {
      writer.close();
   }

   private Document getDocument(File file) throws IOException {
      Document document = new Document();

      if (isFileEqualsName(file, "doc_dump.txt")) {
         try {
            BufferedReader reader = new BufferedReader(new FileReader(file));
            String line;
            String[] stringArray = {"id", "url", "title", "abstract"};
            while ((line = reader.readLine()) != null) {
               String[] parts = line.split("\t");
               int i = 0;
               for (String part : parts) {
                  TextField field = new TextField(stringArray[i], part, Field.Store.YES);
                  document.add(field);
                  i++;
               }
            }
            reader.close();
         } 
         catch (IOException e) {
             e.printStackTrace();
         }
      } 
      else if (isFileEqualsName(file, "nfdump.txt")) {
         try {
            BufferedReader reader = new BufferedReader(new FileReader(file));
            String line;
            String[] stringArray = {
            "id", "url", "title", "maintext", "comments", "topics tags", 
            "description", "doctors note", "article links", "question links", 
            "topic links", "video links", "medarticle links"
            };
            while ((line = reader.readLine()) != null) {
               String[] parts = line.split("\t");
               int i = 0;
               for (String part : parts) {
                  TextField field = new TextField(stringArray[i], part, Field.Store.YES);
                  document.add(field);
                  i++;
               }
            }
            reader.close();
         } 
         catch (IOException e) {
             e.printStackTrace();
         }
      } 
      else {
         System.out.println("File name does not match.");
      }

      // TextField contentField = new TextField("contents", new FileReader(file));
      // TextField fileNameField = new TextField("filename", file.getName(), Field.Store.YES);
      // TextField filePathField = new TextField("filepath", file.getCanonicalPath(), Field.Store.YES);

      // document.add(contentField);
      // document.add(fileNameField);
      // document.add(filePathField);

      return document;
   }

   private void indexFile(File file) throws IOException {
      System.out.println("Indexing " + file.getCanonicalPath());
      Document document = getDocument(file);
      writer.addDocument(document);
   }

   public int createIndex(String dataDirPath, FileFilter filter)
         throws IOException {
      
      File f = new File(dataDirPath);
      //System.out.println("File path: " + f.getAbsolutePath());
      File[] files = f.listFiles();
      if (files != null) {
         // Use the files array
         System.out.println("Number of files: " + files.length);
         for (File file : files) {
            if (!file.isDirectory()
                  && !file.isHidden()
                  && file.exists()
                  && file.canRead()
                  && filter.accept(file)) {
               indexFile(file);
            }
         }
         return writer.numRamDocs();
      } else {
         // Handle the case where listFiles() returns null
         System.out.println("Unable to list files in directory: " + dataDirPath);
      }
      return 0;
      
   }
}