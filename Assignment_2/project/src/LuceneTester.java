import java.io.File;
import java.io.FileReader;
import java.io.IOException;

import org.apache.lucene.document.Document;
import org.apache.lucene.queryparser.classic.ParseException;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.index.IndexableField;

public class LuceneTester {
	
   String indexDir = "Assignment_2/index";
   String dataDir = "Assignment_2/nfcorpus/raw";
   Indexer indexer;
   Searcher searcher;

   public static void main(String[] args) {
      LuceneTester tester;
      try {
         tester = new LuceneTester();
         tester.createIndex();
         tester.search("Birth");
      } catch (IOException e) {
         e.printStackTrace();
      } catch (
         ParseException e) {
         e.printStackTrace();
      }
   }

   private void createIndex() throws IOException {
      indexer = new Indexer(indexDir);
      int numIndexed;
      long startTime = System.currentTimeMillis();	
      numIndexed = indexer.createIndex(dataDir, new TextFileFilter());
      long endTime = System.currentTimeMillis();
      indexer.close();
      System.out.println(numIndexed+" File indexed, time taken: "
         +(endTime-startTime)+" ms");		
   }

   private void search(String searchQuery) throws IOException, ParseException {
      searcher = new Searcher(indexDir);
      long startTime = System.currentTimeMillis();
      TopDocs hits = searcher.search(searchQuery);
      long endTime = System.currentTimeMillis();
      System.out.println(hits.totalHits +
         " documents found. Time :" + (endTime - startTime));
      for(ScoreDoc scoreDoc : hits.scoreDocs) {
         Document doc = searcher.getDocument(scoreDoc);
         if (doc != null) {
            String id = doc.get("id");
            System.out.println("Document ID: " + id);
            System.out.println("Document found with fields:");
            for (IndexableField field : doc.getFields()) {
               String v = field.stringValue().substring(0, Math.min(field.stringValue().length(), 50));
               System.out.println(field.name() + " : " + v); //
            }
            System.out.println("File: "+ doc.get(LuceneConstants.FILE_PATH));
            FileReader fr = new FileReader(new File(doc.get(LuceneConstants.FILE_PATH)));
            fr.close();
         } else {
            // Document is null, handle the case when no document is found
            System.out.println("No document found.");
         }

         // System.out.println("File: "+ doc.get(LuceneConstants.FILE_PATH));
         // FileReader fr = new FileReader(new File(doc.get(LuceneConstants.FILE_PATH)));
         // char [] buf = new char[10000];
         // fr.read(buf);
         // System.out.println(buf);
         // fr.close();
      }
      searcher.close();
   }
}