import java.io.File;
import java.io.IOException;
import java.io.FileReader;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Set;

import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.StoredFields;
import org.apache.lucene.index.Terms;
import org.apache.lucene.index.TermsEnum;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.index.IndexableField;

import org.apache.lucene.document.Document;
import org.apache.lucene.queryparser.classic.ParseException;
import org.apache.lucene.index.Term;
import org.apache.lucene.util.BytesRef;
import py4j.GatewayServer; 


public class StatsCalculator {

    public static void main(String[] args) throws IOException {
        String currentDirectory = System.getProperty("user.dir");
        System.out.println("Current directory: " + currentDirectory);
        System.out.println("Indexing to directory: " + currentDirectory + "/Assignment_2/index");
        String indexDirPath = "Assignment_2/index"; 
        GatewayServer g = new GatewayServer(new StatsCalculator()); 
		g.start(); 
		System.out.println("Gateway Server Started"); 
        // double avg = getAvgDocLen(indexDirPath, "abstract");
        // System.out.println("Average Document Length: " + avg);
    }

    public static int add(int a, int b) { return a+b; } 

    public static String Message() { return "Python Client Working"; } 

    public static void calculateStats(String indexDirPath, String searchQuery) throws IOException, ParseException {
        try (Directory indexDir = FSDirectory.open(new File(indexDirPath).toPath());
             IndexReader indexReader = DirectoryReader.open(indexDir)) {
    
            int numDocs = indexReader.numDocs();
            System.out.println("Total number of documents in the corpus: " + numDocs);
    
            for (int i=0; i<numDocs; i++) {
                StoredFields sf = indexReader.storedFields();
                Document doc = sf.document(i);
                if (doc != null) {
                    System.out.println(doc.getFields().size());
                    // for (int i = 0; i < 10; i++) {
                    //     System.out.println(i + " " + doc.getFields().get(i).name() + ": " + doc.getFields().get(i).stringValue().substring(0, Math.min(doc.getFields().get(i).stringValue().length(), 150)));
                    // }
                    for (IndexableField field : doc.getFields()) {
                        System.out.println("Field: " + field.name() + "--> " + field.stringValue().substring(0, Math.min(field.stringValue().length(), 150)));
                        Terms terms = indexReader.getTermVector(i, field.name());
                        if(terms==null) System.out.println("No terms found for field: " + field.name());
                        if (terms != null) {
                            System.out.println(terms.size());
                            TermsEnum termsEnum = terms.iterator();
                            BytesRef term = null;
                            while ((term = termsEnum.next()) != null) {
                                String termText = term.utf8ToString();
                                Term termInstance = new Term(field.name(), term);     
                                //System.out.println("termText: " + termText);

                                // Term frequency (tf) in current document
                                long tf = termsEnum.totalTermFreq();

                                // Document frequency (df)
                                int df = indexReader.docFreq(termInstance);
    
                                // Collection frequency (cf)
                                long cf = indexReader.totalTermFreq(termInstance);
    
                                //System.out.println("Field: " + field.name());
                                System.out.println("Term: " + termText);
                                System.out.println("Document Frequency (df): " + df);
                                System.out.println("Collection Frequency (cf): " + cf);
                                System.out.println("Term Frequency (tf) in Current Document: " + tf);
                            }
                        }                        
                    }
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static int getDocFreq(String indexDirPath, String field, String query_term) throws IOException, ParseException {
        try (Directory indexDir = FSDirectory.open(new File(indexDirPath).toPath());
             IndexReader indexReader = DirectoryReader.open(indexDir)) {
    
            int numDocs = indexReader.numDocs();
            HashMap<String, Integer> hashMap = new HashMap<>();
    
            for (int i=0; i<numDocs; i++) {
                Terms terms = indexReader.getTermVector(i, field);
                if (terms != null) {
                    TermsEnum termsEnum = terms.iterator();
                    BytesRef term = null;
                    while ((term = termsEnum.next()) != null) {
                        String termText = term.utf8ToString();
                        Term termInstance = new Term(field, term);     
                        // Document frequency (df)
                        int df = indexReader.docFreq(termInstance);
                        hashMap.put(termText, df);
                    }
                }                        
            }

            if (hashMap.containsKey(query_term)) {
                int df = hashMap.get(query_term);
                System.out.println("Case 1 : " + df);
                return df;
            } else {
                System.out.println("Case 2 : 0");
                return 0;
            }
        } 
        catch (IOException e) {
            e.printStackTrace();
        }
        System.out.println("Case 3 : catch");
        return 0;
    }
    
        
    public static int getCollectionFreq(String indexDirPath, String field, String query_term) throws IOException, ParseException {
        try (Directory indexDir = FSDirectory.open(new File(indexDirPath).toPath());
             IndexReader indexReader = DirectoryReader.open(indexDir)) {
    
            int numDocs = indexReader.numDocs();
            HashMap<String, Integer> hashMap = new HashMap<>();
    
            for (int i=0; i<numDocs; i++) {
                Terms terms = indexReader.getTermVector(i, field);
                if (terms != null) {
                    TermsEnum termsEnum = terms.iterator();
                    BytesRef term = null;
                    while ((term = termsEnum.next()) != null) {
                        String termText = term.utf8ToString();
                        Term termInstance = new Term(field, term);

                        // Collection frequency (cf)
                        long tf = indexReader.totalTermFreq(termInstance);
                        if (!hashMap.containsKey(termText)) {
                            hashMap.put(termText, (int) tf);                        
                        } 
                    }
                }                        
            }

            if (hashMap.containsKey(query_term)) {
                int cf = hashMap.get(query_term);
                return cf;
            } else {
                return 0;
            }
        } 
        catch (IOException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public static int getTermFreq(String indexDirPath, String field, String query_term, int docId) throws IOException, ParseException {
        try (Directory indexDir = FSDirectory.open(new File(indexDirPath).toPath());
             IndexReader indexReader = DirectoryReader.open(indexDir)) {
    
            HashMap<String, Integer> hashMap = new HashMap<>();    
            Terms terms = indexReader.getTermVector(docId, field);
            if (terms != null) {
                TermsEnum termsEnum = terms.iterator();
                BytesRef term = null;
                while ((term = termsEnum.next()) != null) {
                    String termText = term.utf8ToString();
                    Term termInstance = new Term(field, term);   

                    long tf = termsEnum.totalTermFreq();
                    hashMap.put(termText, (int) tf);
                }
            }   
            if (hashMap.containsKey(query_term)) {
                int tf = hashMap.get(query_term);
                return (int)tf;
            } else {
                return 0;
            }                     
        }    
        catch (IOException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public static double getAvgDocLen(String indexDirPath, String field) throws IOException {
        try (Directory indexDir = FSDirectory.open(new File(indexDirPath).toPath());
             IndexReader indexReader = DirectoryReader.open(indexDir)) {

            int numDocs = indexReader.numDocs();
            long totalTerms = 0;
            long totalDocLength = 0;

            for (int i = 0; i < numDocs; i++) {
                Terms terms = indexReader.getTermVector(i, field); 
                if (terms != null) {
                    totalTerms += terms.size();
                    totalDocLength += terms.getSumTotalTermFreq();
                }
            }

            // System.out.println(totalDocLength);
            // System.out.println(totalTerms);
            double avgDocLength = (double) totalDocLength / numDocs;
            return avgDocLength;
        }
    }

    public static int getCollectionLen(String indexDirPath, String field) throws IOException {
        try (Directory indexDir = FSDirectory.open(new File(indexDirPath).toPath());
             IndexReader indexReader = DirectoryReader.open(indexDir)) {

            int numDocs = indexReader.numDocs();
            long totalTerms = 0;
            long totalDocLength = 0;

            for (int i = 0; i < numDocs; i++) {
                Terms terms = indexReader.getTermVector(i, field); // Replace "content" with your field name
                if (terms != null) {
                    totalTerms += terms.size();
                    totalDocLength += terms.getSumTotalTermFreq();
                }
            }

            return (int) totalDocLength;
        }
    }

    public static int numDocs(String indexDirPath) throws IOException {
        try (Directory indexDir = FSDirectory.open(new File(indexDirPath).toPath());
             IndexReader indexReader = DirectoryReader.open(indexDir)) {

            int numDocs = indexReader.numDocs();
            return numDocs;
        }
    }

    public static String getDocId(String indexDirPath, int docno) throws IOException {
        try (Directory indexDir = FSDirectory.open(new File(indexDirPath).toPath());
             IndexReader indexReader = DirectoryReader.open(indexDir)) {

            StoredFields sf = indexReader.storedFields();
            Document doc = sf.document(docno);   
            IndexableField id_Field = doc.getField("id");         
            String id = id_Field.stringValue();

            indexReader.close();
            return id;
        }
    }

    public static int getDocumentLen(String indexDirPath, String field, int docId) throws IOException {
        try (Directory indexDir = FSDirectory.open(new File(indexDirPath).toPath());
             IndexReader indexReader = DirectoryReader.open(indexDir)) {

            Terms terms = indexReader.getTermVector(docId, field);
            int documentLength = 0;

            // Iterate over the terms in the term vector
            if (terms != null) {
                TermsEnum termsEnum = terms.iterator();
                while (termsEnum.next() != null) {
                    // Increment the document length for each term occurrence
                    documentLength += termsEnum.totalTermFreq();
                }
            }

            return documentLength;
        }
    }

    public static Set<String> buildVocabulary(String indexDirPath, String field) throws IOException {
        Set<String> vocabulary = new HashSet<>();

        try (Directory indexDir = FSDirectory.open(new File(indexDirPath).toPath());
             IndexReader indexReader = DirectoryReader.open(indexDir)) {

            // Iterate over all terms in the index
            for (int docId = 0; docId < indexReader.maxDoc(); docId++) {
                Terms terms = indexReader.getTermVector(docId, field);
                if (terms != null) {
                    TermsEnum termsEnum = terms.iterator();
                    while (termsEnum.next() != null) {
                        String termText = termsEnum.term().utf8ToString();
                        vocabulary.add(termText);
                    }
                }
            }
        }

        return vocabulary;
    }

    //Debugging functions

    public static int checkFn(String indexDirPath, String field, String query_term) throws IOException, ParseException {
        try (Directory indexDir = FSDirectory.open(new File(indexDirPath).toPath());
             IndexReader indexReader = DirectoryReader.open(indexDir)) {
    
            int numDocs = indexReader.numDocs();
            StoredFields sf = indexReader.storedFields();
            int cf = 0;
            int df = 0;
            
            for (int i=0;i<numDocs;i++){
                Document doc = sf.document(i);   
                IndexableField Field = doc.getField(field);
                String val = Field.stringValue();
                String[] terms = val.split(" ");
                int flag = 0;
                for (String term : terms) {
                    if(term.toLowerCase().equals(query_term.toLowerCase())) {
                        flag = 1;
                        cf++;
                    }
                }
                if(flag==1) {
                   df++;
                }
            }
            int df_ = getDocFreq(indexDirPath, field, query_term);
            int cf_ = getCollectionFreq(indexDirPath, field, query_term);
            System.out.println(query_term);
            System.out.println("CF: " + cf + " CF_: " + cf_);
            System.out.println("DF: " + df + " DF_: " + df_);
            return cf-cf_;
                                   
        } 
        catch (IOException e) {
            e.printStackTrace();
        }
        return 0;
    }
    public static int checkFn2(String indexDirPath, String field, String query_term, int docid) throws IOException, ParseException {
        try (Directory indexDir = FSDirectory.open(new File(indexDirPath).toPath());
             IndexReader indexReader = DirectoryReader.open(indexDir)) {
    
            int numDocs = indexReader.numDocs();
            StoredFields sf = indexReader.storedFields();
            int tf = 0;
            
            Document doc = sf.document(docid);   
            IndexableField Field = doc.getField(field);
            String val = Field.stringValue();
            String[] terms = val.split(" ");
            for (String term : terms) {
                System.out.println(term);
                if(term.toLowerCase().equals(query_term.toLowerCase())) {
                    tf++;
                }
            }
            int tf_ = getTermFreq(indexDirPath, field, query_term, docid);
            System.out.println(tf + " " + tf_);
            return tf-tf_;
                                   
        } 
        catch (IOException e) {
            e.printStackTrace();
        }
        return 0;
    }
}
