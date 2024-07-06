import java.io.File;
import java.io.IOException;

import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.index.CorruptIndexException;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.index.StoredFields;
import org.apache.lucene.queryparser.classic.ParseException;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashSet;
import java.util.Set;
import org.apache.lucene.analysis.CharArraySet;

public class Searcher {

   IndexSearcher indexSearcher;
   QueryParser queryParser;
   Query query;

   public Searcher(String indexDirectoryPath)
         throws IOException {
        Directory indexDirectory = FSDirectory.open(new File(indexDirectoryPath).toPath());
        DirectoryReader reader = DirectoryReader.open(indexDirectory);
        indexSearcher = new IndexSearcher(reader);
        String filePath = "Assignment_2/nfcorpus/raw/stopwords.large"; 
        CharArraySet stopwordsSet = readStopwordsFromFile(filePath);
        queryParser = new QueryParser(LuceneConstants.TITLE,new StandardAnalyzer(stopwordsSet));
   }

   public TopDocs search(String searchQuery)
         throws IOException, ParseException {
      query = queryParser.parse(searchQuery);
      return indexSearcher.search(query, LuceneConstants.MAX_SEARCH);
   }

   public Document getDocument(ScoreDoc scoreDoc)
         throws CorruptIndexException, IOException {
      StoredFields storedFields = indexSearcher.storedFields();
      return storedFields.document(scoreDoc.doc);
   }

   public void close() throws IOException {
      indexSearcher.getIndexReader().close();
   }
   public static CharArraySet readStopwordsFromFile(String filePath) throws IOException {
    Set<String> stopwordsSet = new HashSet<>();

    try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
        String line;
        while ((line = reader.readLine()) != null) {
            stopwordsSet.add(line);
        }
    }

    return new CharArraySet(stopwordsSet, true);
}
}

