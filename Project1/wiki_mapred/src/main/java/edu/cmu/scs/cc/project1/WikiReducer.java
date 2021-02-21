package edu.cmu.scs.cc.project1;

import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Reducer;

/**
 * Reducer Utility.
 */
public class WikiReducer
        extends Reducer<Text, Text, Text, Text> {

    public void reduce(Text key, Iterable<Text> values, Context context) {
        // TODO: Implement the code here for the reducer of the wiki data analysis task,
        // you may need to change the key/value pair format as per your design.
    }
}
