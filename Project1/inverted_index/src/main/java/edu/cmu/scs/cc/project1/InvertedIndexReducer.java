package edu.cmu.scs.cc.project1;

import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Reducer;

import java.io.IOException;
import java.util.*;

import java.io.FileWriter;

public class InvertedIndexReducer
        extends Reducer<Text, Text, Text, Text> {

    /**
     * The reduce function to run the inverted index job.
     *
     * TODO: Implement the reduce method.
     *
     * Output (word, inputFiles) key/value pair.
     *
     * inputFiles: (filename1,filename2,...)
     *
     * You may want to read the Javadoc of
     * {@link StringJoiner#StringJoiner(CharSequence, CharSequence, CharSequence)}
     * to construct strings with the required output format.
     *
     * the file names should be in ascending lexicographical order
     *
     * @param key     input key of reducer
     * @param values  input values of reduce which is iterable
     * @param context output key/value pair of reducer
     */
    @Override
    public void reduce(Text key, Iterable<Text> values, Context context) throws IOException, InterruptedException {
        StringJoiner sj = new StringJoiner(",", "(", ")");
        HashSet<String> hs = new HashSet<>();

        for (Text v: values) {
            hs.add(v.toString());
        }
        // Ugly solution involving first storing strings in hashmap for unique vals only
        // Then putting into list for lexicographic ordering
        ArrayList<String> sorted_list = new ArrayList<>(hs);
        Collections.sort(sorted_list);
        for (String val: sorted_list) {
            sj.add(val);
        }

        Text val = new Text(sj.toString());
//        FileWriter temp = new FileWriter("reduce_output_print.txt", true);
//        temp.write("THIS IS OUR CURRENT SET OF FILES: " + val + "\n");
//        temp.close();
        context.write(key,val);
    }
}