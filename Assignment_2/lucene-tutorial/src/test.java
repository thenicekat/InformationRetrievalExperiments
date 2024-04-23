import java.io.File;
import java.io.IOException;
import java.io.FileReader;

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
public class test {

    public static void main(String[] args) throws IOException {
        String indexDirPath = "index"; // Path to your Lucene index directory

        readingIndex(indexDirPath,1);
    }

    //@param index path to index directory
//@param docNbr the document number in the index
    public static void readingIndex(String index, int docNbr) {
        IndexReader reader = DirectoryReader.open(FSDirectory.open(new File(index)));

        Document doc = reader.document(docNbr);         
        System.out.println("Processing file: "+doc.get("id"));

        Terms termVector = reader.getTermVector(docNbr, "contents");
        TermsEnum itr = termVector.iterator(null);
        BytesRef term = null;

        while ((term = itr.next()) != null) {               
            String termText = term.utf8ToString();                              
            long termFreq = itr.totalTermFreq();   //FIXME: this only return frequency in this doc
            long docCount = itr.docFreq();   //FIXME: docCount = 1 in all cases 

            System.out.println("term: "+termText+", termFreq = "+termFreq+", docCount = "+docCount);   
        }            

        reader.close();     
    }

}

