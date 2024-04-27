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
import org.apache.lucene.index.PostingsEnum;
import org.apache.lucene.index.Terms;
import org.apache.lucene.index.TermsEnum;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.search.DocIdSetIterator;
import org.apache.lucene.index.MultiFields;
import org.apache.lucene.document.FieldType;

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

   private Document getDocument(File file, String line) throws IOException {
      Document document = new Document();
      FieldType fieldType = new FieldType(TextField.TYPE_STORED);
      fieldType.setStoreTermVectors(true);

      Field filePathField = new Field("filepath", file.getCanonicalPath(), fieldType);
      document.add(filePathField);

      if (isFileEqualsName(file, "doc_dump.txt")) {
         String[] stringArray = {"id", "url", "title", "abstract"};
         String[] parts = line.split("\t");
         int i = 0;
         for (String part : parts) {
            if(i!=1){
               Field field = new Field(stringArray[i], part, fieldType);
               document.add(field);
            }
            i++;
         }
      } 
      else if (isFileEqualsName(file, "nfdump.txt")) {
         String[] stringArray = {
         "id", "url", "title", "maintext", "comments", "topics tags", 
         "description", "doctors note", "article links", "question links", 
         "topic links", "video links", "medarticle links"
         };
         String[] parts = line.split("\t");
         int i = 0;
         int ignore[] = {1,8,9,10,11,12};
         String abs = "";
         
         for (String part : parts) {
            if(i==0 || i==2){
               Field field = new Field(stringArray[i], part, fieldType);
               document.add(field);
            }
            else if(i==1 || i>=8){
               
            }
            else{
               abs += part;
               abs += " ";
            }
            i++;
         }
         Field field = new Field("abstract", abs, fieldType);
         document.add(field);

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
      try {
         BufferedReader reader = new BufferedReader(new FileReader(file));
         String line;
         while ((line = reader.readLine()) != null) {
            Document document = getDocument(file, line);
            writer.addDocument(document);
         }
         reader.close();
      } 
      catch (IOException e) {
          e.printStackTrace();
      }
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

   public void getPostings(String field, int docID) {
      String indexDirectoryPath = "Assignment_2/index";
      try (IndexReader reader = DirectoryReader.open(FSDirectory.open(new File(indexDirectoryPath).toPath()))) {
         Terms terms = reader.getTermVector(docID, field);
         if (terms != null) {
            TermsEnum termsEnum = terms.iterator();
            while (termsEnum.next() != null) {
               String termText = termsEnum.term().utf8ToString();
               PostingsEnum postings = termsEnum.postings(null);
                 
               int docFreq = termsEnum.docFreq();
               int termFreq = 0;
               while (postings.nextDoc() != PostingsEnum.NO_MORE_DOCS) {
                  termFreq += postings.freq();
               }  
             }
         }
     } 
     catch (IOException e) {
         System.err.println("An IOException occurred: " + e.getMessage());
         e.printStackTrace();
      }
   }
}